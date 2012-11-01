# coding: utf-8

require "minitest_helper"

describe Alias do
  let(:oksi) { aliases(:oksi) }
  let(:oxxxymiron) { artists(:oxxxymiron) }

  it "should create an alias for an artist" do
    assert oksi.save
    assert oksi.errors[:name].empty?
  end

  describe "validations" do
    describe "name" do
      it "should be present" do
        aliass = Alias.new

        refute aliass.save, "Saved an alias without a name"
        aliass.errors[:name].must_include "Необходимо указать псевдоним исполнителя."
      end

      it "should be unique (and case insensitive) in the scope of artist_id" do
        aliass = Alias.new(name: 'оксана', artist_id: oxxxymiron)
        other_alias = Alias.new(name: 'ОКСАНА', artist_id: oxxxymiron)

        oxxxymiron.aliases << aliass
        assert oxxxymiron.save

        oxxxymiron.aliases << other_alias
        refute oxxxymiron.save, "An artist have multiple aliases with the same name"
        other_alias.errors[:name].must_include "Этому исполнителю уже присвоен данный псевдоним."
      end

      it "should be at least 2 characters long" do
        aliass = Alias.new(name: 'Ц', artist_id: oxxxymiron)

        refute aliass.save, "Saved an an alias with length of name lesser than 2 characters"
        aliass.errors[:name].must_include "Псевдоним должен содержать не менее 2 символов."
      end

      it "should be no longer than 45 symbols" do
        long_name = 'Aбабагаламага-' * 4
        aliass = Alias.new(name: long_name, artist_id: oxxxymiron)

        refute aliass.save, "Saved an alias with length of name longer than 45 characters"
        aliass.errors[:name].must_include "Псевдоним не должен превышать 45 символов."
      end
    end

    describe "artist_id" do
      it "should be present" do
        aliass = Alias.new(name: 'Грубый Луи')

        refute aliass.save, "Saved an alias without an artist"
        aliass.errors[:artist_id].must_include "Псевдоним должен быть присвоен какому-либо исполнителю."
      end
    end
  end
end
