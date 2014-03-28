class CreateHabitacions < ActiveRecord::Migration
  def change
    create_table :habitacions do |t|
      t.string :nombre
      t.text :descripcion
      t.boolean :disponible
      t.string :comentarios
      t.integer :nro_camas_single
      t.integer :nro_camas_matrimoniales

      t.timestamps
    end
  end
end
