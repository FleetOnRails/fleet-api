class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.timestamp :date
      t.float :odometer
      t.float :price
      t.string :type
      t.text :description
      t.belongs_to :car

      t.timestamps
    end
  end
end
