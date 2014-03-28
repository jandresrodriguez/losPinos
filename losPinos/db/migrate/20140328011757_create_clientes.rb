class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nac
      t.string :nacionalidad
      t.string :documento
      t.string :documento_tipo
      t.string :comentarios
      t.string :email

      t.timestamps
    end
  end
end
