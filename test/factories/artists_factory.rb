# coding: utf-8

FactoryGirl.define do
  factory :artist, aliases: [:rap_group_member] do
    sequence(:name) { |n| "Эмси-#{n}" }
    city 'Харьков'
    bio 'Экспериментальный абстрактно-оральный хип-хоп с элементами легкой философской мысли, которая вредна.'
    rap_group false
  end

  factory :rap_group, parent: :artist do
    sequence(:name) { |n| "Рэп-группа-#{n}" }
    rap_group true

    after :create do |rap_group|
      2.times {
        rap_group.memberships << create(:membership, artist: rap_group)
      }
    end
  end

  factory :artist_with_aliases, parent: :artist do
    after :create do |artist|
      3.times { artist.aliases << create(:alias, artist: artist) }
    end
  end

  factory :artist_with_lyrics, parent: :artist do
    after :create do |artist|
      3.times { artist.lyrics << create(:lyric, artist: artist) }
    end
  end
end
