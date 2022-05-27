Option Strict Off
Option Explicit On
Module dmc5400
	
	'初始化函数
	Declare Function d5400_board_init Lib "dmc5400.dll" () As Short
	Declare Sub d5400_board_close Lib "dmc5400.dll" ()
	Declare Function d5400_set_int_enable Lib "dmc5400.dll" (ByVal cardno As Short) As Short
	Declare Sub d5400_set_int_disable Lib "dmc5400.dll" ()
	
	Declare Sub d5400_set_form_hwnd Lib "dmc5400.dll" (ByVal hwnd As Integer)
	
	Declare Sub d5400_set_int_factor Lib "dmc5400.dll" (ByVal axis As Short, ByVal int_factor As Integer)
	Declare Function d5400_read_event_int_factor Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	Declare Function d5400_read_error_int_factor Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	
	
	Declare Sub d5400_set_pulse_outmode Lib "dmc5400.dll" (ByVal axis As Short, ByVal outmode As Short)
	Declare Sub d5400_set_pulse_inmode Lib "dmc5400.dll" (ByVal axis As Short, ByVal inmode As Short, ByVal count_dir As Short)
	Declare Sub d5400_set_handwheel_inmode Lib "dmc5400.dll" (ByVal axis As Short, ByVal inmode As Short, ByVal count_dir As Short)
	
	'专用信号设置函数
	Declare Sub d5400_config_SD_PIN Lib "dmc5400.dll" (ByVal axis As Short, ByVal enable As Short, ByVal sd_logic As Short, ByVal sd_mode As Short)
	Declare Sub d5400_config_PCS_PIN Lib "dmc5400.dll" (ByVal axis As Short, ByVal enable As Short, ByVal pcs_logic As Short)
	Declare Sub d5400_config_INP_PIN Lib "dmc5400.dll" (ByVal axis As Short, ByVal enable As Short, ByVal inp_logic As Short)
	Declare Sub d5400_config_ERC_PIN Lib "dmc5400.dll" (ByVal axis As Short, ByVal enable As Short, ByVal erc_logic As Short, ByVal erc_width As Short, ByVal erc_off_time As Short)
	
	Declare Sub d5400_config_ALM_PIN Lib "dmc5400.dll" (ByVal axis As Short, ByVal alm_logic As Short, ByVal alm_action As Short)
	Declare Sub d5400_config_LTC_PIN Lib "dmc5400.dll" (ByVal axis As Short, ByVal enable As Short, ByVal ltc_logic As Short)
	Declare Sub d5400_config_CUN_CLR Lib "dmc5400.dll" (ByVal axis As Short, ByVal trigger_mode As Short, ByVal enable As Short)
	Declare Sub d5400_config_EL_MODE Lib "dmc5400.dll" (ByVal axis As Short, ByVal el_mode As Short)
	'UPGRADE_NOTE: filter was upgraded to filter_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Declare Sub d5400_set_HOME_pin_logic Lib "dmc5400.dll" (ByVal axis As Short, ByVal org_logic As Short, ByVal filter_Renamed As Short)
	
	'通用输入/输出控制函数
	Declare Function d5400_read_inbit Lib "dmc5400.dll" (ByVal bitno As Short) As Short
	Declare Sub d5400_write_outbit Lib "dmc5400.dll" (ByVal bitno As Short, ByVal ON_OFF As Short)
	Declare Function d5400_read_outbit Lib "dmc5400.dll" (ByVal bitno As Short) As Short
	Declare Function d5400_read_inport Lib "dmc5400.dll" (ByVal card As Short) As Integer
	Declare Function d5400_read_outport Lib "dmc5400.dll" (ByVal card As Short) As Integer
	
	'制动函数
	Declare Sub d5400_decel_stop Lib "dmc5400.dll" (ByVal axis As Short, ByVal Tdec As Double)
	Declare Sub d5400_imd_stop Lib "dmc5400.dll" (ByVal axis As Short)
	Declare Sub d5400_emg_stop Lib "dmc5400.dll" ()
	Declare Sub d5400_simultaneous_stop Lib "dmc5400.dll" (ByVal axis As Short)
	
	'软件限位控制函数
	Declare Sub d5400_config_softlimit Lib "dmc5400.dll" (ByVal axis As Short, ByVal source_sel As Short, ByVal SL_action As Short)
	Declare Sub d5400_enable_softlimit Lib "dmc5400.dll" (ByVal axis As Short, ByVal ON_OFF As Short)
	Declare Sub d5400_set_softlimit_data Lib "dmc5400.dll" (ByVal axis As Short, ByVal N_limit As Integer, ByVal P_limit As Integer)
	
	'位置设置和读取函数
	Declare Function d5400_get_position Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	Declare Sub d5400_set_position Lib "dmc5400.dll" (ByVal axis As Short, ByVal current_position As Integer)
	Declare Function d5400_get_encoder Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	Declare Sub d5400_set_encoder Lib "dmc5400.dll" (ByVal axis As Short, ByVal encoder_value As Integer)
	Declare Function d5400_get_postion_deviation Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	Declare Sub d5400_cls_postion_deviation Lib "dmc5400.dll" (ByVal axis As Short)
	Declare Function d5400_get_handwheel_pulse Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	
	
	'状态检测函数
	Declare Function d5400_axis_io_status Lib "dmc5400.dll" (ByVal axis As Short) As Short
	Declare Function d5400_axis_status Lib "dmc5400.dll" (ByVal axis As Short) As Short
	Declare Function d5400_get_rsts Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	Declare Function d5400_check_done Lib "dmc5400.dll" (ByVal axis As Short) As Short
	
	Declare Function d5400_prebuff_status Lib "dmc5400.dll" (ByVal axis As Short) As Short
	Declare Function d5400_get_error_intfactor Lib "dmc5400.dll" (ByVal axis As Short) As Integer
	Declare Sub d5400_set_latch_trigger_source Lib "dmc5400.dll" (ByVal axis As Short, ByVal sel As Short)
	Declare Function d5400_get_rcun_latch_value Lib "dmc5400.dll" (ByVal axis As Short, ByVal sel As Short) As Integer
	
	'单轴定长运动
	Declare Sub d5400_t_pmove Lib "dmc5400.dll" (ByVal axis As Short, ByVal Dist As Integer, ByVal posi_mode As Short)
	Declare Sub d5400_ex_t_pmove Lib "dmc5400.dll" (ByVal axis As Short, ByVal Dist As Integer, ByVal posi_mode As Short)
	
	'速度设置
	Declare Sub d5400_variety_speed_range Lib "dmc5400.dll" (ByVal axis As Short, ByVal chg_enable As Short, ByVal Max_Vel As Double)
	Declare Function d5400_read_current_speed Lib "dmc5400.dll" (ByVal axis As Short) As Double
	Declare Sub d5400_change_speed Lib "dmc5400.dll" (ByVal axis As Short, ByVal Curr_Vel As Double)
	Declare Sub d5400_set_vector_profile Lib "dmc5400.dll" (ByVal Min_Vel As Double, ByVal Max_Vel As Double, ByVal Tacc As Double, ByVal Tdec As Double)
	Declare Sub d5400_set_profile Lib "dmc5400.dll" (ByVal axis As Short, ByVal Min_Vel As Double, ByVal Max_Vel As Double, ByVal Tacc As Double, ByVal Tdec As Double)
	Declare Sub d5400_set_s_profile Lib "dmc5400.dll" (ByVal axis As Short, ByVal Min_Vel As Double, ByVal Max_Vel As Double, ByVal Tacc As Double, ByVal Tdec As Double, ByVal Sacc As Integer, ByVal Sdec As Integer)
	
	Declare Sub d5400_reset_target_position Lib "dmc5400.dll" (ByVal axis As Short, ByVal Dist As Integer)
	
	'线性插补
	Declare Sub d5400_t_line2 Lib "dmc5400.dll" (ByVal axis1 As Short, ByVal Dist1 As Integer, ByVal axis2 As Short, ByVal Dist2 As Integer, ByVal posi_mode As Short)
	Declare Sub d5400_t_line3 Lib "dmc5400.dll" (ByRef axis As Short, ByVal Dist1 As Integer, ByVal Dist2 As Integer, ByVal Dist3 As Integer, ByVal posi_mode As Short)
	Declare Sub d5400_t_line4 Lib "dmc5400.dll" (ByVal cardno As Short, ByVal Dist1 As Integer, ByVal Dist2 As Integer, ByVal Dist3 As Integer, ByVal Dist4 As Integer, ByVal posi_mode As Short)
	
	
	Declare Sub d5400_handwheel_move Lib "dmc5400.dll" (ByVal axis As Short, ByVal vh As Double)
	Declare Sub d5400_set_handwheel_pulse Lib "dmc5400.dll" (ByVal axis As Short, ByVal hPulse As Integer)
	
	'找原点
	Declare Sub d5400_config_home_mode Lib "dmc5400.dll" (ByVal axis As Short, ByVal mode As Short, ByVal EZ_count As Short)
	Declare Sub d5400_home_move Lib "dmc5400.dll" (ByVal axis As Short, ByVal home_mode As Short, ByVal vel_mode As Short)
	
	'单轴连续运动
	'UPGRADE_NOTE: dir was upgraded to dir_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Declare Sub d5400_s_vmove Lib "dmc5400.dll" (ByVal axis As Short, ByVal dir_Renamed As Short)
	'UPGRADE_NOTE: dir was upgraded to dir_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Declare Sub d5400_t_vmove Lib "dmc5400.dll" (ByVal axis As Short, ByVal dir_Renamed As Short)
	
	
	Declare Sub d5400_arc_move Lib "dmc5400.dll" (ByRef axis As Short, ByRef target_pos As Integer, ByRef cen_pos As Integer, ByVal arc_dir As Short)
	Declare Sub d5400_pre_arc_move Lib "dmc5400.dll" (ByRef axis As Short, ByRef star_pos As Integer, ByRef target_pos As Integer, ByRef cen_pos As Integer, ByVal arc_dir As Short)
	
	Declare Sub d5400_s_pmove Lib "dmc5400.dll" (ByVal axis As Short, ByVal Dist As Integer, ByVal posi_mode As Short)
	Declare Sub d5400_ex_s_pmove Lib "dmc5400.dll" (ByVal axis As Short, ByVal Dist As Integer, ByVal posi_mode As Short)
End Module