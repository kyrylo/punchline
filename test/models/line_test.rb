require "minitest_helper"

describe Line do
  before do
    @line = Line.new
  end

  it "must be valid" do
    @line.valid?.must_equal true
  end
end
