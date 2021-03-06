# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_05_195949) do

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "body"
    t.string "mainImage"
    t.string "category"
    t.string "tagOne"
    t.string "tagTwo"
    t.string "tagThree"
    t.integer "thumbsUp"
    t.integer "thumbsDown"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "blogComment"
    t.integer "upVote"
    t.integer "downVote"
    t.integer "blog_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "remarks", force: :cascade do |t|
    t.string "comment"
    t.integer "upVote"
    t.integer "downVote"
    t.integer "userID"
    t.integer "blogID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "replies", force: :cascade do |t|
    t.string "replyText"
    t.integer "upVotes"
    t.integer "downVotes"
    t.integer "comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reps", force: :cascade do |t|
    t.string "reply"
    t.integer "upVotes"
    t.integer "downVotes"
    t.integer "commentID"
    t.integer "userID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "avatar"
    t.string "city"
    t.string "state"
    t.string "twitter"
    t.string "name"
    t.text "about"
    t.boolean "admin"
    t.string "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "users"
end
