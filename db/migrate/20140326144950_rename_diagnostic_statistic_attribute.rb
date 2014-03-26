class RenameDiagnosticStatisticAttribute < ActiveRecord::Migration
  def change
    rename_column :diagnostic_statistics, 'l/100km', :l100km
  end
end
