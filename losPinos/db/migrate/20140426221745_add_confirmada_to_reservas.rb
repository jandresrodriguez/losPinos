class AddConfirmadaToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :confirmada, :boolean
  end
end
