class Note < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  belongs_to :journal
  belongs_to :author, class_name: "User"

  has_many :comments

  def self.ransackable_attributes(auth_object = nil)
    ["name", "body"]
  end

  def self.ransackable_associations(auth_object = nil)
    # ["author", "comments", "journal"]
    []
  end

  validates :name, presence: true, uniqueness: {scope: :author_id}
end
