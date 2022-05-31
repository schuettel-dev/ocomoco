class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false, unique: true

      t.index %i[owner_id name], unique: true

      t.timestamps
    end
  end
end
