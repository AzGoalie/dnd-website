# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

id = ''

jQuery ->
	$('.best_in_place').best_in_place()

$(document).ready ->
	id = 'best_in_place_character_' + $('.character_id').data('id')
	update_stats()

	$('.best_in_place')
	.bind "ajax:success", (event, data) ->
		 update_stats()

update_stats = ->
	document.getElementById('level').innerHTML = level()
	document.getElementById('current_hp').innerHTML = hp_total()
	document.getElementById('current_stamina').innerHTML = stamina_total()
	document.getElementById('current_eita').innerHTML = eita_total()
	document.getElementById('hp').innerHTML = hp_total()
	document.getElementById('stamina').innerHTML = stamina_total()
	document.getElementById('eita').innerHTML = eita_total()
	document.getElementById('initiative').innerHTML = initiative_total()
	document.getElementById('adrenaline').innerHTML = adrenaline_total()
	document.getElementById('focus').innerHTML = focus_total()
	document.getElementById('strength').innerHTML = strength_total()
	document.getElementById('constitution').innerHTML = constitution_total()
	document.getElementById('dexterity').innerHTML = dexterity_total()
	document.getElementById('intelligence').innerHTML = intelligence_total()
	document.getElementById('wisdom').innerHTML = wisdom_total()
	document.getElementById('charisma').innerHTML = charisma_total()
	document.getElementById('block').innerHTML = block_total()
	document.getElementById('reflex').innerHTML = reflex_total()
	document.getElementById('resilience').innerHTML = resilience_total()
	document.getElementById('willpower').innerHTML = willpower_total()
	document.getElementById('acrobatics').innerHTML = acrobatics_total()
	document.getElementById('athletics').innerHTML = athletics_total()
	document.getElementById('endurance').innerHTML = endurance_total()
	document.getElementById('bluff').innerHTML = bluff_total()
	document.getElementById('diplomacy').innerHTML = diplomacy_total()
	document.getElementById('intimidate').innerHTML = intimidate_total()
	document.getElementById('history').innerHTML = history_total()
	document.getElementById('insight').innerHTML = insight_total()
	document.getElementById('perception').innerHTML = perception_total()
	document.getElementById('stealth').innerHTML = stealth_total()
	document.getElementById('thievery').innerHTML = thievery_total()
	document.getElementById('beast_mastery').innerHTML = beast_mastery_total()
	document.getElementById('botany').innerHTML = botany_total()
	document.getElementById('gathering').innerHTML = gathering_total()
	document.getElementById('spelunking').innerHTML = spelunking_total()
	document.getElementById('tracking').innerHTML = tracking_total()
	document.getElementById('axes').innerHTML = axes_total()
	document.getElementById('double_axes').innerHTML = double_axes_total()
	document.getElementById('double_hammers').innerHTML = double_hammers_total()
	document.getElementById('heavy_blades').innerHTML = heavy_blades_total()
	document.getElementById('heavy_gauntlets').innerHTML = heavy_gauntlets_total()
	document.getElementById('mallets').innerHTML = mallets_total()
	document.getElementById('picks').innerHTML = picks_total()
	document.getElementById('double_lights').innerHTML = double_lights_total()
	document.getElementById('hatchets').innerHTML = hatchets_total()
	document.getElementById('flails').innerHTML = flails_total()
	document.getElementById('heavy_thrown').innerHTML = heavy_thrown_total()
	document.getElementById('maces').innerHTML = maces_total()
	document.getElementById('spears').innerHTML = spears_total()
	document.getElementById('bombs').innerHTML = bombs_total()
	document.getElementById('bows').innerHTML = bows_total()
	document.getElementById('light_blades').innerHTML = light_blades_total()
	document.getElementById('light_gauntlets').innerHTML = light_gauntlets_total()
	document.getElementById('light_thrown').innerHTML = light_thrown_total()
	document.getElementById('slings').innerHTML = slings_total()
	document.getElementById('blow_darts').innerHTML = blow_darts_total()
	document.getElementById('crossbows').innerHTML = crossbows_total()
	document.getElementById('firearms').innerHTML = firearms_total()
	document.getElementById('crystal_orbs').innerHTML = crystal_orbs_total()
	document.getElementById('staffs').innerHTML = staffs_total()
	document.getElementById('divine_tomes').innerHTML = divine_tomes_total()
	document.getElementById('symbols').innerHTML = symbols_total()
	document.getElementById('gemstones').innerHTML = gemstones_total()
	document.getElementById('wands').innerHTML = wands_total()
	document.getElementById('balance').innerHTML = balance_total()
	document.getElementById('blocks').innerHTML = blocks_total()
	document.getElementById('kicks').innerHTML = kicks_total()
	document.getElementById('pain').innerHTML = pain_total()
	document.getElementById('pressure_points').innerHTML = pressure_points_total()
	document.getElementById('punches').innerHTML = punches_total()
	document.getElementById('armors').innerHTML = armors_total()
	document.getElementById('blades').innerHTML = blades_total()
	document.getElementById('clothing').innerHTML = clothing_total()
	document.getElementById('flails_c').innerHTML = flails_c_total()
	document.getElementById('foods').innerHTML = foods_total()
	document.getElementById('gauntlets').innerHTML = gauntlets_total()
	document.getElementById('mallets_c').innerHTML = mallets_c_total()
	document.getElementById('spears_c').innerHTML = spears_c_total()
	document.getElementById('shields').innerHTML = shields_total()
	document.getElementById('bows_c').innerHTML = bows_c_total()
	document.getElementById('structures').innerHTML = structures_total()
	document.getElementById('tools').innerHTML = tools_total()
	document.getElementById('traps').innerHTML = traps_total()
	document.getElementById('chemicals').innerHTML = chemicals_total()
	document.getElementById('explosives').innerHTML = explosives_total()
	document.getElementById('firearms_c').innerHTML = firearms_c_total()
	document.getElementById('machines').innerHTML = machines_total()
	document.getElementById('sorcery').innerHTML = sorcery_total()
	document.getElementById('enchantment').innerHTML = enchantment_total()
	document.getElementById('divine').innerHTML = divine_total()
	document.getElementById('barding').innerHTML = barding_total()
	document.getElementById('wizardry').innerHTML = wizardry_total()
	document.getElementById('alchemy').innerHTML = alchemy_total()

get_value = (name) ->
	Number(document.getElementById(id+'_'+name).innerHTML)

get_level = ->
	Number(document.getElementById('level').innerHTML)

level = ->
	x = get_value('xp')
	Math.ceil((50/27)*(((Math.pow(2,0.25))*(Math.pow(15,0.5))*(Math.pow(-1+Math.log(x/75),0.25))*(-1+Math.log(x/75)))))

hp_total = ->
	n = 2		# Base
	p = get_value('hp')
	bonus = get_value('hp_bonus')
	other = strength_total() + constitution_total() + block_total() + resilience_total() + 2*get_level()
	total = parseInt(other) + parseInt(bonus) + parseInt(p/n)


stamina_total = ->
	n = 4		# Base
	p = get_value('stamina')
	bonus = get_value('stamina_bonus')
	other = (strength_total() + constitution_total() + dexterity_total() + block_total() + reflex_total() + resilience_total()) * 2 + 2 * get_level()
	
	total = parseInt(other) + parseInt(bonus) + parseInt(p/n)


eita_total = ->
	n = 4		# Base
	p = get_value('eita')
	bonus = get_value('eita_bonus')
	other = (intelligence_total() + wisdom_total() + charisma_total() + willpower_total() + sorcery_total() + enchantment_total() + divine_total() + barding_total() + wizardry_total() + alchemy_total()) * 2

	total = parseInt(other) + parseInt(bonus) + parseInt(p/n)


initiative_total = ->
	n = 6		# Base
	p = get_value('initiative')
	bonus = get_value('initiative_bonus')
	other = dexterity_total() + reflex_total() + athletics_total() + insight_total()
	
	total = parseInt(other) + parseInt(bonus) + parseInt(p/n)


adrenaline_total = ->
	n = 6		# Base
	p = get_value('adrenaline')
	bonus = get_value('adrenaline_bonus')
	other = constitution_total() + 2*resilience_total() + endurance_total()
	
	total = parseInt(other) + parseInt(bonus) + parseInt(p/n)


focus_total = ->
	n = 6		# Base
	p = get_value('focus')
	bonus = get_value('focus_bonus')
	other = wisdom_total() + 0.5 * charisma_total() + willpower_total() + insight_total()

	total = parseInt(other) + parseInt(bonus) + parseInt(p/n)


strength_total = ->
	n = 6		# Base
	p = get_value('strength')
	bonus = get_value('strength_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/60
	
	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


constitution_total = ->
	n = 6		# Base
	p = get_value('constitution')
	bonus = get_value('constitution_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/50

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


dexterity_total = ->
	n = 6		# Base
	p = get_value('dexterity')
	bonus = get_value('dexterity_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/70

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


intelligence_total = ->
	n = 6		# Base
	p = get_value('intelligence')
	bonus = get_value('intelligence_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/70

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


wisdom_total = ->
	n = 6		# Base
	p = get_value('wisdom')
	bonus = get_value('wisdom_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/50

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


charisma_total = ->
	n = 6		# Base
	p = get_value('charisma')
	bonus = get_value('charisma_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/60

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


block_total = ->
	n = 4		# Base
	p = get_value('block')
	bonus = get_value('block_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/60

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


reflex_total = ->
	n = 4		# Base
	p = get_value('reflex')
	bonus = get_value('reflex_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/70

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


resilience_total = ->
	n = 4		# Base
	p = get_value('resilience')
	bonus = get_value('resilience_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/50

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


willpower_total = ->
	n = 4		# Base
	p = get_value('willpower')
	bonus = get_value('willpower_bonus')
	other = (parseInt(p/n) + bonus) * get_level()/60

	total = parseInt(p/n) + parseInt(other) + parseInt(bonus)


acrobatics_total = ->
	n = 4		# Base
	p = get_value('acrobatics')
	bonus = get_value('acrobatics_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5 + reflex_total()/7 + strength_total()/9 + constitution_total()/11 + block_total()/13 + resilience_total()/15 + charisma_total()/17 + willpower_total()/19 + intelligence_total()/21 + wisdom_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


athletics_total = ->
	n = 3		# Base
	p = get_value('athletics')
	bonus = get_value('athletics_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5 + constitution_total()/7 + block_total()/9 + resilience_total()/11 + dexterity_total()/13 + reflex_total()/15 + willpower_total()/17 + intelligence_total()/19 + wisdom_total()/21 + charisma_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


endurance_total = ->
	n = 2		# Base
	p = get_value('endurance')
	bonus = get_value('endurance_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = constitution_total()/5 + resilience_total()/7 + strength_total()/9 + block_total()/11 + dexterity_total()/13 + intelligence_total()/15 + willpower_total()/17 + wisdom_total()/19 + reflex_total()/21 + charisma_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


bluff_total = ->
	n = 3		# Base
	p = get_value('bluff')
	bonus = get_value('bluff_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = charisma_total()/5+intelligence_total()/7+reflex_total()/9+willpower_total()/11+wisdom_total()/13+strength_total()/15+dexterity_total()/17+block_total()/19+resilience_total()/21+willpower_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

diplomacy_total = ->
	n = 2		# Base
	p = get_value('diplomacy')
	bonus = get_value('diplomacy_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = charisma_total()/5+wisdom_total()/7+intelligence_total()/9+reflex_total()/11+willpower_total()/13+strength_total()/15+dexterity_total()/17+block_total()/19+resilience_total()/21+constitution_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

intimidate_total = ->
	n = 3		# Base
	p = get_value('intimidate')
	bonus = get_value('intimidate_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5 + resilience_total()/7 + willpower_total()/9 + intelligence_total()/11 + charisma_total()/13 + wisdom_total()/15 + dexterity_total()/17 + constitution_total()/19 + block_total()/21 + reflex_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


history_total = ->
	n = 3		# Base
	p = get_value('history')
	bonus = get_value('history_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/5+willpower_total()/7+wisdom_total()/9+charisma_total()/11+dexterity_total()/13+reflex_total()/15+constitution_total()/17+resilience_total()/19+strength_total()/21+block_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

insight_total = ->
	n = 3		# Base
	p = get_value('insight')
	bonus = get_value('insight_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = wisdom_total()/5 + intelligence_total()/7 + reflex_total()/9 + charisma_total()/11 + willpower_total()/13 + dexterity_total()/15 + constitution_total()/17 + block_total()/19 + strength_total()/21 + resilience_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


perception_total = ->
	n = 2		# Base
	p = get_value('perception')
	bonus = get_value('perception_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/5+wisdom_total()/7+intelligence_total()/9+charisma_total()/11+dexterity_total()/13+willpower_total()/15+constitution_total()/17+resilience_total()/19+strength_total()/21+block_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

stealth_total = ->
	n = 3		# Base
	p = get_value('stealth')
	bonus = get_value('stealth_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/5+wisdom_total()/7+dexterity_total()/9+willpower_total()/11+intelligence_total()/13+charisma_total()/15+resilience_total()/17+constitution_total()/19+strength_total()/21+block_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

thievery_total = ->
	n = 2		# Base
	p = get_value('thievery')
	bonus = get_value('thievery_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/5+charisma_total()/7+dexterity_total()/9+willpower_total()/11+wisdom_total()/13+intelligence_total()/15+resilience_total()/17+strength_total()/19+block_total()/21+constitution_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

beast_mastery_total = ->
	n = 4		# Base
	p = get_value('beast_mastery')
	bonus = get_value('beast_mastery_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = charisma_total()/5+strength_total()/7+willpower_total()/9+intelligence_total()/11+wisdom_total()/13+constitution_total()/15+reflex_total()/17+dexterity_total()/19+resilience_total()/21+block_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

botany_total = ->
	n = 3		# Base
	p = get_value('botany')
	bonus = get_value('botany_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/5+dexterity_total()/7+wisdom_total()/9+willpower_total()/11+charisma_total()/13+reflex_total()/15+constitution_total()/17+resilience_total()/19+block_total()/21+strength_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

gathering_total = ->
	n = 2		# Base
	p = get_value('gathering')
	bonus = get_value('gathering_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5+wisdom_total()/7+intelligence_total()/9+willpower_total()/11+reflex_total()/13+charisma_total()/15+constitution_total()/17+strength_total()/19+resilience_total()/21+block_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

spelunking_total = ->
	n = 5		# Base
	p = get_value('spelunking')
	bonus = get_value('spelunking_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5+intelligence_total()/7+wisdom_total()/9+willpower_total()/11+reflex_total()/13+constitution_total()/15+resilience_total()/17+strength_total()/19+block_total()/21+charisma_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

tracking_total = ->
	n = 3		# Base
	p = get_value('tracking')
	bonus = get_value('tracking_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/5+reflex_total()/7+wisdom_total()/9+dexterity_total()/11+charisma_total()/13+willpower_total()/15+resilience_total()/17+constitution_total()/19+strength_total()/21+block_total()/23

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

axes_total = ->
	n = 4		# Base
	p = get_value('axes')
	bonus = get_value('axes_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

double_axes_total = ->
	n = 4		# Base
	p = get_value('double_axes')
	bonus = get_value('double_axes_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

double_hammers_total = ->
	n = 4		# Base
	p = get_value('double_hammers')
	bonus = get_value('double_hammers_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

heavy_blades_total = ->
	n = 4		# Base
	p = get_value('heavy_blades')
	bonus = get_value('heavy_blades_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

heavy_gauntlets_total = ->
	n = 4		# Base
	p = get_value('heavy_gauntlets')
	bonus = get_value('heavy_gauntlets_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

mallets_total = ->
	n = 4		# Base
	p = get_value('mallets')
	bonus = get_value('mallets_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

picks_total = ->
	n = 4		# Base
	p = get_value('picks')
	bonus = get_value('picks_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = strength_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

double_lights_total = ->
	n = 3		# Base
	p = get_value('double_lights')
	bonus = get_value('double_lights_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = parseInt(dexterity_total()/5) + parseInt(strength_total()/7)

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

hatchets_total = ->
	n = 3		# Base
	p = get_value('hatchets')
	bonus = get_value('hatchets_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = parseInt(strength_total()/5) + parseInt(dexterity_total()/7)

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

flails_total = ->
	n = 3		# Base
	p = get_value('flails')
	bonus = get_value('flails_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = parseInt(dexterity_total()/5) + parseInt(strength_total()/7)

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

heavy_thrown_total = ->
	n = 3		# Base
	p = get_value('heavy_thrown')
	bonus = get_value('heavy_thrown_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = parseInt(dexterity_total()/5) + parseInt(strength_total()/7)

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

maces_total = ->
	n = 3		# Base
	p = get_value('maces')
	bonus = get_value('maces_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = parseInt(strength_total()/5) + parseInt(dexterity_total()/7)

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

spears_total = ->
	n = 3		# Base
	p = get_value('spears')
	bonus = get_value('spears_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = parseInt(strength_total()/5) + parseInt(dexterity_total()/7)

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

bombs_total = ->
	n = 2		# Base
	p = get_value('bombs')
	bonus = get_value('bombs_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

bows_total = ->
	n = 2		# Base
	p = get_value('bows')
	bonus = get_value('bows_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

light_blades_total = ->
	n = 2		# Base
	p = get_value('light_blades')
	bonus = get_value('light_blades_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

light_gauntlets_total = ->
	n = 2		# Base
	p = get_value('light_gauntlets')
	bonus = get_value('light_gauntlets_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

light_thrown_total = ->
	n = 2		# Base
	p = get_value('light_thrown')
	bonus = get_value('light_thrown_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

slings_total = ->
	n = 2		# Base
	p = get_value('slings')
	bonus = get_value('slings_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

blow_darts_total = ->
	n = 2		# Base
	p = get_value('blow_darts')
	bonus = get_value('blow_darts_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

crossbows_total = ->
	n = 2		# Base
	p = get_value('crossbows')
	bonus = get_value('crossbows_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

firearms_total = ->
	n = 2		# Base
	p = get_value('firearms')
	bonus = get_value('firearms_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/5

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

crystal_orbs_total = ->
	n = 6		# Base
	p = get_value('crystal_orbs')
	bonus = get_value('crystal_orbs_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = wisdom_total()/5 + charisma_total()/10 + intelligence_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

staffs_total = ->
	n = 6		# Base
	p = get_value('staffs')
	bonus = get_value('staffs_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = wisdom_total()/5 + charisma_total()/10 + intelligence_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

divine_tomes_total = ->
	n = 6		# Base
	p = get_value('divine_tomes')
	bonus = get_value('divine_tomes_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = charisma_total()/5 + wisdom_total()/10 + intelligence_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

symbols_total = ->
	n = 6		# Base
	p = get_value('symbols')
	bonus = get_value('symbols_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = charisma_total()/5 + wisdom_total()/10 + intelligence_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

gemstones_total = ->
	n = 6		# Base
	p = get_value('gemstones')
	bonus = get_value('gemstones_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/5 + charisma_total()/10 + wisdom_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

wands_total = ->
	n = 6		# Base
	p = get_value('wands')
	bonus = get_value('wands_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/5 + charisma_total()/10 + wisdom_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

balance_total = ->
	n = 6		# Base
	p = get_value('balance')
	bonus = get_value('balance_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = willpower_total()/10+dexterity_total()/12+reflex_total()/14+strength_total()/16+intelligence_total()/18+charisma_total()/20+wisdom_total()/22+constitution_total()/24+block_total()/26+resilience_total()/28

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

blocks_total = ->
	n = 4		# Base
	p = get_value('blocks')
	bonus = get_value('blocks_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = block_total()/10+constitution_total()/12+reflex_total()/14+strength_total()/16+dexterity_total()/18+intelligence_total()/20+resilience_total()/22+willpower_total()/24+wisdom_total()/26+charisma_total()/28

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

kicks_total = ->
	n = 2		# Base
	p = get_value('kicks')
	bonus = get_value('kicks_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/10+strength_total()/12+block_total()/14+intelligence_total()/16+dexterity_total()/18+willpower_total()/20+resilience_total()/22+constitution_total()/24+charisma_total()/26+wisdom_total()/28

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

pain_total = ->
	n = 8		# Base
	p = get_value('pain')
	bonus = get_value('pain_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = resilience_total()/10+intelligence_total()/12+willpower_total()/14+constitution_total()/16+wisdom_total()/18+dexterity_total()/20+strength_total()/22+block_total()/24+charisma_total()/26+reflex_total()/28

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

pressure_points_total = ->
	n = 10		# Base
	p = get_value('pressure_points')
	bonus = get_value('pressure_points_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = resilience_total()/10+intelligence_total()/12+willpower_total()/14+charisma_total()/16+wisdom_total()/18+dexterity_total()/20+constitution_total()/22+strength_total()/24+block_total()/26+reflex_total()/28

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

punches_total = ->
	n = 2		# Base
	p = get_value('punches')
	bonus = get_value('punches_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = reflex_total()/10+strength_total()/12+block_total()/14+intelligence_total()/16+dexterity_total()/18+willpower_total()/20+constitution_total()/22+resilience_total()/24+charisma_total()/26+wisdom_total()/28

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

armors_total = ->
	n = 2		# Base
	p = get_value('armors')
	bonus = get_value('armors_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/10 + intelligence_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

blades_total = ->
	n = 2		# Base
	p = get_value('blades')
	bonus = get_value('blades_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + dexterity_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

clothing_total = ->
	n = 2		# Base
	p = get_value('clothing')
	bonus = get_value('clothing_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/10 + intelligence_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

flails_c_total = ->
	n = 2		# Base
	p = get_value('flails_c')
	bonus = get_value('flails_c_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + dexterity_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

foods_total = ->
	n = 2		# Base
	p = get_value('foods')
	bonus = get_value('foods_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + dexterity_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

gauntlets_total = ->
	n = 2		# Base
	p = get_value('gauntlets')
	bonus = get_value('gauntlets_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/10 + intelligence_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

mallets_c_total = ->
	n = 2		# Base
	p = get_value('mallets')
	bonus = get_value('mallets_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + dexterity_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

spears_c_total = ->
	n = 2		# Base
	p = get_value('spears_c')
	bonus = get_value('spears_c_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + dexterity_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

shields_total = ->
	n = 2		# Base
	p = get_value('shields')
	bonus = get_value('shields_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + dexterity_total()/15

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

bows_c_total = ->
	n = 3		# Base
	p = get_value('bows_c')
	bonus = get_value('bows_c_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/15 + intelligence_total()/20

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

structures_total = ->
	n = 3		# Base
	p = get_value('structures')
	bonus = get_value('structures_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/15 + dexterity_total()/20

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

tools_total = ->
	n = 3		# Base
	p = get_value('tools')
	bonus = get_value('tools_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/15 + dexterity_total()/20

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

traps_total = ->
	n = 3		# Base
	p = get_value('traps')
	bonus = get_value('traps_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/15 + intelligence_total()/20

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

chemicals_total = ->
	n = 4		# Base
	p = get_value('chemicals')
	bonus = get_value('chemicals_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/25 + dexterity_total()/30

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

explosives_total = ->
	n = 4		# Base
	p = get_value('explosives')
	bonus = get_value('explosives_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/25 + intelligence_total()/30

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

firearms_c_total = ->
	n = 4		# Base
	p = get_value('firearms_c')
	bonus = get_value('firearms_c_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = dexterity_total()/25 + intelligence_total()/30

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

machines_total = ->
	n = 4		# Base
	p = get_value('machines')
	bonus = get_value('machines_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/25 + dexterity_total()/30

	total = parseInt(s) + parseInt(other) + parseInt(bonus)

sorcery_total = ->
	n = 2		# Base
	p = get_value('sorcery')
	bonus = get_value('sorcery_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = wisdom_total()/10 + charisma_total()/20 + intelligence_total()/40

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


enchantment_total = ->
	n = 2		# Base
	p = get_value('enchantment')
	bonus = get_value('enchantment_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = wisdom_total()/10 + charisma_total()/20 + intelligence_total()/40

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


divine_total = ->
	n = 2		# Base
	p = get_value('divine')
	bonus = get_value('divine_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = charisma_total()/10 + wisdom_total()/15 + intelligence_total()/20

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


barding_total = ->
	n = 2		# Base
	p = get_value('barding')
	bonus = get_value('barding_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = charisma_total()/10 + wisdom_total()/15 + intelligence_total()/20

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


wizardry_total = ->
	n = 2		# Base
	p = get_value('wizardry')
	bonus = get_value('wizardry_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + charisma_total()/20 + wisdom_total()/25

	total = parseInt(s) + parseInt(other) + parseInt(bonus)


alchemy_total = ->
	n = 2		# Base
	p = get_value('alchemy')
	bonus = get_value('alchemy_bonus')
	s = 2 * Math.sqrt(p + n*(n-1) + 0.25) - 2*n+1
	other = intelligence_total()/10 + charisma_total()/20 + wisdom_total()/25

	total = parseInt(s) + parseInt(other) + parseInt(bonus)