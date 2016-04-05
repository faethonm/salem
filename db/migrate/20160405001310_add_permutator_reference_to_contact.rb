class AddPermutatorReferenceToContact < ActiveRecord::Migration
  def change
    add_reference :contacts, :permutator, index: true, foreign_key: true
  end
end
