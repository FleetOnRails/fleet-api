class AddDateToFuelEntry < ActiveRecord::Migration
  def change
    add_column :fuel_entries, :date, :datetime
  end
end
