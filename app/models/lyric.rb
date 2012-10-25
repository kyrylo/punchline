class Lyric < ActiveRecord::Base
  belongs_to :artist

  attr_accessible :text, :title
end
