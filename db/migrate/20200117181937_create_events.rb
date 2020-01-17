class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :description

      t.timestamps
    end
  end
end
