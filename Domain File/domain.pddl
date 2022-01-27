(define (domain concrete_printer)
(:requirements :typing :durative-actions :fluents) 
(:types
    vertex   	
)
(:predicates	
    (valid_move ?vtx_from - vertex ?vtx_to - vertex)
    (printed_link ?vtx_from - vertex ?vtx_to - vertex)
    (above_on ?vtx_from - vertex ?vtx_up - vertex)
    (visited ?vtx - vertex)
    (initial_vertex ?vtx - vertex)
    (nozzle_at ?vtx - vertex)
    (nozzle_is_open)
    (nozzle_is_close)
    (not_printed ?vtx_from - vertex ?vtx_to - vertex)
    (on_same_way ?vtx_from - vertex ?vtx_to - vertex)
    (not_on_same_way ?vtx_from - vertex ?vtx_to - vertex)
)
(:functions
	(layer_tickness) 
	(nozzle_angle)
	(nozzle_height)
	(rest_time)
	(relocate_time)
	(change_layer)
	(link_length ?vtx_from - vertex ?vtx_to - vertex)
	(printing_velocity ?vtx_from - vertex ?vtx_to - vertex)
	(motion_angle ?vtx_from - vertex ?vtx_to - vertex)
	(link_height ?vtx_from - vertex ?vtx_to - vertex)
)
(:durative-action print
	:parameters (?from - vertex ?to - vertex)
	:duration (= ?duration (/ (link_length ?from ?to) (printing_velocity ?from ?to) ))
	:condition (and
		(at start (nozzle_at ?from))
		(at start (valid_move ?from  ?to))
		(at start (nozzle_is_open))
		(at start (not_printed ?from ?to))
		(at start (> (nozzle_height) (link_height ?from ?to)))
		(at start (on_same_way ?from ?to)))
	:effect (and 
		(at end (not (nozzle_at ?from)))
		(at end (not (not_printed ?from ?to)))
		(at end (nozzle_at ?to))
		(at end (visited ?to))
		(at end (printed_link ?from ?to)))
)
(:action switch_off
	:parameters (?from - vertex ?to - vertex)
	:precondition (and 
		 (nozzle_at ?to)
		 (valid_move ?from ?to)
		 (visited ?from)
		 (visited ?to)
	(printed_link ?from ?to)
		 (on_same_way ?from ?to)
		 (nozzle_is_open))
	:effect (and 
		 (not (nozzle_is_open))
		 (nozzle_is_close))
)	
(:action switch_on
	:parameters (?from - vertex ?to - vertex)
	:precondition (and 
		(nozzle_at ?from)
	    (valid_move ?from ?to)
		(visited ?from)
		(not_printed ?from ?to)
		(on_same_way ?from ?to)
		(nozzle_is_close))
	:effect (and 
		(not (nozzle_is_close))
		(nozzle_is_open))
)
(:durative-action rotate_nozzle
	:parameters (?from - vertex ?to - vertex) 
	:duration (= ?duration 1)
	:condition (and 
		(at start (valid_move ?from ?to))
		(at start (nozzle_at ?from))
		(at start (visited ?from))
		(at start (> (nozzle_height) (link_height ?from ?to)))
		(at start (nozzle_is_close)))
	:effect (and
	    (at end (on_same_way ?from ?to))
	    (at end (assign (nozzle_angle) (motion_angle ?from ?to))))
)
(:durative-action go_to_init
	:parameters (?from - vertex ?to - vertex)
	:duration (= ?duration relocate_time)
	:condition (and 
		(at start (nozzle_at ?from))
		(at start (valid_move ?from  ?to))
		(at start (nozzle_is_close))
		(at start (visited ?from))
		(at start (visited ?to))
		(at start (on_same_way ?from ?to)))
	:effect (and 
		(at end (not (nozzle_at ?from)))
		(at end (nozzle_at ?to)))
)
(:durative-action waiting
	:parameters (?from - vertex ?to - vertex)
	:duration (= ?duration rest_time)
	:condition (and 
		(at start (nozzle_at ?from))
		(at start (printed_link ?from ?to))
		(at start (initial_vertex ?from)))
	:effect (and 
		(at end (assign (change_layer) 1)))
)
(:durative-action increase_nozzle_height
	:parameters (?from - vertex ?to - vertex ?up - vertex)
	:duration (= ?duration 1)
	:condition (and 
		(at start (nozzle_at ?from))
	    (at start (nozzle_is_close))
		(at start (above_on ?from ?up))
		(at start (> (change_layer) 0))
		(at start (initial_vertex ?from))
		(at start (printed_link ?from ?to))
	)
	:effect (and
		(at end (increase (nozzle_height) (layer_tickness)))
		(at end (not (nozzle_at ?from)))
		(at end (nozzle_at ?up))
		(at end (assign (change_layer) 0))
		(at end (visited ?up)))
))
