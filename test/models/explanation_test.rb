require "minitest_helper"

describe Explanation do
  before do
    @explanation = Explanation.new
  end

  it "must be valid" do
    @explanation.valid?.must_equal true
  end
end
