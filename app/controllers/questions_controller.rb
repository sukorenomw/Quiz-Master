class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
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
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question edited successfully."
      @questions = Question.all
      render 'success'
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @questions = Question.all
    if @question.destroy
      flash[:notice] = "Question edited successfully."
      render 'success'
    else
      render 'index'
    end
  end

  private
    def question_params
      params.require(:question).permit(:question, :answer)
    end
end
