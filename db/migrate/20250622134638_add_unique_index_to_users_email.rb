class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :tutors, :email, unique: true
  end
end
