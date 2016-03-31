class CreateSocialInfos < ActiveRecord::Migration
  def change
    create_table :social_infos do |t|
      t.string :email
      t.string :contact_info
      t.string :demographics
      t.string :social_profiles
      t.string :primary_photo
      t.timestamps null: false
    end
  end
end
