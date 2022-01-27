(define (problem concrete_printer_task)
(:domain concrete_printer)
(:objects	
	vtx00 - vertex
	vtx01 - vertex
	vtx02 - vertex
	vtx03 - vertex
    vtx04 - vertex
	vtx05 - vertex
    vtx06 - vertex
	vtx07 - vertex

    vtx10 - vertex
	vtx11 - vertex
	vtx12 - vertex
	vtx13 - vertex
    vtx14 - vertex
	vtx15 - vertex
    vtx16 - vertex
	vtx17 - vertex
)	
(:init	
	(valid_move vtx00 vtx01)
	(valid_move vtx01 vtx02)
	(valid_move vtx02 vtx03)
	(valid_move vtx03 vtx04)
	(valid_move vtx04 vtx05)
	(valid_move vtx05 vtx06)
	(valid_move vtx06 vtx07)
	(valid_move vtx07 vtx00)
	
	(valid_move vtx10 vtx11)
	(valid_move vtx11 vtx12)
	(valid_move vtx12 vtx13)
	(valid_move vtx13 vtx14)
	(valid_move vtx14 vtx15)
	(valid_move vtx15 vtx16)
	(valid_move vtx16 vtx17)
	(valid_move vtx17 vtx10)
	
	(not_printed vtx00 vtx01)
	(not_printed vtx01 vtx02)
	(not_printed vtx02 vtx03)
	(not_printed vtx03 vtx04)
	(not_printed vtx04 vtx05)
	(not_printed vtx05 vtx06)
	(not_printed vtx06 vtx07)
	(not_printed vtx07 vtx00)
	
	(not_printed vtx10 vtx11)
	(not_printed vtx11 vtx12)
	(not_printed vtx12 vtx13)
	(not_printed vtx13 vtx14)
	(not_printed vtx14 vtx15)
	(not_printed vtx15 vtx16)
	(not_printed vtx16 vtx17)
	(not_printed vtx17 vtx10)
	
	(on_same_way vtx00 vtx01)
    (above_on vtx00 vtx10)
	(visited vtx00)
	(nozzle_at vtx00)
	(nozzle_is_close)	
	(initial_vertex vtx00)
	(initial_vertex vtx10)
	(= (printing_velocity vtx00 vtx01) 0.08)
	(= (printing_velocity vtx01 vtx02) 0.08)
	(= (printing_velocity vtx02 vtx03) 0.08)
	(= (printing_velocity vtx03 vtx04) 0.08)
	(= (printing_velocity vtx04 vtx05) 0.08)
	(= (printing_velocity vtx05 vtx06) 0.08)
	(= (printing_velocity vtx06 vtx07) 0.08)
	(= (printing_velocity vtx07 vtx00) 0.08)
	
	(= (printing_velocity vtx10 vtx11) 0.08)
	(= (printing_velocity vtx11 vtx12) 0.08)
	(= (printing_velocity vtx12 vtx13) 0.08)
	(= (printing_velocity vtx13 vtx14) 0.08)
	(= (printing_velocity vtx14 vtx15) 0.08)
	(= (printing_velocity vtx15 vtx16) 0.08)
	(= (printing_velocity vtx16 vtx17) 0.08)
	(= (printing_velocity vtx17 vtx10) 0.08)
	
	(= (link_length vtx00 vtx01) 0.5)
	(= (link_length vtx01 vtx02) 0.5)
	(= (link_length vtx02 vtx03) 0.5)
	(= (link_length vtx03 vtx04) 1)
	(= (link_length vtx04 vtx05) 0.5)
	(= (link_length vtx05 vtx06) 0.5)
	(= (link_length vtx06 vtx07) 1.5)
	(= (link_length vtx07 vtx00) 1)
	
	(= (link_length vtx10 vtx11) 0.5)
	(= (link_length vtx11 vtx12) 0.5)
	(= (link_length vtx12 vtx13) 0.5)
	(= (link_length vtx13 vtx14) 1)
	(= (link_length vtx14 vtx15) 0.5)
	(= (link_length vtx15 vtx16) 0.5)
	(= (link_length vtx16 vtx17) 1.5)
	(= (link_length vtx17 vtx10) 1)
	
	(= (motion_angle vtx00 vtx01) 0)
	(= (motion_angle vtx01 vtx02) 90)
	(= (motion_angle vtx02 vtx03) 90)
	(= (motion_angle vtx03 vtx04) 90)
	(= (motion_angle vtx04 vtx05) 90)
	(= (motion_angle vtx05 vtx06) 90)
	(= (motion_angle vtx06 vtx07) 90)
	(= (motion_angle vtx07 vtx00) 90)
	
	(= (motion_angle vtx10 vtx11) 0)
	(= (motion_angle vtx11 vtx12) 90)
	(= (motion_angle vtx12 vtx13) 90)
	(= (motion_angle vtx13 vtx14) 90)
	(= (motion_angle vtx14 vtx15) 90)
	(= (motion_angle vtx15 vtx16) 90)
	(= (motion_angle vtx16 vtx17) 90)
	(= (motion_angle vtx17 vtx10) 90)
	
	(= (link_height vtx00 vtx01) 0.025)
	(= (link_height vtx01 vtx02) 0.025)
	(= (link_height vtx02 vtx03) 0.025)
	(= (link_height vtx03 vtx04) 0.025)
	(= (link_height vtx04 vtx05) 0.025)
	(= (link_height vtx05 vtx06) 0.025)
	(= (link_height vtx06 vtx07) 0.025)
	(= (link_height vtx07 vtx00) 0.025)
	
	(= (link_height vtx10 vtx11) 0.05)
	(= (link_height vtx11 vtx12) 0.05)
	(= (link_height vtx12 vtx13) 0.05)
	(= (link_height vtx13 vtx14) 0.05)
	(= (link_height vtx14 vtx15) 0.05)
	(= (link_height vtx15 vtx16) 0.05)
	(= (link_height vtx16 vtx17) 0.05)
	(= (link_height vtx17 vtx10) 0.05)
	
	(= (nozzle_height) 0.05)
	(= (nozzle_angle) 0)
	(= (layer_tickness) 0.025)
	(= (relocate_time) 0)
	(= (rest_time) 35)
	(= (change_layer) 0)	
)
(:goal (and
	(nozzle_at vtx10)
	(nozzle_is_close)
	(printed_link vtx00 vtx01)
	(printed_link vtx01 vtx02)
	(printed_link vtx02 vtx03)
	(printed_link vtx03 vtx04)
	(printed_link vtx04 vtx05)
	(printed_link vtx05 vtx06)
	(printed_link vtx06 vtx07)
	(printed_link vtx07 vtx00)
	
	(printed_link vtx10 vtx11)
	(printed_link vtx11 vtx12)
	(printed_link vtx12 vtx13)
	(printed_link vtx13 vtx14)
	(printed_link vtx14 vtx15)
	(printed_link vtx15 vtx16)
	(printed_link vtx16 vtx17)
	(printed_link vtx17 vtx10)
)))
    
