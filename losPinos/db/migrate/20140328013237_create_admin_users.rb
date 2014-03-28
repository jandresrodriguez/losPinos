class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :usuario
      t.string :contrasena
      t.string :nombre
      t.boolean :habilitado
      t.string :email
      t.integer :nivel

      t.timestamps
    end
  end
end
