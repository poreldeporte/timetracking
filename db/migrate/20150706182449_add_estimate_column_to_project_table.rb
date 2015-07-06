class AddEstimateColumnToProjectTable < ActiveRecord::Migration
  def change
  	add_column(:projects, :estimate, :integer)
  end
end
