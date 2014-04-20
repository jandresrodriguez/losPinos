class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.datetime :fehca_creacion
      t.datetime :fecha_inicio_estadia
      t.datetime :fecha_fin_estadia
      t.integer :monto
      t.string :moneda
      t.boolean :abonada
      t.string :forma_de_pago
      t.references :tipo_reserva, index: true
      t.references :cliente, index: true
      t.references :habitacion, index: true
      t.string :comentarios

      t.timestamps
    end
  end
end
