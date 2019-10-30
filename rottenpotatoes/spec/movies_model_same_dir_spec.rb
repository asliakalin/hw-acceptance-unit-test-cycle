require 'rails_helper'

describe Movie, '.movies share same director' do
    it 'finds movies that have the same director' do
        movie_1 = Movie.create(:title => "MovieA", :director => "Asli")
        movie_2 = Movie.create(:title => "MovieB", :director => "Asli")
        movie_3 = Movie.create(:title => "MovieC", :director => "Asli")
        movie_4 = Movie.create(:title => "MovieD", :director => "Not Asli")
        
        result = movie_1.matching_director

        expect(result).to include(movie_1, movie_2, movie_3)
    end
end

