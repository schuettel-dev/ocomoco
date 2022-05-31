class ApiKey < ApplicationRecord
  belongs_to :moco_account
  belongs_to :tenable, polymorphic: true

  validates :value, presence: true
end
