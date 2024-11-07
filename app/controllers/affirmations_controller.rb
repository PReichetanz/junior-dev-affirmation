class AffirmationsController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.admin_name!, password: Rails.application.credentials.admin_secret, except: :random
  def index
    @affirmations = Affirmation.all
  end
  def show
    @affirmation = Affirmation.find(params[:id])
  end

  # Show random affirmation on index page
  def random
    affirmations = Affirmation.all
    @randomAffirmation = affirmations.sample
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

  # Delete entry
  def destroy
    @affirmation = Affirmation.find(params[:id])
    @affirmation.destroy

    redirect_to "/affirmations", status: :see_other
  end

  # Make sure only allowed params are sent
  private
    def affirmation_params
      params.require(:affirmation).permit(:text)
    end
end
