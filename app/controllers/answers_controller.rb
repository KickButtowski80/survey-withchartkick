class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end
  
  def new 
    @answer = Answer.new
  end
  
  def create
    @answer = Answer.create(allowed_answers_params)
    if @answer.save
      redirect_to answers_path
    end
  end
  
  private
  
  def allowed_answers_params
    params.require(:answer).permit(:feedback)
  end
    
  
  
end
