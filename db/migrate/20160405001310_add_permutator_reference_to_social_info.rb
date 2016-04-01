class AddPermutatorReferenceToSocialInfo < ActiveRecord::Migration
  def change
    add_reference :social_infos, :permutator, index: true, foreign_key: true
  end
end
