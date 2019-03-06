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

ActiveRecord::Schema.define(version: 20190306062231) do

  create_table "nas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nasname", limit: 128, null: false
    t.string "shortname", limit: 32
    t.string "type", limit: 30, default: "other"
    t.integer "ports"
    t.string "secret", limit: 60, default: "secret", null: false
    t.string "server", limit: 64
    t.string "community", limit: 50
    t.string "description", limit: 200, default: "RADIUS Client"
    t.index ["nasname"], name: "nasname"
  end

  create_table "radacct", primary_key: "radacctid", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "acctsessionid", limit: 64, default: "", null: false
    t.string "acctuniqueid", limit: 32, default: "", null: false
    t.string "username", limit: 64, default: "", null: false
    t.string "groupname", limit: 64, default: "", null: false
    t.string "realm", limit: 64, default: ""
    t.string "nasipaddress", limit: 15, default: "", null: false
    t.string "nasportid", limit: 15
    t.string "nasporttype", limit: 32
    t.datetime "acctstarttime"
    t.datetime "acctstoptime"
    t.integer "acctsessiontime"
    t.string "acctauthentic", limit: 32
    t.string "connectinfo_start", limit: 50
    t.string "connectinfo_stop", limit: 50
    t.bigint "acctinputoctets"
    t.bigint "acctoutputoctets"
    t.string "calledstationid", limit: 50, default: "", null: false
    t.string "callingstationid", limit: 50, default: "", null: false
    t.string "acctterminatecause", limit: 32, default: "", null: false
    t.string "servicetype", limit: 32
    t.string "framedprotocol", limit: 32
    t.string "framedipaddress", limit: 15, default: "", null: false
    t.integer "acctstartdelay"
    t.integer "acctstopdelay"
    t.string "xascendsessionsvrkey", limit: 10
    t.index ["acctsessionid"], name: "acctsessionid"
    t.index ["acctsessiontime"], name: "acctsessiontime"
    t.index ["acctstarttime"], name: "acctstarttime"
    t.index ["acctstoptime"], name: "acctstoptime"
    t.index ["acctuniqueid"], name: "acctuniqueid"
    t.index ["framedipaddress"], name: "framedipaddress"
    t.index ["nasipaddress"], name: "nasipaddress"
    t.index ["username"], name: "username"
  end

  create_table "radcheck", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username", limit: 64, default: "", null: false
    t.string "attribute", limit: 64, default: "", null: false
    t.string "op", limit: 2, default: "==", null: false
    t.string "value", limit: 253, default: "", null: false
    t.string "given_name", null: false
    t.string "comment", null: false
    t.string "description", null: false
    t.index ["username"], name: "username", length: { username: 32 }
  end

  create_table "radgroupcheck", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "groupname", limit: 64, default: "", null: false
    t.string "attribute", limit: 64, default: "", null: false
    t.string "op", limit: 2, default: "==", null: false
    t.string "value", limit: 253, default: "", null: false
    t.index ["groupname"], name: "groupname", length: { groupname: 32 }
  end

  create_table "radgroupreply", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "groupname", limit: 64, default: "", null: false
    t.string "attribute", limit: 64, default: "", null: false
    t.string "op", limit: 2, default: "=", null: false
    t.string "value", limit: 253, default: "", null: false
    t.index ["groupname"], name: "groupname", length: { groupname: 32 }
  end

  create_table "radpostauth", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username", limit: 64, default: "", null: false
    t.string "pass", limit: 64, default: "", null: false
    t.string "reply", limit: 32, default: "", null: false
    t.timestamp "authdate", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "radreply", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username", limit: 64, default: "", null: false
    t.string "attribute", limit: 64, default: "", null: false
    t.string "op", limit: 2, default: "=", null: false
    t.string "value", limit: 253, default: "", null: false
    t.index ["username"], name: "username", length: { username: 32 }
  end

  create_table "radusergroup", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username", limit: 64, default: "", null: false
    t.string "groupname", limit: 64, default: "", null: false
    t.integer "priority", default: 1, null: false
    t.index ["username"], name: "username", length: { username: 32 }
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
