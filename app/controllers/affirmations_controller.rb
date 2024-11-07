class AffirmationsController < ApplicationController
  def index
    @affirmations = Affirmation.all
  end
  def show
    @affirmation = Affirmation.find(params[:id])
  end

  # Create and save a new entry
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

  # Edit and update a database entry
  def edit
    @affirmation = Affirmation.find(params[:id])
  end

  def update
    @affirmation = Affirmation.find(params[:id])

    if @affirmation.update(affirmation_params)
      redirect_to @affirmation
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Make sure only allowed params are sent
  private
    def affirmation_params
      params.require(:affirmation).permit(:text)
    end
end
