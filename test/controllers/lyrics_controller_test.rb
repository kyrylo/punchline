# coding: utf-8

require "minitest_helper"

describe LyricsController do

  before do
    @lyric  = lyrics(:between_us)
    @artist = @lyric.artist
    @update = { title: 'Стрижка',
                text:  'Подровнял виски. Чё сказать? Ну вылитый скин!' }
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
      post :create, artist_id: @artist, id: @lyric, lyric: @update
    end

    assert_redirected_to artist_lyric_path(@artist, assigns(:lyric))
  end

  it "must show lyric" do
    get :show, artist_id: @artist, id: @lyric
    assert_response :success
  end

  it "must get edit" do
    get :edit, artist_id: @artist, id: @lyric
    assert_response :success
  end

  it "must update lyric" do
    put :update, artist_id: @artist, id: @lyric, lyric: @update
    assert_redirected_to artist_lyric_path(@artist, assigns(:lyric))
  end

  it "must destroy lyric" do
    assert_difference('Lyric.count', -1) do
      delete :destroy, artist_id: @artist, id: @lyric
    end

    assert_redirected_to artist_lyrics_path
  end

end
