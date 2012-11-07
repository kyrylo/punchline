# coding: utf-8

require "minitest_helper"

describe ArtistsController do
  before do
    @artist    = FactoryGirl.create(:artist)
    @rap_group = FactoryGirl.create(:rap_group)
    @update    = FactoryGirl.attributes_for(:artist)
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
      post :create, artist: @update
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  it "must get edit" do
    get :edit, id: @artist
    assert_response :success
  end

  it "must update artist" do
    put :update, id: @artist, artist: @update
    assert_redirected_to artist_path(assigns(:artist))
  end

  it "must destroy artist" do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end

    assert_redirected_to artists_path
  end

  describe "#show" do
    it "must work for artist" do
      get :show, id: @artist

      assert_response :success

      assigns(:members).must_be_nil
      assigns(:vacant_mcs).must_be_nil

      assigns(:artist).wont_be_nil
      assigns(:aliases).wont_be_nil
    end

    it "must work for rap group" do
      get :show, id: @rap_group

      assert_response :success

      assigns(:members).wont_be_nil
      assigns(:vacant_mcs).wont_be_nil

      assigns(:artist).wont_be_nil
      assigns(:aliases).wont_be_nil
    end
  end
end
