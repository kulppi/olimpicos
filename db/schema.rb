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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121002205113) do

  create_table "auditoria", :force => true do |t|
    t.string   "tabla"
    t.integer  "usuario"
    t.string   "action"
    t.integer  "clave"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delegaciones", :force => true do |t|
    t.text     "pais"
    t.integer  "olimpiada_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "deportes", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "disciplinas", :force => true do |t|
    t.integer  "deporte_id"
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "jugadoresPorEquipo"
    t.integer  "participantes"
    t.integer  "minutosPorTiempo"
    t.integer  "cantidadDeTiempos"
    t.integer  "sector_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "tipo_escala_id"
    t.integer  "escala_id"
  end

  create_table "entrenadores", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nacimiento"
    t.integer  "edad"
    t.integer  "tipo_sexo_id"
    t.string   "nacionalidad"
    t.integer  "delegacion_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "equipo_eventos", :force => true do |t|
    t.integer  "equipo_id"
    t.integer  "evento_id"
    t.float    "marca"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "equipos", :force => true do |t|
    t.integer  "delegacion_id"
    t.integer  "disciplina_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "estadios", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "cordx"
    t.integer  "cordy"
    t.integer  "olimpiada_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "eventos", :force => true do |t|
    t.integer  "disciplina_id"
    t.date     "fecha_inicio"
    t.date     "fecha_termino"
    t.integer  "sector_id"
    t.integer  "serie"
    t.integer  "siguienteEvento_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "hall_of_fames", :force => true do |t|
    t.string   "nombre"
    t.string   "pais"
    t.integer  "numOro"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jugadores", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nacimiento"
    t.float    "peso"
    t.float    "altura"
    t.integer  "edad"
    t.integer  "tipo_sexo_id"
    t.string   "nacionalidad"
    t.integer  "delegacion_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "entrenador_id"
  end

  create_table "jugadores_disciplinas", :force => true do |t|
    t.integer  "jugadore_id"
    t.integer  "disciplina_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "jugadores_equipos", :force => true do |t|
    t.integer  "jugadore_id"
    t.integer  "equipo_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "jugadores_eventos", :force => true do |t|
    t.integer  "jugadore_id"
    t.integer  "evento_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "marca"
  end

  create_table "medallas", :force => true do |t|
    t.integer  "tipo_medalla_id"
    t.integer  "disciplina_id"
    t.integer  "jugador_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "olimpiadas", :force => true do |t|
    t.date     "ano"
    t.text     "lugar"
    t.date     "fecha_inicio"
    t.date     "fecha_termino"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "registro_records", :force => true do |t|
    t.integer  "deporte_id"
    t.integer  "disciplina_id"
    t.integer  "evento_id"
    t.integer  "jugador_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "tipo_record_id"
    t.integer  "equipo_id"
    t.float    "marca"
  end

  create_table "sectores", :force => true do |t|
    t.string   "nombre"
    t.integer  "estadio_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_escalas", :force => true do |t|
    t.string   "tipo_escala"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipo_medallas", :force => true do |t|
    t.string   "tipo_medalla"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tipo_records", :force => true do |t|
    t.string   "tipoRecodr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_sexos", :force => true do |t|
    t.string   "tipo_sexo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.text     "phone"
    t.text     "description"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "country_id"
    t.integer  "city_id"
    t.integer  "gender"
    t.string   "image"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
