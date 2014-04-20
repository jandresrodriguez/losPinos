class ChangeDateFormatInReservas < ActiveRecord::Migration
  def change
  	change_column :reservas, :fehca_creacion, :datetime
  	change_column :reservas, :fecha_inicio_estadia, :datetime
  	change_column :reservas, :fecha_fin_estadia, :datetime
  end
end
