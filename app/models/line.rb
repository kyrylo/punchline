class Line < ActiveRecord::Base
  has_one :explanation, dependent: :destroy
  belongs_to :lyric
  attr_accessible :lyric_id, :text
  accepts_nested_attributes_for :explanation, allow_destroy: true
end
