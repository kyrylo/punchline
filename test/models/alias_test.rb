# coding: utf-8

require "minitest_helper"

describe Alias do
  before do
    @alias  = FactoryGirl.create(:alias)
    @artist = FactoryGirl.create(:artist)
  end

  it "must create an alias for an artist" do
    aliass = FactoryGirl.build(:alias)

    assert aliass.save
    assert aliass.errors[:name].empty?
  end

  describe "validations" do
    describe "name" do
      it "must be present" do
        aliass = Alias.new

        refute aliass.save, "Saved an alias without a name"
        aliass.errors[:name].must_include "Необходимо указать псевдоним исполнителя."
      end

      it "must be unique (and case insensitive) in the scope of artist_id" do
        aliass = Alias.new(name: 'оксана')
        other  = Alias.new(name: 'ОКСАНА')

        @artist.aliases << aliass
        assert @artist.save

        @artist.aliases << other
        refute @artist.save, "An artist have multiple aliases with the same name"
        other.errors[:name].must_include "Этому исполнителю уже присвоен данный псевдоним."
      end

      it "must be at least 2 characters long" do
        aliass = Alias.new(name: 'Ц')
        @artist.aliases << aliass

        refute @artist.save, "Saved an an alias with length of name lesser than 2 characters"
        aliass.errors[:name].must_include "Псевдоним должен содержать не менее 2 символов."
      end

      it "must be no longer than 45 symbols" do
        long_name = 'Aбабагаламага-' * 4
        aliass = Alias.new(name: long_name)
        @artist.aliases << aliass

        refute @artist.save, "Saved an alias with length of name longer than 45 characters"
        aliass.errors[:name].must_include "Псевдоним не должен превышать 45 символов."
      end
    end

    describe "artist_id" do
      it "must be present" do
        aliass = Alias.new(name: 'Грубый Луи')

        refute aliass.save, "Saved an alias without an artist"
        aliass.errors[:artist_id].must_include "Псевдоним должен быть присвоен какому-либо исполнителю."
      end
    end
  end
end
