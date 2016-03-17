class CreateSocialInfos < ActiveRecord::Migration
  def change
    create_table :social_infos do |t|
      t.string :email
      t.string :information
      t.timestamps null: false
    end
  end
end
