class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.timestamp :start
      t.timestamp :end
      t.string :name

      t.timestamps
    end
  end
end
