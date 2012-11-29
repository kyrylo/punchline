# coding: utf-8

require "minitest_helper"

describe "LyricLinesSelection Acceptance Test" do

  let(:lyric) { FactoryGirl.create :lyric }
  let(:open_node) { find 'span.lyric_word:nth-child(2)' }
  let(:close_node) { find 'span.lyric_word:nth-child(6)' }
  let(:all_nodes) { all(:css, 'span.lyric_word:nth-child(-n+6)')[1..-1] }
  let(:forth_node) { find 'span.lyric_word:nth-child(10)' }
  let(:forth_all_nodes) { all(:css, 'span.lyric_word:nth-child(-n+10)')[1..-1] }
  let(:abaft_node) { find 'span.lyric_word:nth-child(1)' }
  let(:abaft_all_nodes) { all(:css, 'span.lyric_word:nth-child(-n+6)') }
  let(:html) { find 'html' }

  before do
    DatabaseCleaner.clean
    visit artist_lyric_path lyric.artist.id, lyric

    # Ensure we're on the right page.
    assert page.has_selector? 'div#lyric'
    assert page.has_selector? 'span.lyric_word'

    # Ensure the nodes we're testing aren't selected.
    open_node.text.must_equal 'признаю:'
    open_node[:class].must_equal 'lyric_word'
    open_node[:id].must_be_nil

    close_node.text.must_equal 'яркой,'
    close_node[:class].must_equal 'lyric_word'
    close_node[:id].must_be_nil
  end

  test "first click selects word" do
    open_node.click
    open_node[:class].must_equal 'lyric_word selected_word'
    open_node[:id].must_equal 'open_word'
  end

  test "click on random page area cancels selection" do
    open_node.click
    html.click

    open_node[:class].must_equal 'lyric_word'
    open_node[:id].must_be_nil
  end

  test "clicks on two different words selects line" do
    open_node.click
    close_node.click

    all_nodes.first[:id].must_equal 'open_word'
    all_nodes.last[:id].must_equal 'close_word'

    all_nodes.each do |node|
      node[:class].must_equal 'lyric_word selected_word'
    end
  end

  test "click on random page area cancels line" do
    open_node.click
    close_node.click
    html.click

    all_nodes.first[:id].must_be_nil
    all_nodes.last[:id].must_be_nil

    all_nodes.each do |node|
      node[:class].must_equal 'lyric_word'
    end
  end

  test "line selection works backwards" do
    close_node.click
    open_node.click

    all_nodes.first[:id].must_equal 'close_word'
    all_nodes.last[:id].must_equal 'open_word'

    all_nodes.each do |node|
      node[:class].must_equal 'lyric_word selected_word'
    end
  end

  test "line selection can be expanded forth" do
    open_node.click
    close_node.click
    forth_node.click

    close_node[:id].must_be_nil
    forth_node[:id].must_equal 'close_word'

    forth_all_nodes.each do |node|
      node[:class].must_equal 'lyric_word selected_word'
    end
  end

  test "line selection can be expanded abaft" do
    open_node.click
    close_node.click
    abaft_node.click

    open_node[:id].must_be_nil
    abaft_node[:id].must_equal 'open_word'

    abaft_all_nodes.each do |node|
      node[:class].must_equal 'lyric_word selected_word'
    end
  end

  #test "line selection can be shrinked" do
  #end

  test "click on selected words submits selection" do
    #2.times { open_node.click }
    #open_node[:class].must_equal 'lyric_word'
    #open_node[:id].must_be_nil
  end

end
