class RemoveServiceRecords < ActiveRecord::Migration
  def change
    drop_table :service_records
  end
end
