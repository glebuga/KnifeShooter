extends Control


@onready var grid_container = $MarginContainer/VBoxContainer/GridContainer
@onready var active_knife_texture = $MarginContainer/VBoxContainer/ActiveKnifeTexture

func _ready():
	Events.active_knife_change.connect(active_knife_index)
	active_knife_index(Globals.active_knife_index)
	for i in range(Globals.KNIFE_TEXTURES.size()):
		var shop_item := grid_container.get_child(i)
		shop_item.initialize(i)


func active_knife_index(knife_idx: int):
	active_knife_texture.texture = Globals.KNIFE_TEXTURES[knife_idx]


func _on_unblock_item_pressed():
	if Globals.apples >= Globals.UNLOCK_COST:
		var locked_knives := []
		for i in range(Globals.KNIFE_TEXTURES.size()):
			if not Globals.is_knife_unlock(i):
				locked_knives.append(i)
				
		if locked_knives.is_empty():
			return
			
		var random_index = locked_knives.pick_random()
		Globals.unlock_knife(random_index)
		Globals.add_apples(-Globals.UNLOCK_COST)
		Globals.save_game()
		
		grid_container.get_child(random_index).unlock()
