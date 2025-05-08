class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true, comment: 'userテーブルid'
      t.references :circle, null: false, foreign_key: true, comment: 'circleテーブルid'
      t.integer :role, null: false, default: 2

      t.timestamps
    end
    add_index :memberships, %i[user_id circle_id], unique: true
  end
end
