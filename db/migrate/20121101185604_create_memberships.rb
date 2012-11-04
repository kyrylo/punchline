class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :artist_id
      t.integer :member_id

      t.timestamps
    end
  end
end
