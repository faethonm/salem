class AddUmimReferenceToContact < ActiveRecord::Migration
  def change
    add_reference :contacts, :umim, index: true, foreign_key: true
  end
end
