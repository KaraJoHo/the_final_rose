class Bachelorette <ApplicationRecord
  belongs_to :season
  has_many :contestants

  def contestant_average_age 
    contestants.average(:age)
  end

  def contestant_hometowns 
    contestants.select(:hometown).distinct.pluck(:hometown)
  end
end
