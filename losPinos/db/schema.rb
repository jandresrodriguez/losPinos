# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140426221745) do

  create_table "admin_users", force: true do |t|
    t.string   "usuario"
    t.string   "contrasena"
    t.string   "nombre"
    t.boolean  "habilitado"
    t.string   "email"
    t.integer  "nivel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nac"
    t.string   "nacionalidad"
    t.string   "documento"
    t.string   "documento_tipo"
    t.string   "comentarios"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telefono"
    t.string   "direccion"
    t.integer  "codigo_postal"
    t.string   "ciudad_residencia"
    t.string   "estado_residencia"
    t.string   "pais_residencia"
  end

  create_table "gastos", force: true do |t|
    t.date     "fecha"
    t.string   "rubro"
    t.float    "monto"
    t.string   "moneda"
    t.string   "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "habitacions", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.boolean  "disponible"
    t.string   "comentarios"
    t.integer  "nro_camas_single"
    t.integer  "nro_camas_matrimoniales"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservas", force: true do |t|
    t.datetime "fehca_creacion"
    t.datetime "fecha_inicio_estadia"
    t.datetime "fecha_fin_estadia"
    t.integer  "monto"
    t.string   "moneda"
    t.boolean  "abonada"
    t.string   "forma_de_pago"
    t.integer  "tipo_reserva_id"
    t.integer  "cliente_id"
    t.integer  "habitacion_id"
    t.string   "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmada"
  end

  add_index "reservas", ["cliente_id"], name: "index_reservas_on_cliente_id"
  add_index "reservas", ["habitacion_id"], name: "index_reservas_on_habitacion_id"
  add_index "reservas", ["tipo_reserva_id"], name: "index_reservas_on_tipo_reserva_id"

  create_table "tarjeta", force: true do |t|
    t.string   "nombre"
    t.boolean  "habilitada"
    t.string   "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_reservas", force: true do |t|
    t.string   "nombre"
    t.boolean  "habilitada"
    t.string   "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
