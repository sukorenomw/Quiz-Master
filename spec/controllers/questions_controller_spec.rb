require 'rails_helper'

describe QuestionsController do
  let(:question) { FactoryGirl.create :question }   

  describe "GET #index" do
    it "show the list of questions" do
      get :index
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    it "expect if question successfully created" do 
      expect{
        post :create, question: FactoryGirl.attributes_for(:question)
      }.to change(Question, :count).by(1)
    end
  end

  describe "POST #answer" do
    it "should assign @user_answer" do
      dummy_params = { answer: {answer: "Jakartax"}, id: question.id }
      post :answer, dummy_params
      expect(assigns(:user_answer)).to_not be_nil 
    end
  end

  describe "PUT #update" do
    it "expect if question successfully updated" do
      test_question = { question: "foo", answer: "Bar" }
      
      put :update, id: question.id, question: test_question 
      expect(response).to render_template(:layout => nil)
    end
  end

  describe "DELETE #destroy" do
    it "delete the question" do
      expect{
        delete :destroy, id: question.id
      }.to change(Question, :count).by(0)
    end
  end
end
