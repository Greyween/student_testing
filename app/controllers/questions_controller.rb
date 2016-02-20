class QuestionsController < ApplicationController
  before_action :find_test

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      flash[:success] = 'Question has been created'
      redirect_to test_path(@test)
    else
      flash[:alert] = 'Question has not been created'
      render :new
    end
  end

  def edit
    @question = @test.questions.find(params[:id])
  end

  def update
    @question = @test.questions.find(params[:id])
    if @question.update(question_params)
      flash[:success] = 'Question has been created'
      redirect_to test_path(@test)
    else
      flash[:alert] = 'Question has not been created'
      render :edit
    end
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy
    flash[:success] = 'Question has been deleted'
    redirect_to test_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:content, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
