class CreateUsernames < ActiveRecord::Migration[6.1]
  def change
    create_table :usernames do |t|
      t.string :password_digest
      t.string :email
      t.string :avatar
      t.string :city
      t.string :state
      t.string :twitter
      t.string :name
      t.string :dob
      t.booleanabout :admin

      t.timestamps
    end
  end
end
