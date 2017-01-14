class CreateModelTypes < ActiveRecord::Migration
  # :name, :model_type_slug, :model_type_code, :base_price
  def change
    create_table :model_types do |t|
      t.string :name, :model_type_slug, :model_type_code, unique: true
      t.decimal :base_price
      t.references :model
      t.timestamps null: false
    end
  end
end
