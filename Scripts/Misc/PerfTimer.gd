extends Node
class_name PerfTimer


static  var _timers: Dictionary  = {}


static func start(label: String):
	_timers[label] = Time.get_ticks_usec()
	
static func stop(label: String) -> int:
	var elapsed: int = Time.get_ticks_usec() - _timers[label]
	print("[%s] %.3f ms" % [label, elapsed / 1000.0])
	_timers.erase(label)
	return elapsed
