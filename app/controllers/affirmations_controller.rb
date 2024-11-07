class AffirmationsController < ApplicationController
  def index
    @affirmations = Affirmation.all
  end
  def show
    @affirmation = Affirmation.find(params[:id])
  end
end
