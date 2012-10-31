# coding: utf-8

class Artist < ActiveRecord::Base
  has_many :lyrics
  has_many :aliases

  attr_accessible :name, :city, :bio

  validates_associated :lyrics

  validates :name,
            presence: {
              message: "Необходимо указать имя исполнителя." },
            uniqueness: {
              case_sensitive: false,
              message:        "Исполнитель с таким именем уже существует." },
            length: {
              minimum:   2,
              maximum:   45,
              too_short: "Имя исполнителя должно содержать не менее %{count} символов.",
              too_long:  "Имя исполнителя не должно превышать %{count} символов." }

  def to_param
    "#{id} #{Russian.translit(name)}".parameterize
  end
end
