extends CanvasLayer

@onready var knives_counter := %KnivesCounter
@onready var home_button = %HomeButton
@onready var points_label = %PointsLabel
@onready var stage_counter = %StageCounter
@onready var stage_label = %StageLabel
@onready var apples_counter_label = %ApplesCounter/Label


func _ready():
	Events.location_changed.connect(update_hud_location)
	Events.points_changed.connect(update_points)
	Events.apples_changed.connect(update_apples)
	Events.stage_changed.connect(update_stage_label)
	update_apples(Globals.apples)
	update_hud_location(Events.LOCATIONS.START)
	

func update_stage_label(stage: Stage):
	stage_label.text = "STAGE {0}".format([Globals.current_stage])


func update_apples(amount: int):
	apples_counter_label.text = str(amount)
	

func _on_home_button_pressed():
	Events.location_changed.emit(Events.LOCATIONS.START)


func update_hud_location(location: Events.LOCATIONS):
	match location:
		Events.LOCATIONS.START:
			knives_counter.hide()
			home_button.hide()
			points_label.hide()
			stage_label.hide()
			stage_counter.hide()
		Events.LOCATIONS.GAME:
			knives_counter.show()
			home_button.hide()
			points_label.show()
			stage_label.show()
			stage_counter.show()
		Events.LOCATIONS.SHOP:
			knives_counter.hide()
			home_button.show()
			points_label.hide()
			stage_label.hide()
			stage_counter.hide()


func update_hud_restart():
	knives_counter.hide()
	home_button.show()
	points_label.hide()
	stage_label.hide()
	stage_counter.hide()


func update_points(points: int):
	points_label.text = str(points)
