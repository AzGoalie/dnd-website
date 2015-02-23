class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
        t.references :owner
        t.references :campaign
        t.string :name
    	t.integer :gold, default: 120
    	t.integer :silver, default: 0
    	t.integer :level, default: 5
    	t.integer :xp, default: 352

    	# General
    	t.integer :hp, default: 0
    	t.integer :hp_bonus, default: 0
    	t.integer :stamina, default: 0
    	t.integer :stamina_bonus, default: 0
    	t.integer :eita, default: 0
    	t.integer :eita_bonus, default: 0
    	t.integer :initiative, default: 0
    	t.integer :initiative_bonus, default: 0
    	t.integer :adrenaline, default: 0
    	t.integer :adrenaline_bonus, default: 0
    	t.integer :focus, default: 0
    	t.integer :focus_bonus, default: 0

    	# Abilities
		t.integer :strength, default: 0
    	t.integer :strength_bonus, default: 0
    	t.integer :constitution, default: 0
    	t.integer :constitution_bonus, default: 0
    	t.integer :dexterity, default: 0
    	t.integer :dexterity_bonus, default: 0
    	t.integer :intelligence, default: 0
    	t.integer :intelligence_bonus, default: 0
    	t.integer :wisdom, default: 0
    	t.integer :wisdom_bonus, default: 0
    	t.integer :charisma, default: 0
    	t.integer :charisma_bonus, default: 0

    	# Defense
    	t.integer :block, default: 0
    	t.integer :block_bonus, default: 0
    	t.integer :reflex, default: 0
    	t.integer :reflex_bonus, default: 0
    	t.integer :resilience, default: 0
    	t.integer :resilience_bonus, default: 0
    	t.integer :willpower, default: 0
    	t.integer :willpower_bonus, default: 0

    	# Common Skills
    	t.integer :acrobatics, default: 0
    	t.integer :acrobatics_bonus, default: 0
    	t.integer :athletics, default: 0
    	t.integer :athletics_bonus, default: 0
    	t.integer :endurance, default: 0
    	t.integer :endurance_bonus, default: 0

    	t.integer :bluff, default: 0
    	t.integer :bluff_bonus, default: 0
    	t.integer :diplomacy, default: 0
    	t.integer :diplomacy_bonus, default: 0
    	t.integer :intimidate, default: 0
    	t.integer :intimidate_bonus, default: 0

    	t.integer :history, default: 0
    	t.integer :history_bonus, default: 0
    	t.integer :insight, default: 0
    	t.integer :insight_bonus, default: 0
    	t.integer :perception, default: 0
    	t.integer :perception_bonus, default: 0

    	t.integer :stealth, default: 0
    	t.integer :stealth_bonus, default: 0
    	t.integer :thievery, default: 0
    	t.integer :thievery_bonus, default: 0

    	t.integer :beast_mastery, default: 0
    	t.integer :beast_mastery_bonus, default: 0
    	t.integer :botany, default: 0
    	t.integer :botany_bonus, default: 0
    	t.integer :gathering, default: 0
    	t.integer :gathering_bonus, default: 0
    	t.integer :spelunking, default: 0
    	t.integer :spelunking_bonus, default: 0
    	t.integer :tracking, default: 0
    	t.integer :tracking_bonus, default: 0

    	# Weapon Skills
    	t.integer :axes, default: 0
    	t.integer :axes_bonus, default: 0
    	t.integer :double_axes, default: 0
    	t.integer :double_axes_bonus, default: 0
    	t.integer :double_hammers, default: 0
    	t.integer :double_hammers_bonus, default: 0
    	t.integer :heavy_blades, default: 0
    	t.integer :heavy_blades_bonus, default: 0
    	t.integer :heavy_guantlets, default: 0
    	t.integer :heavy_guantlets_bonus, default: 0
    	t.integer :mallets, default: 0
    	t.integer :mallets_bonus, default: 0
    	t.integer :picks, default: 0
    	t.integer :picks_bonus, default: 0

    	t.integer :double_lights, default: 0
    	t.integer :double_lights_bonus, default: 0
    	t.integer :hatchets, default: 0
    	t.integer :hatchets_bonus, default: 0
    	t.integer :flails, default: 0
    	t.integer :flails_bonus, default: 0
    	t.integer :heavy_thrown, default: 0
    	t.integer :heavy_thrown_bonus, default: 0
    	t.integer :maces, default: 0
    	t.integer :maces_bonus, default: 0
    	t.integer :spears, default: 0
    	t.integer :spears_bonus, default: 0

    	t.integer :bombs, default: 0
    	t.integer :bombs_bonus, default: 0
    	t.integer :bows, default: 0
    	t.integer :bows_bonus, default: 0
    	t.integer :light_blades, default: 0
    	t.integer :light_blades_bonus, default: 0
    	t.integer :light_gauntlets, default: 0
    	t.integer :light_gauntlets_bonus, default: 0
    	t.integer :light_thrown, default: 0
    	t.integer :light_thrown_bonus, default: 0
    	t.integer :slings, default: 0
    	t.integer :slings_bonus, default: 0

    	t.integer :blow_darts, default: 0
    	t.integer :blow_darts_bonus, default: 0
    	t.integer :crossbows, default: 0
    	t.integer :crossbows_bonus, default: 0
    	t.integer :firearms, default: 0
    	t.integer :firearms_bonus, default: 0

    	t.integer :crystal_orbs, default: 0
    	t.integer :crystal_orbs_bonus, default: 0
    	t.integer :staffs, default: 0
    	t.integer :staffs_bonus, default: 0
    	t.integer :divine_tomes, default: 0
    	t.integer :divine_tomes_bonus, default: 0
    	t.integer :symbols, default: 0
    	t.integer :symbols_bonus, default: 0
    	t.integer :gemstones, default: 0
    	t.integer :gemstones_bonus, default: 0
    	t.integer :wands, default: 0
    	t.integer :wands_bonus, default: 0

    	# Martial skills
    	t.integer :balance, default: 0
    	t.integer :balance_bonus, default: 0
    	t.integer :blocks, default: 0
    	t.integer :blocks_bonus, default: 0
    	t.integer :kicks, default: 0
    	t.integer :kicks_bonus, default: 0
    	t.integer :pain, default: 0
    	t.integer :pain_bonus, default: 0
    	t.integer :pressure_points, default: 0
    	t.integer :pressure_points_bonus, default: 0
    	t.integer :punches, default: 0
    	t.integer :punches_bonus, default: 0

    	# Crafts, commented ones fixed in another migrate
    	t.integer :armors, default: 0
    	t.integer :armors_bonus, default: 0
    	t.integer :blades, default: 0
    	t.integer :blades_bonus, default: 0
    	t.integer :clothing, default: 0
    	t.integer :clothing_bonus, default: 0
    	#t.integer :flails, default: 0
    	#t.integer :flails_bonus, default: 0
    	t.integer :foods, default: 0
    	t.integer :foods_bonus, default: 0
    	t.integer :gauntlets, default: 0
    	t.integer :guantlets_bonus, default: 0
    	#t.integer :mallets, default: 0
    	#t.integer :mallets_bonus, default: 0
    	#t.integer :spears, default: 0
    	#t.integer :spears_bonus, default: 0
    	t.integer :shields, default: 0
    	t.integer :shields_bonus, default: 0
    	#t.integer :bows, default: 0
    	#t.integer :bows_bonus, default: 0
    	t.integer :structures, default: 0
    	t.integer :structures_bonus, default: 0
    	t.integer :tools, default: 0
    	t.integer :tools_bonus, default: 0
    	t.integer :traps, default: 0
    	t.integer :traps_bonus, default: 0
    	t.integer :chemicals, default: 0
    	t.integer :chemicals_bonus, default: 0
    	t.integer :explosives, default: 0
    	t.integer :explosives_bonus, default: 0
    	#t.integer :firearms_ammo, default: 0
    	#t.integer :firearms_ammo_bonus, default: 0
    	t.integer :machines, default: 0
    	t.integer :machines_bonus, default: 0

    	# Magics
    	t.integer :sorcery, default: 0
    	t.integer :sorcery_bonus, default: 0
    	t.integer :enchantment, default: 0
    	t.integer :enchantment_bonus, default: 0
    	t.integer :divine, default: 0
    	t.integer :divine_bonus, default: 0
    	t.integer :barding, default: 0
    	t.integer :barding_bonus, default: 0
    	t.integer :wizardry, default: 0
    	t.integer :wizardry_bonus, default: 0
    	t.integer :alchemy, default: 0
    	t.integer :alchemy_bonus, default: 0

		t.timestamps null: false
    end
  end
end