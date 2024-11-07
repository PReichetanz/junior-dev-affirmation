class Affirmation < ApplicationRecord
  validates :text, presence: true
end
