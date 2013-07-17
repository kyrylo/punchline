class Explanation < ActiveRecord::Base
  belongs_to :line
  attr_accessible :line_id, :text
end
