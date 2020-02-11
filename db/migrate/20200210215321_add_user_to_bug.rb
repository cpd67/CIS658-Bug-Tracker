class AddUserToBug < ActiveRecord::Migration[6.0]
  def change
    add_reference :bugs, :user, null: true, foreign_key: true
  end
end
