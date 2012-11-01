#coding: utf-8

class Alias < ActiveRecord::Base
  belongs_to :artist

  attr_accessible :artist_id, :name

  validates :artist_id,
            presence: {
              message: "Псевдоним должен быть присвоен какому-либо исполнителю." }

  validates :name,
            presence: {
              message: "Необходимо указать псевдоним исполнителя." },
            uniqueness: {
              scope:          :artist_id,
              case_sensitive: false,
              message:        "Этому исполнителю уже присвоен данный псевдоним." },
            length: {
              minimum:   2,
              maximum:   45,
              too_short: "Псевдоним должен содержать не менее %{count} символов.",
              too_long:  "Псевдоним не должен превышать %{count} символов." }
end
