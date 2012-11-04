class AddRapGroupToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :rap_group, :boolean, default: false, null: false
  end
end
