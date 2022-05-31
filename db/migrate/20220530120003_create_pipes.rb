class CreatePipes < ActiveRecord::Migration[7.0]
  def change
    create_table :pipes do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.belongs_to :from_moco_account, null: false, foreign_key: { to_table: :moco_accounts }
      t.belongs_to :to_moco_account, null: false, foreign_key: { to_table: :moco_accounts }

      t.index(
        %i[organization_id from_moco_account_id to_moco_account_id],
        unique: true,
        name: :indx_organization_from_to_moco_account
      )

      t.timestamps
    end
  end
end
