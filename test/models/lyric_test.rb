# coding: utf-8

require "minitest_helper"

describe Lyric do
  let(:between_us) { lyrics(:between_us) }

  it "should create a lyric" do
    assert between_us.save
    assert between_us.errors[:title].empty?
    assert between_us.errors[:text].empty?
  end

  describe "validations" do
    let(:title) { 'Заголовок' }
    let(:text)  { 'Ла-ла-ла' }

    describe "title" do
      it "should be present" do
        lyric = Lyric.new(text: text)

        refute lyric.save, "Saved a lyric without a title"
        lyric.errors[:title].must_include "Необходимо указать название трека."
      end

      it "should be no longer than 120 characters" do
        long_title = 'Заголовок трека ' * 10
        lyric = Lyric.new(title: long_title, text: text)

        refute lyric.save, "Saved a lyric with length of title longer than 120 characters"
        lyric.errors[:title].must_include "Максимальная длина заголовка не должна превышать 120 символов."
      end
    end

    describe "text" do
      it "should be present" do
        lyric = Lyric.new(title: title)

        refute lyric.save, "Saved a lyric without text"
        lyric.errors[:text].must_include "Необходимо добавить текст трека."
      end

      it "should be at least 2 characters long" do
        lyric = Lyric.new(title: title, text: 'Я')

        refute lyric.save, "Saved a lyric with length of text lesser than 2 characters"
        lyric.errors[:text].must_include "Текст трека должен иметь хотя бы 2 символа."
      end

      it "should be no longer than 4100 characters" do
        long_text = 'Текст трека ' * 350
        lyric = Lyric.new(title: title, text: long_text)

        refute lyric.save, "Saved a lyric with length of text longer than 4100 characters"
        lyric.errors[:text]
      end
    end
  end
end
