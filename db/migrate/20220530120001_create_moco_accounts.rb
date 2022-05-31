class CreateMocoAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :moco_accounts do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.string :ocomoco_id, null: false
      t.string :name, null: false
      t.string :domain, null: false

      t.index %i[ocomoco_id], unique: true
      t.index %i[organization_id name], unique: true
      t.index %i[organization_id domain], unique: true

      t.timestamps
    end
  end
end
