require "minitest_helper"

describe MembershipsController do
  before do
    @artist     = FactoryGirl.create(:artist)
    @rap_group  = FactoryGirl.create(:rap_group)
  end

  it "must create membership" do
    assert_difference('Membership.count') do
      post :create, artist_id: @rap_group, member_id: @artist
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  it "must destroy membership" do
    assert_difference('Membership.count', -1) do
      delete :destroy, artist_id: @rap_group, id: @rap_group.memberships.first
    end

    assert_redirected_to artist_path(assigns(:artist))
  end
end
