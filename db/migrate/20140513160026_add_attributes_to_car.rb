class AddAttributesToCar < ActiveRecord::Migration
  def change
    add_column :cars, :color, :string
    add_column :cars, :description, :text
    add_column :cars, :year, :integer
    add_column :cars, :type, :string
    add_column :cars, :engine_size, :float
    add_column :cars, :transmission, :string
  end
end
