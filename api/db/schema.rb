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

ActiveRecord::Schema[7.0].define(version: 2025_04_19_123637) do
  create_table "circle_managers", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false, comment: "サークル名"
    t.integer "avg_age", null: false, comment: "平均年齢"
    t.string "kind", null: false, comment: "種別"
    t.text "objective", comment: "サークルの目的"
    t.integer "count", null: false, comment: "人数"
    t.string "prefectures", null: false, comment: "活動場所(都道府県)"
    t.integer "foundation_years", null: false, comment: "設立年数"
    t.text "note", comment: "概要"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "userテーブルid"
    t.bigint "circle_manager_id", null: false, comment: "circle_managerテーブルid"
    t.string "role", comment: "権限 1.管理者 2.チームメンバー 3.体験者"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_manager_id"], name: "index_memberships_on_circle_manager_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "provider", default: "email", null: false, comment: "認証プロバイダー（デフォルト: email）"
    t.string "uid", default: "", null: false, comment: "ユーザーの一意な識別子"
    t.string "encrypted_password", default: "", null: false, comment: "ハッシュ化されたパスワード"
    t.string "reset_password_token", comment: "パスワードリセット用の一時トークン"
    t.datetime "reset_password_sent_at", comment: "パスワードリセットメールを送った日時"
    t.boolean "allow_password_change", default: false, comment: "パスワード変更許可フラグ"
    t.datetime "remember_created_at", comment: "ログイン状態を維持するための記録日時"
    t.string "confirmation_token", comment: "メール確認用の一時トークン"
    t.datetime "confirmed_at", comment: "メール確認完了日時"
    t.datetime "confirmation_sent_at", comment: "確認メールを送信した日時"
    t.string "unconfirmed_email", comment: "メールアドレス変更時の未確認メールアドレス"
    t.string "name", comment: "ユーザーの名前"
    t.string "nickname", comment: "ユーザーのニックネーム"
    t.string "email", comment: "ユーザーのメールアドレス"
    t.string "position", comment: "ユーザーのポジション"
    t.text "tokens", comment: "ユーザー認証トークン（複数デバイス対応）"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "memberships", "circle_managers"
  add_foreign_key "memberships", "users"
end
