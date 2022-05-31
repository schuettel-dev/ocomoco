class Pipe < ApplicationRecord
  belongs_to :from_moco_account, class_name: "MocoAccount"
  belongs_to :to_moco_account, class_name: "MocoAccount"

  validates :to_account_id, uniqueness: { scope: :from_account_id }
end
