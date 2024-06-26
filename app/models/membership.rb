class Membership < ApplicationRecord
  belongs_to :campaign
  belongs_to :member, class_name: "User"

  has_many :membership_journals, dependent: :destroy
  has_many :journals, through: :membership_journals

  accepts_nested_attributes_for :membership_journals

  enum :role, {owner: 0, admin: 1, member: 2}

  validates :member, uniqueness:
    {scope: :campaign, message: "has already joined this campaign."}
end
