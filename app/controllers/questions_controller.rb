class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'Question has been created'
      redirect_to @question
    else
      flash[:alert] = 'Question has not been created'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = 'Question has been created'
      redirect_to @question
    else
      flash[:alert] = 'Question has not been created'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:success] = 'Question has been deleted'
    redirect_to questions_url
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
