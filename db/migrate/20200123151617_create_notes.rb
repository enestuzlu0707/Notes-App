class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :priority
      t.datetime :date_taken
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
