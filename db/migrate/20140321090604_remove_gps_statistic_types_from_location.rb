class RemoveGpsStatisticTypesFromLocation < ActiveRecord::Migration
  def change
    Location.delete_all(locationable_type: 'GpsStatistic')
  end
end
