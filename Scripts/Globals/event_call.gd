extends Node

signal pressed(component_num, component_inst, component_img)
signal placement(comp_inst,is_placeable, pos)
signal stats_call(stats)
signal stats_changed(stats)
signal clear_call
signal finished_stats_call
signal gather_score(score)
signal info_gather(name, price)
signal info_send(name, price, score)
signal score_gather(score)
signal array_finished
signal finished_stats(stats)
