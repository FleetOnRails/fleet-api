class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.timestamp :date
      t.float :odometer
      t.string :reminder_type
      t.text :description
      t.belongs_to :car

      t.timestamps
    end
  end
end
