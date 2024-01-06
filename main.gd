extends Control


var common = 0
var uncommon = 0
var rare = 0

@onready var console = $MainContainer/ConsolePanel/Console
@onready var common_count = $MainContainer/ResultContainer/ResultPanel/Container/Common
@onready var uncommon_count = $MainContainer/ResultContainer/ResultPanel/Container/Uncommon
@onready var rare_count = $MainContainer/ResultContainer/ResultPanel/Container/Rare


func _ready():
	pass


func dice_roll():
	# Get new random seed
	randomize()
	
	for i in 100:
		# Random using float
		#var item = get_item_rarity_float()
		# Random using integer
		var item = get_item_rarity_int()
		#print(item)
		console.text += str(item) + "\n"
		match item:
			"Common":
				common += 1
			"Uncommon":
				uncommon += 1
			"Rare":
				rare +=1
	
	#print("Common: ", str(common))
	common_count.text = "Common: " + str(common)
	#print("Uncommon: ", str(uncommon))
	uncommon_count.text = "Uncommon: " + str(uncommon)
	#print("Rare: ", str(rare))
	rare_count.text = "Rare: " + str(rare)


func get_item_rarity_float():
	var random_float = randf()

	if random_float < 0.8:
		# 80% chance of being returned
		return "Common"
	elif random_float < 0.95:
		# 15% chance of being returned
		return "Uncommon"
	else:
		# 5% chance of being returned
		return "Rare"


func get_item_rarity_int():
	var random_int = randi() % 100 + 1
	
	if random_int < 80:
		# 80% chance of being returned
		return "Common"
	elif random_int < 95:
		# 15% chance of being returned
		return "Uncommon"
	else:
		# 5% chance of being returned
		return "Rare"


func _on_Button_pressed():
	# Reset
	common = 0
	uncommon = 0
	rare = 0
	console.text = ""
	
	dice_roll()
