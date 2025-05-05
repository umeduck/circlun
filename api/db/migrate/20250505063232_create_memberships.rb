class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true, comment: 'userテーブルid'
      t.references :circle, null: false, foreign_key: true, comment: 'circleテーブルid'
      t.string :role, comment: '権限 1.管理者 2.チームメンバー 3.体験者'

      t.timestamps
    end
  end
end
