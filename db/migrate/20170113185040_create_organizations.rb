class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, unique: true
      t.string :public_name, :pricing_policy, :organization_type
      t.timestamps null: false
    end
  end
end
