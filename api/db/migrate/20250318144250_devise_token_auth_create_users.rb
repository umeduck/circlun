class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change

    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name
      t.string :nickname
      t.string :email
      t.string :position
      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    # 各カラムにコメントを追加
    change_column_comment :users, :provider, "認証プロバイダー（デフォルト: email）"
    change_column_comment :users, :uid, "ユーザーの一意な識別子"
    change_column_comment :users, :encrypted_password, "ハッシュ化されたパスワード"
    change_column_comment :users, :reset_password_token, "パスワードリセット用の一時トークン"
    change_column_comment :users, :reset_password_sent_at, "パスワードリセットメールを送った日時"
    change_column_comment :users, :allow_password_change, "パスワード変更許可フラグ"
    change_column_comment :users, :remember_created_at, "ログイン状態を維持するための記録日時"
    change_column_comment :users, :confirmation_token, "メール確認用の一時トークン"
    change_column_comment :users, :confirmed_at, "メール確認完了日時"
    change_column_comment :users, :confirmation_sent_at, "確認メールを送信した日時"
    change_column_comment :users, :unconfirmed_email, "メールアドレス変更時の未確認メールアドレス"
    change_column_comment :users, :name, "ユーザーの名前"
    change_column_comment :users, :nickname, "ユーザーのニックネーム"
    change_column_comment :users, :email, "ユーザーのメールアドレス"
    change_column_comment :users, :position, "ユーザーのポジション"
    change_column_comment :users, :tokens, "ユーザー認証トークン（複数デバイス対応）"
  end
end
