require "minitest_helper"

describe Alias do
  before do
    @alias = Alias.new
  end

  it "must be valid" do
    @alias.valid?.must_equal true
  end
end
