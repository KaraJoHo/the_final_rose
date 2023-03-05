require 'rails_helper'

RSpec.describe ContestantOuting do 
  describe 'relationships' do 
    it {should belong_to :outing}
    it {should belong_to :contestant}
  end
end