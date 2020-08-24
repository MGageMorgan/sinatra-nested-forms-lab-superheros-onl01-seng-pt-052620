# Ran into issues passing the tests
# I'm giving up on this one. If I really am in a pinch I'll ask for help during project week.
# I need to keep up, and I have a basic understanding of how forms work.
# Because of my heavy work schedule, I need to move on

require 'sinatra/base'
require 'pry'
class App < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end

  post '/teams' do
    @team_name = params[:team][:name]
    @team_motto = params[:team][:motto]
    @hero_name = []
    @hero_power = []
    @hero_bio = [] 

    @team_members = params[:team][:members]
    @team_members.each do |hero|
        @hero_name << hero[:name]
        @hero_power << hero[:power]
        @hero_bio << hero[:bio]
    end

    erb :team
  end
end
