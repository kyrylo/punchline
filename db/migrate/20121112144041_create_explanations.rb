class CreateExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.integer :line_id
      t.text :text, null: false

      t.timestamps
    end

    add_index :explanations, :line_id
  end
end
