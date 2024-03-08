extends CanvasLayer

onready var upgrades = $upgrades

func _ready():
	get_parent().get_node("ui/upgrades"). hide()

func _process(delta):
	get_parent().get_node("ui/score").text = str(Global.score)
	var score = Global.score
	var multi = Global.multi
	var ui = get_parent().get_node("ui/metal")
	ui.max_value = 50 * multi
	ui.value = score
func _upgrade():
	upgrades.show()
	Engine.time_scale = 0.01
	get_parent().get_node("ui/metal").min_value = Global.score
	

func _on_1_button_down():
	var dur = get_parent().get_node("player2").cooldown_dur
	dur -= dur*0.1
	upgrades.hide()
	Engine.time_scale = 1
	get_parent().get_node("player2").cooldown_dur = dur
	var multi = Global.multi
	multi += 1
	Global.multi = multi

func _on_2_button_up():
	upgrades.hide()
	Engine.time_scale = 1


func _on_3_button_down():
	upgrades.hide()
	Engine.time_scale = 1
