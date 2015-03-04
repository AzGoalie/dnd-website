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

ActiveRecord::Schema.define(version: 20150304034227) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "owner_id"
    t.integer  "users_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "private"
    t.integer  "characters_id"
  end

  add_index "campaigns", ["characters_id"], name: "index_campaigns_on_characters_id"
  add_index "campaigns", ["owner_id"], name: "index_campaigns_on_owner_id"
  add_index "campaigns", ["users_id"], name: "index_campaigns_on_users_id"

  create_table "characters", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "campaign_id"
    t.string   "name"
    t.integer  "gold",                  default: 120
    t.integer  "silver",                default: 0
    t.integer  "xp",                    default: 352
    t.integer  "hp",                    default: 0
    t.integer  "hp_bonus",              default: 0
    t.integer  "stamina",               default: 0
    t.integer  "stamina_bonus",         default: 0
    t.integer  "eita",                  default: 0
    t.integer  "eita_bonus",            default: 0
    t.integer  "initiative",            default: 0
    t.integer  "initiative_bonus",      default: 0
    t.integer  "adrenaline",            default: 0
    t.integer  "adrenaline_bonus",      default: 0
    t.integer  "focus",                 default: 0
    t.integer  "focus_bonus",           default: 0
    t.integer  "strength",              default: 0
    t.integer  "strength_bonus",        default: 0
    t.integer  "constitution",          default: 0
    t.integer  "constitution_bonus",    default: 0
    t.integer  "dexterity",             default: 0
    t.integer  "dexterity_bonus",       default: 0
    t.integer  "intelligence",          default: 0
    t.integer  "intelligence_bonus",    default: 0
    t.integer  "wisdom",                default: 0
    t.integer  "wisdom_bonus",          default: 0
    t.integer  "charisma",              default: 0
    t.integer  "charisma_bonus",        default: 0
    t.integer  "block",                 default: 0
    t.integer  "block_bonus",           default: 0
    t.integer  "reflex",                default: 0
    t.integer  "reflex_bonus",          default: 0
    t.integer  "resilience",            default: 0
    t.integer  "resilience_bonus",      default: 0
    t.integer  "willpower",             default: 0
    t.integer  "willpower_bonus",       default: 0
    t.integer  "acrobatics",            default: 0
    t.integer  "acrobatics_bonus",      default: 0
    t.integer  "athletics",             default: 0
    t.integer  "athletics_bonus",       default: 0
    t.integer  "endurance",             default: 0
    t.integer  "endurance_bonus",       default: 0
    t.integer  "bluff",                 default: 0
    t.integer  "bluff_bonus",           default: 0
    t.integer  "diplomacy",             default: 0
    t.integer  "diplomacy_bonus",       default: 0
    t.integer  "intimidate",            default: 0
    t.integer  "intimidate_bonus",      default: 0
    t.integer  "history",               default: 0
    t.integer  "history_bonus",         default: 0
    t.integer  "insight",               default: 0
    t.integer  "insight_bonus",         default: 0
    t.integer  "perception",            default: 0
    t.integer  "perception_bonus",      default: 0
    t.integer  "stealth",               default: 0
    t.integer  "stealth_bonus",         default: 0
    t.integer  "thievery",              default: 0
    t.integer  "thievery_bonus",        default: 0
    t.integer  "beast_mastery",         default: 0
    t.integer  "beast_mastery_bonus",   default: 0
    t.integer  "botany",                default: 0
    t.integer  "botany_bonus",          default: 0
    t.integer  "gathering",             default: 0
    t.integer  "gathering_bonus",       default: 0
    t.integer  "spelunking",            default: 0
    t.integer  "spelunking_bonus",      default: 0
    t.integer  "tracking",              default: 0
    t.integer  "tracking_bonus",        default: 0
    t.integer  "axes",                  default: 0
    t.integer  "axes_bonus",            default: 0
    t.integer  "double_axes",           default: 0
    t.integer  "double_axes_bonus",     default: 0
    t.integer  "double_hammers",        default: 0
    t.integer  "double_hammers_bonus",  default: 0
    t.integer  "heavy_blades",          default: 0
    t.integer  "heavy_blades_bonus",    default: 0
    t.integer  "mallets",               default: 0
    t.integer  "mallets_bonus",         default: 0
    t.integer  "picks",                 default: 0
    t.integer  "picks_bonus",           default: 0
    t.integer  "double_lights",         default: 0
    t.integer  "double_lights_bonus",   default: 0
    t.integer  "hatchets",              default: 0
    t.integer  "hatchets_bonus",        default: 0
    t.integer  "flails",                default: 0
    t.integer  "flails_bonus",          default: 0
    t.integer  "heavy_thrown",          default: 0
    t.integer  "heavy_thrown_bonus",    default: 0
    t.integer  "maces",                 default: 0
    t.integer  "maces_bonus",           default: 0
    t.integer  "spears",                default: 0
    t.integer  "spears_bonus",          default: 0
    t.integer  "bombs",                 default: 0
    t.integer  "bombs_bonus",           default: 0
    t.integer  "bows",                  default: 0
    t.integer  "bows_bonus",            default: 0
    t.integer  "light_blades",          default: 0
    t.integer  "light_blades_bonus",    default: 0
    t.integer  "light_gauntlets",       default: 0
    t.integer  "light_gauntlets_bonus", default: 0
    t.integer  "light_thrown",          default: 0
    t.integer  "light_thrown_bonus",    default: 0
    t.integer  "slings",                default: 0
    t.integer  "slings_bonus",          default: 0
    t.integer  "blow_darts",            default: 0
    t.integer  "blow_darts_bonus",      default: 0
    t.integer  "crossbows",             default: 0
    t.integer  "crossbows_bonus",       default: 0
    t.integer  "firearms",              default: 0
    t.integer  "firearms_bonus",        default: 0
    t.integer  "crystal_orbs",          default: 0
    t.integer  "crystal_orbs_bonus",    default: 0
    t.integer  "staffs",                default: 0
    t.integer  "staffs_bonus",          default: 0
    t.integer  "divine_tomes",          default: 0
    t.integer  "divine_tomes_bonus",    default: 0
    t.integer  "symbols",               default: 0
    t.integer  "symbols_bonus",         default: 0
    t.integer  "gemstones",             default: 0
    t.integer  "gemstones_bonus",       default: 0
    t.integer  "wands",                 default: 0
    t.integer  "wands_bonus",           default: 0
    t.integer  "balance",               default: 0
    t.integer  "balance_bonus",         default: 0
    t.integer  "blocks",                default: 0
    t.integer  "blocks_bonus",          default: 0
    t.integer  "kicks",                 default: 0
    t.integer  "kicks_bonus",           default: 0
    t.integer  "pain",                  default: 0
    t.integer  "pain_bonus",            default: 0
    t.integer  "pressure_points",       default: 0
    t.integer  "pressure_points_bonus", default: 0
    t.integer  "punches",               default: 0
    t.integer  "punches_bonus",         default: 0
    t.integer  "armors",                default: 0
    t.integer  "armors_bonus",          default: 0
    t.integer  "blades",                default: 0
    t.integer  "blades_bonus",          default: 0
    t.integer  "clothing",              default: 0
    t.integer  "clothing_bonus",        default: 0
    t.integer  "foods",                 default: 0
    t.integer  "foods_bonus",           default: 0
    t.integer  "gauntlets",             default: 0
    t.integer  "shields",               default: 0
    t.integer  "shields_bonus",         default: 0
    t.integer  "structures",            default: 0
    t.integer  "structures_bonus",      default: 0
    t.integer  "tools",                 default: 0
    t.integer  "tools_bonus",           default: 0
    t.integer  "traps",                 default: 0
    t.integer  "traps_bonus",           default: 0
    t.integer  "chemicals",             default: 0
    t.integer  "chemicals_bonus",       default: 0
    t.integer  "explosives",            default: 0
    t.integer  "explosives_bonus",      default: 0
    t.integer  "machines",              default: 0
    t.integer  "machines_bonus",        default: 0
    t.integer  "sorcery",               default: 0
    t.integer  "sorcery_bonus",         default: 0
    t.integer  "enchantment",           default: 0
    t.integer  "enchantment_bonus",     default: 0
    t.integer  "divine",                default: 0
    t.integer  "divine_bonus",          default: 0
    t.integer  "barding",               default: 0
    t.integer  "barding_bonus",         default: 0
    t.integer  "wizardry",              default: 0
    t.integer  "wizardry_bonus",        default: 0
    t.integer  "alchemy",               default: 0
    t.integer  "alchemy_bonus",         default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "heavy_gauntlets",       default: 0
    t.integer  "heavy_gauntlets_bonus", default: 0
    t.integer  "flails_c",              default: 0
    t.integer  "flails_c_bonus",        default: 0
    t.integer  "mallets_c",             default: 0
    t.integer  "mallets_c_bonus",       default: 0
    t.integer  "spears_c",              default: 0
    t.integer  "spears_c_bonus",        default: 0
    t.integer  "bows_c",                default: 0
    t.integer  "bows_c_bonus",          default: 0
    t.integer  "firearms_c",            default: 0
    t.integer  "firearms_c_bonus",      default: 0
    t.integer  "gauntlets_bonus",       default: 0
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "characters_id"
  end

  add_index "users", ["characters_id"], name: "index_users_on_characters_id"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
