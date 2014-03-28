class CreateTarjeta < ActiveRecord::Migration
  def change
    create_table :tarjeta do |t|
      t.string :nombre
      t.boolean :habilitada
      t.string :comentarios

      t.timestamps
    end
  end
end
