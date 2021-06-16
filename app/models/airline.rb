class Airline < ApplicationRecord
  has_many :reviews

  # set the slug for our airline before its created in our db.
  before_create :slugify

  def slugify
    # creates url safe version of the name for the slug
    # hypehantes the spaces + lowercases everything
    self.slug = name.parameterize
  end

  def avg_score
    reviews.average(:score).round(2).to_f
  end
end
