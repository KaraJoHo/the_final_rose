require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should belong_to :season}
    it {should have_many :contestants}
  end

  before(:each) do 
    @season15 = Season.create!(description: "Crazy. It was like so crazy")
    @season16 = Season.create!(description: "It was subpar")

    @bachelorette = Bachelorette.create!(name: "Joey", season_number: 15, season_id: @season15.id)
    @bachelorette_2 = Bachelorette.create!(name: "Sam", season_number: 16, season_id: @season16.id)
    
    @c_1 = @bachelorette.contestants.create!(name: "Tom", age: 25, hometown: "Denver")
    @c_2 = @bachelorette.contestants.create!(name: "Bob", age: 30, hometown: "Austin")
    @c_3 = @bachelorette.contestants.create!(name: "Benedict", age: 280, hometown: "Denver")

    @c_4 = @bachelorette_2.contestants.create!(name: "Simon", age: 25, hometown: "Not Denver")

    @outing_1 = Outing.create!(name: "Skydiving", location: "The sky", date: "09/16/12")
    @outing_2 = Outing.create!(name: "Axe Throwing", location: "Dungeon", date: "09/19/12")
    @outing_3 = Outing.create!(name: "Horse Riding", location: "The sky", date: "09/23/12")

    @c_o_1 = ContestantOuting.create!(contestant_id: @c_1.id, outing_id: @outing_1.id)
    @c_o_2 = ContestantOuting.create!(contestant_id: @c_1.id, outing_id: @outing_2.id)
    @c_o_3 = ContestantOuting.create!(contestant_id: @c_1.id, outing_id: @outing_3.id)
    @c_o_4 = ContestantOuting.create!(contestant_id: @c_2.id, outing_id: @outing_1.id)
    @c_o_5 = ContestantOuting.create!(contestant_id: @c_3.id, outing_id: @outing_1.id)
    @c_o_6 = ContestantOuting.create!(contestant_id: @c_3.id, outing_id: @outing_2.id)
  end

  describe '#contestant_average_age' do 
    it 'is the average age of contestants' do 
      expect(@bachelorette.contestant_average_age.to_f.round(1)).to eq(111.7)
    end
  end

  describe '#contestant_hometowns' do 
    it 'is a unique list of hometowns of the contestants' do 
      expect(@bachelorette.contestant_hometowns).to match_array(["Denver", "Austin"])
    end
  end
end
