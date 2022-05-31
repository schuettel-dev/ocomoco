class MocoAccount < ApplicationRecord
  attr_readonly :ocomoco_id

  belongs_to :organization

  has_one :api_key, as: :tenable

  before_validation :set_ocomoco_id, if: :new_record?

  validates :name, uniqueness: { scope: :organization_id }
  validates :domain, uniqueness: { scope: :organization_id }
  validates :ocomoco_id, format: { with: /\A[a-zA-Z]{6,}\z/ }
  validates :ocomoco_id, uniqueness: true

  scope :ordered_by_name, -> { order("lower(name) ASC") }

  def to_param
    ocomoco_id
  end

  private

  def set_ocomoco_id
    self.ocomoco_id = (0...6).map { [*('a'..'z'), *('A'..'Z')].flatten.to_a[rand(52)] }.join
  end
end
