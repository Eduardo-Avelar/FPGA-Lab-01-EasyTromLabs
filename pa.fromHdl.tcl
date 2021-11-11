
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Leitura_Encoder_e_Display_7_Segmentos -dir "C:/Users/eduar/OneDrive/Documents/Tutoriais_Blog/FPGA/Leitura_Encoder_e_Display_7_Segmentos/planAhead_run_1" -part xc3s500efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Top_Encoder_Module.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Segment_Decoder_Module.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Encoder_Rotativo_Teste.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Clock_Divider.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {BCD_converter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Segment_Driver.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Encoder_Counter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Top_Encoder_Module.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Top_Encoder_Module $srcset
add_files [list {Top_Encoder_Module.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-5
