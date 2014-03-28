class CreateGastos < ActiveRecord::Migration
  def change
    create_table :gastos do |t|
      t.date :fecha
      t.string :rubro
      t.float :monto
      t.string :moneda
      t.string :comentarios

      t.timestamps
    end
  end
end
