require 'rails_helper'

describe Movie, 'routes for empty list', :type => :routing do
    it 'does not find movies with different directors' do
        movie_1 = Movie.create(:title => "movieA", :director => "Asli")
        movie_2 = Movie.create(:title => "movieB", :director => "Not Asli")
        
        result = movie_1.matching_director
        
        expect(result).not_to include("movieB")
    end
end