require 'rails_helper'

RSpec.describe Outing do 
  describe 'relationships' do 
    it {should have_many(:contestant_outings)}
    it {should have_many(:contestants).through(:contestant_outings)}
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
    @outing_3 = Outing.create!(name: "Horse Riding", location: "Field", date: "09/23/12")

    @c_o_1 = ContestantOuting.create!(contestant_id: @c_1.id, outing_id: @outing_1.id)
    @c_o_2 = ContestantOuting.create!(contestant_id: @c_1.id, outing_id: @outing_2.id)
    @c_o_3 = ContestantOuting.create!(contestant_id: @c_1.id, outing_id: @outing_3.id)
    @c_o_4 = ContestantOuting.create!(contestant_id: @c_2.id, outing_id: @outing_1.id)
    @c_o_5 = ContestantOuting.create!(contestant_id: @c_3.id, outing_id: @outing_1.id)
    @c_o_6 = ContestantOuting.create!(contestant_id: @c_3.id, outing_id: @outing_2.id)
  end 

  describe '#number_of_contestants' do 
    it 'is the number of contestants on an outing' do 
      expect(@outing_1.number_of_contestants).to eq(3)
    end
  end
  describe "#contestant_names" do 
    it 'is a list of contestant names' do 
      expect(@outing_1.contestant_names).to eq(["Tom", "Bob", "Benedict"])
    end
  end
end