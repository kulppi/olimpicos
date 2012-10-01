class CreateDelegaciones < ActiveRecord::Migration
  def change
    create_table :delegaciones do |t|
      t.text :pais
      t.integer :olimpiada_id

      t.timestamps
    end
  end
end
