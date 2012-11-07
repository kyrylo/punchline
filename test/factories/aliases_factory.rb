# coding: utf-8

FactoryGirl.define do
  factory :alias do
    artist
    sequence(:name) { |n| "Псевдоним-#{n}" }
  end
end
