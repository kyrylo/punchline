require "minitest_helper"

describe ArtistsController do

  before do
    @artist = Artist.new
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create artist" do
    assert_difference('Artist.count') do
      post :create, artist: @artist.attributes
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  it "must show artist" do
    get :show, id: @artist.to_param
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @artist.to_param
    assert_response :success
  end

  it "must update artist" do
    put :update, id: @artist.to_param, artist: @artist.attributes
    assert_redirected_to artist_path(assigns(:artist))
  end

  it "must destroy artist" do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist.to_param
    end

    assert_redirected_to artists_path
  end

end
