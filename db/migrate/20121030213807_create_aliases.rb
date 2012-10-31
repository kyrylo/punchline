class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string  :name, null: false
      t.integer :artist_id

      t.timestamps
    end

    add_index :aliases, :artist_id
  end
end
