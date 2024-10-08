extends Node

enum LOCATIONS {START, GAME, SHOP }

signal game_over
signal location_changed(location: LOCATIONS)
signal points_changed(points: int)
signal knives_changed(knives: int)
signal apples_changed(apples: int)
signal stage_changed(stage: Stage)
signal active_knife_change(knife_index: int)
