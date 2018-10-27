class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :start
      t.datetime :end
      t.string :title

      t.timestamps
    end
  end
end
