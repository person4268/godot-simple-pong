#Despite the name, also used by ComputerBackWall
extends KinematicBody2D

signal timer_end
var timer

func _wait( seconds ):
	self._create_timer(self, seconds, true, "_emit_timer_end_signal")
	yield(self,"timer_end")

func _emit_timer_end_signal():
	emit_signal("timer_end")

func _create_timer(object_target, float_wait_time, bool_is_oneshot, string_function):
	timer = Timer.new()
	timer.set_one_shot(bool_is_oneshot)
	timer.set_timer_process_mode(0)
	timer.set_wait_time(float_wait_time)
	timer.connect("timeout", object_target, string_function)
	self.add_child(timer)
	timer.start()


func hit():
	get_node("../Ball").hide()
	get_node("../Ball").velocity = Vector2(0, 0)
	get_node("../Computer").stop_moving()
	get_node("../Player").stop_moving()
	_wait(0.2)
	#Display game over screen if there was one
