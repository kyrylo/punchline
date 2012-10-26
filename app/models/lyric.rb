# coding: utf-8

class Lyric < ActiveRecord::Base
  belongs_to :artist

  attr_accessible :text, :title

  validates :title,
            presence: {
              message: "Необходимо указать название трека." },
            length: {
              minumum:   1,
              maximum:   120,
              too_short: "Заголовок трека должен иметь хотя бы %{count} символ.",
              too_long:  "Максимальная длина заголовка не должна превышать %{count} символов." }

  validates :text,
            presence: {
              message: "Необходимо добавить текст трека." },
            length: {
              minimum:   2,
              maximum:   4100, # The longest lyric I could find on the interwebz.
              too_short: "Текст трека должен иметь хотя бы %{count} символа.",
              too_long:  "Максимальная длина текста не должна превышать %{count} символов." }
end
