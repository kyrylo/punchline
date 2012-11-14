class Line < ActiveRecord::Base
  has_one :explanation, dependent: :destroy

  belongs_to :lyric

  attr_accessible :explanation_id, :lyric_id, :text
end
