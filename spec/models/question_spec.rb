require 'rails_helper'

describe Question do
  it 'is invalid without question' do
    expect(build(:question, question: nil)).to_not be_valid
  end

  it 'is invalid without answer' do
    expect(build(:question, answer: nil)).to_not be_valid
  end

  describe 'answer_matches?' do
    it 'return false if the answer is incorrect' do
      expect(Question.new(answer: "Jakarta").answer_matches?("Bandung")).to be false
      expect(Question.new(answer: "Jakarta").answer_matches?("Jakarta")).to be true
    end

    it 'should ignores case' do
      expect(Question.new(answer: "Jakarta").answer_matches?("jakarta")).to be true
    end

    it 'should understand numbers as words and vice versa' do
      expect(Question.new(answer: "7").answer_matches?("seven")).to be true
      expect(Question.new(answer: "seven").answer_matches?("7")).to be true
    end
  end
end