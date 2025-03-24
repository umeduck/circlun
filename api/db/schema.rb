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

ActiveRecord::Schema[7.0].define(version: 2025_03_18_144250) do
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

end
