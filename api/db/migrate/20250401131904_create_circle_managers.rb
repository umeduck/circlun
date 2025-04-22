class CreateCircleManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :circle_managers do |t|
      t.string :name, null: false, comment: 'サークル名'
      t.integer :avg_age, null: false, comment: '平均年齢'
      t.string :kind, null: false, comment: '種別'
      t.text :objective, comment: 'サークルの目的'
      t.integer :count, null: false, comment: '人数'
      t.string :prefectures, null: false, comment: '活動場所(都道府県)'
      t.integer :foundation_years, null: false, comment: '設立年数'
      t.text :note, comment: '概要'

      t.timestamps
    end
  end
end
