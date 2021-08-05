class CreateReps < ActiveRecord::Migration[6.1]
  def change
    create_table :reps do |t|
      t.string :reply
      t.integer :upVotes
      t.integer :downVotes
      t.integer :commentID
      t.integer :userID

      t.timestamps
    end
  end
end
