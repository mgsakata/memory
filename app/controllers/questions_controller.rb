class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)    # Not the final implementation!
    if @question.save
      flash[:success] = "Question successfully created!"
      redirect_to @question
    else
      render 'new'
    end
  end

  private

    def question_params
      params.require(:question).permit(:question, :answer)
    end

end
