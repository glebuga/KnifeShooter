extends RefCounted
class_name Stage

var knives := 0
var apples := 0
var target_scene_resource : PackedScene 


func _init(_target_scene = null):
	var target = load("res://elements/targets/target/target.tscn")
	target_scene_resource = _target_scene if _target_scene != null else target
