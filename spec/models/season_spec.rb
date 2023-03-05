require 'rails_helper' 

RSpec.describe Season do 
  describe 'relationships' do 
    it {should have_one :bachelorette}
  end
end