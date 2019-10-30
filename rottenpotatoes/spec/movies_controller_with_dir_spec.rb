require 'rails_helper'
require 'movies_controller'

RSpec.describe MoviesController, :type => :controller do
    
    context 'POST create' do
        it "takes parameters from a form and returns a Movie object" do
            @movie = Movie.create({:title => 'Star Wars', :rating => 'PG', :description => '', :release_date => '1977-05-25', :director => 'George Lucas'})
            expect(@movie.title).to eq('Star Wars')
            expect(@movie.rating).to eq('PG')
            expect(@movie.description).to eq('')
            expect(@movie.release_date).to eq('25-May-1977')
            expect(@movie.director).to eq('George Lucas')
        end

        it "raises an error if missing params of movie" do
            params = {:title => 'Star Wars', :rating => 'PG', :description => '', :release_date => '1977-05-25'}
            expect do 
                post :create, params
            end.to raise_error ActionController::ParameterMissing
        end
    end


    describe 'updating the director information', :type => :routing do
        it "should update the director of Alien as Ridley Scott" do
            m = Movie.create({:title => 'Alien', :rating => 'R', :description => '', :release_date => '1979-05-25', :director => ''})
            expect(m.director).to eq('')
            params = {m: {director: 'Ridley Scott'}}
            post :edit
        end
    end

    describe MoviesController, :type => :controller do
        context 'the movie has given director information' do
            it 'display similar movies with same directors view' do
                Amovie = Movie.create(:title => "MovieA", :director => "Asli")
                Bmovie = Movie.create(:title => "MovieB", :director => "Asli")
                get :list_similar, :id => Amovie
                expect(response).to render_template("list_similar")
            end
        end

    end

end