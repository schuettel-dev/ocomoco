class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.belongs_to :moco_account, null: true, foreign_key: true
      t.string :tenable_type, null: false
      t.bigint :tenable_id, null: false
      t.string :value, null: false

      t.index(
        %i[moco_account_id tenable_type tenable_id],
        unique: true,
        name: :indx_moco_account_tenable
      )
    end
  end
end
