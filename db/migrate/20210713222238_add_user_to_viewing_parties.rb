class AddUserToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :viewing_parties, :user, foreign_key: true
  end
end
