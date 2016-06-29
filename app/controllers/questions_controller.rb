class QuestionsController < ApplicationController
  before_filter :find_question, only: [:show, :edit, :update, :destroy, :answer]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] =  "Question created successfully."
      @questions = Question.all
      render 'success'
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      flash[:notice] = "Question edited successfully."
      @questions = Question.all
      render 'success'
    else
      render 'edit'
    end
  end

  def destroy
    @questions = Question.all
    if @question.destroy
      flash[:notice] = "Question edited successfully."
      render 'success'
    else
      render 'index'
    end
  end

  def answer
    @user_answer = params[:answer][:answer]
    @result = @question.answer_matches?(@user_answer.to_s.downcase)
    render 'answer'
  end

  private
    def find_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:question, :answer)
    end
end
