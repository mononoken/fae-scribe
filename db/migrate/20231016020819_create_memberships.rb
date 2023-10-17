class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
