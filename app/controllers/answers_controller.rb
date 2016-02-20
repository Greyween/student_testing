class AnswersController < ApplicationController
  before_action :find_question

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      flash[:success] = 'Answer has been created'
      redirect_to [@test, @question]
    else
      flash[:alert] = 'Answer has not been created'
      render :new
    end
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end

  def update
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:success] = 'Answer has been updated'
      redirect_to [@test, @question]
    else
      flash[:alert] = 'Answer has not been updated'
      render :edit
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:success] = 'Answer has been deleted'
    redirect_to [@test, @question]
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :correct, :question_id)
  end

  def find_question
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
  end
end
