# coding: utf-8

require "minitest_helper"

describe LyricsController do

  before do
    @lyric  = lyrics(:between_us)
    @update = { title: 'Стрижка',
                text:  'Подровнял виски. Чё сказать? Ну вылитый скин!' }
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lyrics)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create lyric" do
    assert_difference('Lyric.count') do
      post :create, lyric: @update
    end

    assert_redirected_to lyric_path(assigns(:lyric))
  end

  it "must show lyric" do
    get :show, id: @lyric
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @lyric
    assert_response :success
  end

  it "must update lyric" do
    put :update, id: @lyric, lyric: @update
    assert_redirected_to lyric_path(assigns(:lyric))
  end

  it "must destroy lyric" do
    assert_difference('Lyric.count', -1) do
      delete :destroy, id: @lyric
    end

    assert_redirected_to lyrics_path
  end

end
