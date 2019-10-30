require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
    context 'the movie does not have given director information' do
        it 'displays the all_movies view' do
            Amovie = Movie.create(:title => "MovieA", :director => "")
            expect(Amovie.new_record?).to eq(false)
            get :list_similar, :id => Amovie
            expect(response).to redirect_to(movies_path)
            expect(flash[:notice]).to eq("'#{Amovie.title}' has no director info")
        end
        
    end

    context 'destroy a movie' do
        it 'displays the all_movies view without the deleted one' do
            Movie.create!({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director=> "asli"})
            @Amovie = Movie.find(Movie.find_by_title("Aladdin").id)
            expect(Amovie.new_record?).to eq(false)
            post :destroy, :id => Amovie
            expect(flash[:notice]).to eq("Movie '#{@Amovie.title}' deleted.")
            expect(response).to redirect_to(movies_path)
            
        end
        
    end
end