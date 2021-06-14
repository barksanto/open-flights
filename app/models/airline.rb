class Airline < ApplicationRecord
  has_many :reviews

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
