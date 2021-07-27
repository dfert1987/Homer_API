class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.string :replyText
      t.integer :upVotes
      t.integer :downVotes
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
