class CreateTipoReservas < ActiveRecord::Migration
  def change
    create_table :tipo_reservas do |t|
      t.string :nombre
      t.boolean :habilitada
      t.string :comentarios

      t.timestamps
    end
  end
end
