class AnswersController < ApplicationController
  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = 'Answer has been created'
      redirect_to @answer
    else
      flash[:alert] = 'Answer has not been created'
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:success] = 'Answer has been updated'
      redirect_to @answer
    else
      flash[:alert] = 'Answer has not been updated'
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:success] = 'Answer has been deleted'
    redirect_to questions_url
  end
end
