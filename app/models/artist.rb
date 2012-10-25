class Artist < ActiveRecord::Base
  has_many :lyrics

  attr_accessible :name
end
