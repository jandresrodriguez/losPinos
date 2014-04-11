class AddPhoneToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :telefono, :string
    add_column :clientes, :direccion, :string
    add_column :clientes, :codigo_postal, :int
    add_column :clientes, :ciudad_residencia, :string
    add_column :clientes, :estado_residencia, :string
    add_column :clientes, :pais_residencia, :string
  end
end
