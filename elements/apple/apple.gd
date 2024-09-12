extends Node2D

var is_hited := false

const EXPLOSION_TIME := 1.0

@onready var apple_particles_parts := [
	$AppleParticles2D,
	$AppleParticles2D2
]
@onready var sprite := $Sprite2D

func _on_area_2d_body_entered(body):
	if not is_hited:
		is_hited = true
		Globals.add_apples(1)
		sprite.hide()
		var tween := create_tween()
	
		for apple_particles_part in apple_particles_parts:
			tween.parallel().tween_property(apple_particles_part, "modulate", Color("ffffff00"), EXPLOSION_TIME)
			apple_particles_part.emitting = true
		
		tween.play()
		await tween.finished
		queue_free()
	
	
