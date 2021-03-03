extends Node2D

onready var back: Sprite = $back_Sprite
onready var front: Sprite = $front_sprite

export var ease_value: float = 0.25
export var range_of_joystic: int = 200

export var back_sprite: Texture
export var front_sprite: Texture

export var area_width: float
export var area_height: float
var area_active: bool



var screensize: Vector2

func _ready() -> void:
	screensize = get_viewport_rect().size
	back.texture = back_sprite
	front.texture = front_sprite

func _process(delta) -> void:
	front_related()

func front_related():
	var mousePos := back.get_local_mouse_position() + back.global_position
	if Input.is_action_pressed("click") and area_active == true: #Send to where the mouse position is
		front.global_position = lerp(back.global_position, mousePos,0.4)
		print(get_global_mouse_position(),"   1",back.get_local_mouse_position(),  "    ", front.global_position - back.global_position)
	else: #Send back to center
		front.global_position = lerp(front.global_position, back.global_position, ease_value)



func _on_Area_pressed():
	print('a')
	back.global_position = get_global_mouse_position()
	area_active = true

func _on_Area_released():
	area_active = false
