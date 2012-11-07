# coding: utf-8

require "minitest_helper"

describe LyricsController do
  before do
    @lyric  = FactoryGirl.create(:lyric)
    @artist = FactoryGirl.create(:artist_with_lyrics)
    @update = FactoryGirl.attributes_for(:lyric)
  end

  it "must get index" do
    get :index, artist_id: @artist
    assert_response :success
    assert_not_nil assigns(:lyrics)
  end

  it "must get new" do
    get :new, artist_id: @artist
    assert_response :success
  end

  it "must create lyric" do
    assert_difference('Lyric.count') do
      post :create, artist_id: @artist, lyric: @update
    end

    assert_redirected_to artist_lyric_path(@artist, assigns(:lyric))
  end

  it "must show lyric" do
    get :show, artist_id: @lyric.artist, id: @lyric.id
    assert_response :success
  end

  it "must get edit" do
    get :edit, artist_id: @lyric.artist, id: @lyric.id
    assert_response :success
  end

  it "must update lyric" do
    put :update, artist_id: @lyric.artist, id: @lyric, lyric: @update
    assert_redirected_to artist_lyric_path(@lyric.artist, assigns(:lyric))
  end

  it "must destroy lyric" do
    assert_difference('Lyric.count', -1) do
      delete :destroy, artist_id: @lyric.artist, id: @lyric.id
    end

    assert_redirected_to artist_lyrics_path
  end

end
