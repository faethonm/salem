class CreateUmims < ActiveRecord::Migration
  def change
    create_table :umims do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :company_name
      t.string :company_domain
      t.timestamps null: false
    end
  end
end
