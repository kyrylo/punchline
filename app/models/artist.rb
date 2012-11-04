# coding: utf-8

class Artist < ActiveRecord::Base
  has_many :lyrics,  dependent: :destroy
  has_many :aliases, dependent: :destroy

  has_many :memberships
  has_many :members, through: :memberships

  has_many :rap_group_memberships, class_name: 'Membership', foreign_key: 'member_id'
  has_many :rap_groups, through: :rap_group_memberships, source: :artist

  attr_accessible :name, :city, :bio, :rap_group, :member_id

  validates_associated :lyrics, :aliases

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

  scope :all_mcs, -> {
    where(rap_group: false)
  }

  scope :all_vacant_mcs, -> our_rap_group {
    if our_rap_group.rap_group?
      all_mcs.where("id NOT IN (?)", [our_rap_group.id, *our_rap_group.member_ids])
    end
  }

  def to_param
    "#{id} #{Russian.translit(name)}".parameterize
  end

  def rap_group?
    rap_group
  end
end
