class CreateClientesReservas < ActiveRecord::Migration
  def change
    create_table :clientes_reservas do |t|
      t.references :reserva, index: true
      t.references :cliente, index: true

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes_reservas
  end
end
