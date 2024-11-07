class AffirmationsController < ApplicationController
  def index
    @affirmations = Affirmation.all
  end
  def show
    @affirmation = Affirmation.find(params[:id])
  end

  def new
    @affirmation = Affirmation.new
  end

  def create
    @affirmation = Affirmation.new(affirmation_params)

    if @affirmation.save
      redirect_to @affirmation
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def affirmation_params
      params.require(:affirmation).permit(:text)
    end
end
