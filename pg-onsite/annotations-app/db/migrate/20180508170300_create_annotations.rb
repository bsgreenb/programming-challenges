class CreateAnnotations < ActiveRecord::Migration[5.0]
  def change
    create_table :annotations do |t|
      t.string :content
      t.belongs_to :sheet, foreign_key: true

      t.timestamps
    end
  end
end
