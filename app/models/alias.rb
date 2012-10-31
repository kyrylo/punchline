class Alias < ActiveRecord::Base
  belongs_to :artist

  attr_accessible :artist_id, :name
end
