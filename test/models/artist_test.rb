# coding: utf-8

require "minitest_helper"

describe Artist do
  let(:oxxxymiron) { artists(:oxxxymiron) }

  it "should create an artist" do
    assert oxxxymiron.save
    assert oxxxymiron.errors[:name].empty?
  end

  describe "validations" do
    describe "name" do
      it "should be present" do
        artist = Artist.new

        refute artist.save, "An artist can be saved without a name"
        artist.errors[:name].must_include "Необходимо указать имя исполнителя."
      end

      it "should be unique (and case insensitive)" do
        artist = Artist.new(name: 'FatBastard')
        other_artist = Artist.new(name: 'fatbastard')

        assert artist.save
        refute other_artist.save, "An artist with existing name has been created"
        other_artist.errors[:name].must_include "Исполнитель с таким именем уже существует."
      end

      it "should be at least 2 characters long" do
        artist = Artist.new(name: 'Ф')

        refute artist.save, "Saved an artist with length of name lesser than 2 characters"
        artist.errors[:name].must_include "Имя исполнителя должно содержать не менее 2 символов."
      end

      it "should be no longer than 45 symbols" do
        artist = Artist.new(name: 'Абабагаламага-aбабагаламага-абабагаламага-абабагаламага')

        refute artist.save, "Saved an artist with length of name longer than 45 characters"
        artist.errors[:name].must_include "Имя исполнителя не должно превышать 45 символов."
      end
    end
  end

  describe "city" do
  end

  describe "bio" do
  end
end
