require "minitest_helper"

describe MembershipsController do
  let(:bazuka_chemodan) { memberships(:bazuka_chemodan) }
  let(:chemodan) { artists(:chemodan) }

  it "should create membership" do
    assert_difference('Membership.count') do
      post :create, artist_id: chemodan, membership: bazuka_chemodan
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  it "should destroy membership" do
    assert_difference('Membership.count', -1) do
      delete :destroy, artist_id: artists(:bazuka), id: bazuka_chemodan
    end

    assert_redirected_to artist_path(assigns(:artist))
  end
end
