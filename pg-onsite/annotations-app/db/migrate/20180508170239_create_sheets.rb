class CreateSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :sheets do |t|
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
