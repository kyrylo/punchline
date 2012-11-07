# coding: utf-8

require "minitest_helper"

describe Artist do
  before do
    @artist    = FactoryGirl.create(:artist)
    @rap_group = FactoryGirl.create(:rap_group)
  end

  it "must create an artist" do
    artist = FactoryGirl.build(:artist)

    assert artist.save
    assert artist.errors[:name].empty?
  end

  describe "validations" do
    describe "name" do
      it "must be present" do
        artist = Artist.new

        refute artist.save, "Saved an artist without a name"
        artist.errors[:name].must_include "Необходимо указать имя исполнителя."
      end

      it "must be unique (and case insensitive)" do
        artist = Artist.new(name: 'FatBastard')
        other = Artist.new(name: 'fatbastard')

        assert artist.save
        refute other.save, "An artist with existing name has been created"
        other.errors[:name].must_include "Исполнитель с таким именем уже существует."
      end

      it "must be at least 2 characters long" do
        artist = Artist.new(name: 'Ф')

        refute artist.save, "Saved an artist with length of name lesser than 2 characters"
        artist.errors[:name].must_include "Имя исполнителя должно содержать не менее 2 символов."
      end

      it "must be no longer than 45 symbols" do
        long_name = 'Абабагаламага' * 4
        artist = Artist.new(name: long_name)

        refute artist.save, "Saved an artist with length of name longer than 45 characters"
        artist.errors[:name].must_include "Имя исполнителя не должно превышать 45 символов."
      end
    end

    describe "city" do
    end

    describe "bio" do
    end
  end

  describe "model scopes" do
    describe ".all_mcs" do
      it "must include all artists that are MCs" do
        Artist.all_mcs.must_include @artist, "MC is not included in the list"
      end

      it "must exclude all artists that are rap groups" do
        Artist.all_mcs.wont_include @rap_group, "Rap groups is present in the list of MCs"
      end
    end

    describe ".all_vacant_mcs" do
      it "must include all vacant MCs in the context of the given rap group" do
        Artist.all_vacant_mcs(@rap_group).must_include @artist
      end

      it "must exclude MCs that are in the current rap group" do
        mc        = FactoryGirl.create(:artist)
        rap_group = FactoryGirl.create(:rap_group)
        rap_group.members << mc

        Artist.all_vacant_mcs(rap_group).wont_include mc
      end

      it "must exclude own rap group" do
        Artist.all_vacant_mcs(@rap_group).wont_include @rap_group
      end
    end
  end

  describe "#rap_group" do
    it "must be `false` by default" do
      refute Artist.new(name: 'FatBastard').rap_group
    end

    it "must have alias `.rap_group?`" do
      refute Artist.new(name: 'FatBastard').rap_group?
    end
  end

  describe "#to_param" do
    it "must return id and model name" do
      param = Artist.create!(name: 'FatBastard').to_param
      param.must_match /\A\d+-fatbastard\z/
    end

    it "must transliterate Russian characters" do
      param = Artist.create!(name: 'Жирный').to_param
      param.must_match /\A\d+-zhirnyy\z/
    end

    it "must gracefully deal with non-letter characters" do
      param = Artist.create!(name: 'Эмси"%Супер./Рэпе(р)').to_param
      param.must_match /\A\d+-emsi-super-repe-r\z/
    end
  end
end
