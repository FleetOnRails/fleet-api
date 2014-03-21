class AddLatLongToGpsStatistic < ActiveRecord::Migration
  def change
    add_column :gps_statistics, :latitude, :float
    add_column :gps_statistics, :longitude, :float
  end
end
