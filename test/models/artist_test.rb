require "minitest_helper"

describe Artist do
  before do
    @artist = Artist.new
  end

  it "must be valid" do
    @artist.valid?.must_equal true
  end
end
