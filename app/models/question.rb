class Question < ActiveRecord::Base
  validates_presence_of :question
  validates_presence_of :answer
  
  def answer_matches?(user_answer)
    answer = self.answer.downcase
    user_answer = user_answer.downcase

    answer = answer.to_i.to_words if is_number?(answer)
    user_answer = user_answer.to_i.to_words if is_number?(user_answer)

    puts user_answer

    answer == user_answer
  end

  def is_number?(params)
    Float(params) != nil rescue false
  end
end