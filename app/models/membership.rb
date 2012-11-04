class Membership < ActiveRecord::Base
  belongs_to :artist
  belongs_to :member, class_name: 'Artist'

  attr_accessible :artist_id, :member_id
end
