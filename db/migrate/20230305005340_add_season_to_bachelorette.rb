class AddSeasonToBachelorette < ActiveRecord::Migration[5.2]
  def change
    add_reference :bachelorettes, :season, foreign_key: true
  end
end
