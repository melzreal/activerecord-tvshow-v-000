require 'pry'
class Show < ActiveRecord::Base

  def self.highest_rating
    Show.maximum("rating")
  end

  def self.most_popular_show
    rating = self.highest_rating
    Show.find_by(rating)
  end

  def self.lowest_rating
    Show.minimum("rating")
  end

  def self.least_popular_show
    Show.find_by('rating'=> self.lowest_rating)
  end

  def self.ratings_sum
    Show.sum("rating")
  end

  def self.popular_shows
    Show.having("rating > ?", 5)
  end

end
