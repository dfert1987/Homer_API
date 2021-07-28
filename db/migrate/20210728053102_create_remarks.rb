class CreateRemarks < ActiveRecord::Migration[6.1]
  def change
    create_table :remarks do |t|
      t.string :comment
      t.integer :upVote
      t.integer :downVote
      t.integer :userID
      t.integer :blogID

      t.timestamps
    end
  end
end
