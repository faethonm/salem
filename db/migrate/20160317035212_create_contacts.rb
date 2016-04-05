class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :contact_info
      t.string :demographics
      t.string :social_profiles
      t.string :primary_photo
      t.timestamps null: false
    end
  end
end
