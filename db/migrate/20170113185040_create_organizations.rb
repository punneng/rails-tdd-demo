class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, :public_name, :pricing_policy
      t.timestamps null: false
    end
  end
end
