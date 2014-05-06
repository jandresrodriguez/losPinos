class Gasto < ActiveRecord::Base

	validates :rubro, presence: true, allow_blank: false
	validates :monto, presence: true, allow_blank: false
	validates :moneda, presence: true, allow_blank: false
end
