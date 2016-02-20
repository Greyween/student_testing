class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      flash[:success] = 'Test has been successfully created'
      redirect_to @test
    else
      flash[:alert] = 'Test has not been created'
      render :new
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      flash[:success] = 'Test has been successfully updated'
      redirect_to @test
    else
      flash[:alert] = 'Test has not been updated'
      render :edit
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    flash[:success] = 'Test has been successfully deleted'
    redirect_to tests_url
  end

  private

  def test_params
    params.require(:test).permit(:name, :description)
  end
end
