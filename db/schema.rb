# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_02_150353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_chapters_on_material_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "division_id"
    t.bigint "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["division_id"], name: "index_courses_on_division_id"
    t.index ["material_id"], name: "index_courses_on_material_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "sentiment_score"
    t.index ["course_id"], name: "index_feedbacks_on_course_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_flashcards_on_chapter_id"
  end

  create_table "forums", force: :cascade do |t|
    t.string "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_forums_on_course_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "forum_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_messages_on_forum_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notif_type"
    t.string "content"
    t.bigint "user_id"
    t.bigint "course_id"
    t.boolean "read_status", default: false
    t.index ["course_id"], name: "index_notifications_on_course_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.text "answer_student"
    t.bigint "user_id"
    t.bigint "flashcard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["flashcard_id"], name: "index_user_answers_on_flashcard_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grade", default: 0
    t.string "role", default: "student"
    t.bigint "division_id"
    t.string "first_name"
    t.string "last_name"
    t.string "picture_url"
    t.index ["division_id"], name: "index_users_on_division_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chapters", "materials"
  add_foreign_key "courses", "divisions"
  add_foreign_key "courses", "materials"
  add_foreign_key "courses", "users"
  add_foreign_key "feedbacks", "courses"
  add_foreign_key "flashcards", "chapters"
  add_foreign_key "messages", "forums"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "courses"
  add_foreign_key "notifications", "users"
  add_foreign_key "user_answers", "flashcards"
  add_foreign_key "user_answers", "users"
end
