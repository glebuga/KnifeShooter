extends Control

@onready var texture_rect = $MarginContainer/VBoxContainer/CenterContainer/TextureRect

func _ready():
	texture_rect.texture = Globals.KNIFE_TEXTURES[Globals.active_knife_index]

func _on_button_pressed():
	Events.location_changed.emit(Events.LOCATIONS.GAME)


func _on_texture_button_pressed():
	Events.location_changed.emit(Events.LOCATIONS.SHOP)
