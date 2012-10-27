class AddCityAndBioToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :city, :string
    add_column :artists, :bio, :text
  end
end
