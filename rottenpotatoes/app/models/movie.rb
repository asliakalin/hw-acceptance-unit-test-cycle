class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end


  def matching_director
    return Movie.where(:director => self.director) unless self.director.blank?
  end

end
