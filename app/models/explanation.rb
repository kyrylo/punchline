class Explanation < ActiveRecord::Base
  belongs_to :line

  attr_accessible :lyric_id, :text
end
