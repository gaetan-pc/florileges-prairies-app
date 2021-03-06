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

ActiveRecord::Schema.define(version: 20200203152204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "observations", force: :cascade do |t|
    t.boolean  "q0"
    t.boolean  "q1"
    t.boolean  "q2"
    t.boolean  "q3"
    t.boolean  "q4"
    t.boolean  "q5"
    t.boolean  "q6"
    t.boolean  "q7"
    t.boolean  "q8"
    t.boolean  "q9"
    t.boolean  "q10"
    t.boolean  "p"
    t.integer  "releve_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "CD_NOM"
    t.integer  "CD_REF"
    t.string   "LB_NOM",              limit: 255
    t.string   "NOM_VALIDE",          limit: 255
    t.string   "florileges",          limit: 255
    t.string   "TAXREF_V",            limit: 255
    t.integer  "taxon_id"
    t.integer  "site_owner_id_cache"
    t.integer  "site_id_cache"
  end

  add_index "observations", ["releve_id"], name: "index_observations_on_releve_id", using: :btree
  add_index "observations", ["site_id_cache"], name: "index_observations_on_site_id_cache", using: :btree
  add_index "observations", ["site_owner_id_cache"], name: "index_observations_on_site_owner_id_cache", using: :btree
  add_index "observations", ["taxon_id"], name: "index_observations_on_taxon_id", using: :btree

  create_table "ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.string   "owner",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "image",      limit: 255
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["site_id"], name: "index_photos_on_site_id", using: :btree

  create_table "releves", force: :cascade do |t|
    t.date     "date"
    t.text     "name"
    t.string   "structure",         limit: 255
    t.string   "fonction",          limit: 255
    t.time     "time_start"
    t.time     "time_end"
    t.string   "hauteur",           limit: 255
    t.string   "milieux",           limit: 255
    t.integer  "user_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "semis"
    t.boolean  "fauche_export"
    t.integer  "paturage_pression"
    t.integer  "paturage_duree"
    t.string   "fauche",            limit: 255
    t.string   "fauche_periode",    limit: 255
    t.string   "fauche_freq",       limit: 255
    t.string   "paturage",          limit: 255
    t.string   "traitement",        limit: 255
    t.string   "pression",          limit: 255
  end

  add_index "releves", ["site_id"], name: "index_releves_on_site_id", using: :btree
  add_index "releves", ["user_id"], name: "index_releves_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "code",               limit: 255
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "location",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password",           limit: 255
    t.string   "photo",              limit: 255
    t.boolean  "public"
    t.string   "plan",               limit: 255
    t.boolean  "propage"
    t.string   "gen_freq",           limit: 255
    t.string   "gen_gest",           limit: 255
    t.integer  "gen_surface"
    t.datetime "gestion_date"
    t.string   "hist_date",          limit: 255
    t.string   "gen_obj",            limit: 255
    t.string   "hist_occsol",        limit: 255
    t.string   "hist_trav",          limit: 255
    t.string   "cult_amend",         limit: 255
    t.string   "cult_amend_freq",    limit: 255
    t.string   "cult_trav",          limit: 255
    t.string   "cult_trav_freq",     limit: 255
    t.string   "cult_trav_freqinfo", limit: 255
    t.string   "propage_identifier", limit: 255
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "taxa", force: :cascade do |t|
    t.text     "regne"
    t.text     "phylum"
    t.text     "classe"
    t.text     "ordre"
    t.text     "famille"
    t.text     "group1_inpn"
    t.text     "group2_inpn"
    t.integer  "cd_nom"
    t.integer  "cd_taxsup"
    t.integer  "cd_ref"
    t.string   "rang",             limit: 255
    t.text     "lb_nom"
    t.text     "lb_auteur"
    t.text     "nom_complet"
    t.text     "nom_complet_html"
    t.text     "nom_valide"
    t.text     "nom_vern"
    t.text     "nom_vern_eng"
    t.string   "habitat",          limit: 255
    t.string   "fr",               limit: 255
    t.string   "gf",               limit: 255
    t.string   "mar",              limit: 255
    t.string   "gua",              limit: 255
    t.string   "sm",               limit: 255
    t.string   "sb",               limit: 255
    t.string   "spm",              limit: 255
    t.string   "may",              limit: 255
    t.string   "epa",              limit: 255
    t.string   "reu",              limit: 255
    t.string   "taaf",             limit: 255
    t.string   "pf",               limit: 255
    t.string   "nc",               limit: 255
    t.string   "wf",               limit: 255
    t.string   "cli",              limit: 255
    t.string   "url",              limit: 255
    t.integer  "taxref_v"
    t.boolean  "florileges"
    t.integer  "index_ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "structure",              limit: 255
    t.string   "fonction",               limit: 255
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "woods", force: :cascade do |t|
    t.integer  "q1"
    t.integer  "q2"
    t.integer  "q3"
    t.integer  "q4"
    t.integer  "q5"
    t.integer  "q6"
    t.integer  "q7"
    t.integer  "q8"
    t.integer  "q9"
    t.integer  "q10"
    t.integer  "total"
    t.integer  "releve_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "woods", ["releve_id"], name: "index_woods_on_releve_id", using: :btree

end
