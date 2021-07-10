class Tweet < ApplicationRecord
<<<<<<< Updated upstream
  validates :text, presence: true
  belongs_to :user
  has_many :comments
=======
>>>>>>> Stashed changes
end
