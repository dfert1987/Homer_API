class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :avatar
      t.string :city
      t.string :state
      t.string :twitter
      t.string :name
      t.text :about
      t.boolean :admin
      t.string :dob

      t.timestamps
    end
  end
end
