class CreateModelTypes < ActiveRecord::Migration
  # :name, :model_type_slug, :model_type_code, :base_price
  def change
    create_table :model_types do |t|
      t.string :name, :model_type_slug, :model_type_code
      t.decimal :base_price
      t.timestamps null: false
    end
  end
end
