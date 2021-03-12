class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :host, foreign_key: { to_table: :users }

      t.string :place
      t.datetime :time

      t.timestamps
    end
  end
end
