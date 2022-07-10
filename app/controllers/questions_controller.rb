class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)

    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update question_params
      redirect_to questions_path
    else
      render :edit
    end
  end

  private

  def set_question
    @question = Question.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
