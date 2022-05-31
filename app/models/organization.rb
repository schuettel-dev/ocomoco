class Organization < ApplicationRecord
  belongs_to :owner, class_name: "User"

  has_many :moco_accounts
  has_many :pipes

  validates :name, uniqueness: { scope: :user_id }
end
