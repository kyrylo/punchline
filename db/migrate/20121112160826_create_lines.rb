class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :lyric_id
      t.text :text, null: false

      t.timestamps
    end

    add_index :lines, :lyric_id
  end
end
