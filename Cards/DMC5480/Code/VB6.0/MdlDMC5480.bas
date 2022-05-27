Attribute VB_Name = "MdlDMC5480"
Option Explicit
''''''''''''''''''''''''''''''''''  Leadshine technology  ''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''                                 DMC5480 V1.0 函数列表                           ''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


'''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''                 初始化函数                      '''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''
Declare Function d5480_board_init Lib "DMC5480.dll" () As Long
Declare Sub d5480_board_close Lib "DMC5480.dll" ()

Declare Function d5480_get_card_ID Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_get_lib_version Lib "DMC5480.dll" () As Long
Declare Function d5480_get_card_version Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_get_card_soft_version Lib "DMC5480.dll" (ByVal card As Integer, ByRef firm_id As Integer, ByRef sub_firm_id As Integer) As Long
Declare Function d5480_get_total_axes Lib "DMC5480.dll" (ByVal card As Integer) As Long


'脉冲输入输出配置
Declare Function d5480_set_pulse_outmode Lib "DMC5480.dll" (ByVal axis As Integer, ByVal outmode As Integer) As Long
Declare Function d5480_get_pulse_outmode Lib "DMC5480.dll" (ByVal axis As Integer, ByVal outmode As Integer) As Long

Declare Function d5480_counter_config Lib "DMC5480.dll" (ByVal axis As Integer, ByVal mode As Integer) As Long
Declare Function d5480_get_counter_config Lib "DMC5480.dll" (ByVal axis As Integer, ByRef mode As Integer) As Long


'专用信号设置函数
Declare Function d5480_config_INP_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal inp_logic As Integer) As Long
Declare Function d5480_config_ERC_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal erc_logic As Integer, ByVal erc_width As Integer, ByVal erc_off_time As Integer) As Long
Declare Function d5480_config_ALM_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal alm_logic As Integer, ByVal alm_action As Integer) As Long
Declare Function d5480_config_EL_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal el_logic As Integer, ByVal el_mode As Integer) As Long
Declare Function d5480_config_HOME_PIN_logic Lib "DMC5480.dll" (ByVal axis As Integer, ByVal org_logic As Integer, ByVal filter As Integer) As Long

Declare Function d5480_write_SEVON_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal on_off As Integer) As Long
Declare Function d5480_write_ERC_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal sel As Integer) As Long
Declare Function d5480_read_RDY_PIN Lib "DMC5480.dll" (ByVal axis As Integer) As Long
Declare Function d5480_config_EMG_PIN Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal enable As Integer, ByVal emg_logic As Integer) As Long

Declare Function d5480_get_config_INP_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByRef enable As Integer, ByRef inp_logic As Integer) As Long
Declare Function d5480_get_config_ERC_PIN Lib "DMC5480.dll" (ByVal axis As Integer, enable As Integer, erc_logic As Integer, erc_width As Integer, erc_off_time As Integer) As Long
Declare Function d5480_get_config_ALM_PIN Lib "DMC5480.dll" (ByVal axis As Integer, alm_logic As Integer, alm_action As Integer) As Long
Declare Function d5480_get_config_EL_PIN Lib "DMC5480.dll" (ByVal axis As Integer, el_logic As Integer, el_mode As Integer) As Long
Declare Function d5480_get_config_HOME_PIN_logic Lib "DMC5480.dll" (ByVal axis As Integer, org_logic As Integer, filter As Integer) As Long

Declare Function d5480_get_config_EMG_PIN Lib "DMC5480.dll" (ByVal cardno As Integer, ByRef enable As Integer, ByRef emg_logic As Integer) As Long


'通用输入/输出控制函数
Declare Function d5480_read_inbit Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal BitNo As Integer) As Long
Declare Function d5480_write_outbit Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal BitNo As Integer, ByVal on_off As Integer) As Long
Declare Function d5480_read_outbit Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal BitNo As Integer) As Long
Declare Function d5480_read_inport Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_read_outport Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_write_outport Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal Port_Value As Long) As Long


'找原点
Declare Function d5480_config_home_mode Lib "DMC5480.dll" (ByVal axis As Integer, ByVal dir As Integer, ByVal vel As Double, ByVal mode As Integer, ByVal EZ_count As Integer) As Long
Declare Function d5480_home_move Lib "DMC5480.dll" (ByVal axis As Integer) As Long

'制动函数
Declare Function d5480_decel_stop Lib "DMC5480.dll" (ByVal axis As Integer, ByVal dec As Double) As Long
Declare Function d5480_imd_stop Lib "DMC5480.dll" (ByVal axis As Integer) As Long
Declare Function d5480_emg_stop Lib "DMC5480.dll" () As Long
Declare Function d5480_simultaneous_stop Lib "DMC5480.dll" (ByVal axis As Integer) As Long

'位置设置和读取函数
Declare Function d5480_get_position Lib "DMC5480.dll" (ByVal axis As Integer) As Long
Declare Function d5480_set_position Lib "DMC5480.dll" (ByVal axis As Integer, ByVal current_position As Long) As Long

'状态检测函数
Declare Function d5480_check_done Lib "DMC5480.dll" (ByVal axis As Integer) As Long
Declare Function d5480_axis_io_status Lib "DMC5480.dll" (ByVal axis As Integer) As Long


'速度设置
Declare Function d5480_read_current_speed Lib "DMC5480.dll" (ByVal axis As Integer) As Double
Declare Function d5480_read_vector_speed Lib "DMC5480.dll" (ByVal card As Integer) As Double

Declare Function d5480_change_speed Lib "DMC5480.dll" (ByVal axis As Integer, ByVal Curr_Vel As Double) As Long
Declare Function d5480_set_vector_profile Lib "DMC5480.dll" (ByVal card As Integer, ByVal s_para As Double, ByVal Max_Vel As Double, ByVal acc As Double, ByVal dec As Double) As Long

Declare Function d5480_set_profile Lib "DMC5480.dll" (ByVal axis As Integer, ByVal rev_option As Double, ByVal Max_Vel As Double, ByVal acc As Double, ByVal dec As Double) As Long
Declare Function d5480_get_profile Lib "DMC5480.dll" (ByVal axis As Integer, ByRef rev_option As Double, ByRef Max_Vel As Double, acc As Double, dec As Double) As Long

Declare Function d5480_set_s_profile Lib "DMC5480.dll" (ByVal axis As Integer, ByVal s_para As Double) As Long
Declare Function d5480_get_s_profile Lib "DMC5480.dll" (ByVal axis As Integer, ByRef s_para As Double) As Long

Declare Function d5480_reset_target_position Lib "DMC5480.dll" (ByVal axis As Integer, ByVal Dist As Long) As Long

'单轴运动
Declare Function d5480_pmove Lib "DMC5480.dll" (ByVal axis As Integer, ByVal Dist As Long, ByVal posi_mode As Integer) As Long
Declare Function d5480_vmove Lib "DMC5480.dll" (ByVal axis As Integer, ByVal posi_mode As Integer, ByVal vel As Double) As Long


'线性插补
Declare Function d5480_line2 Lib "DMC5480.dll" (ByVal AXIS1 As Integer, ByVal Dist1 As Long, ByVal AXIS2 As Integer, ByVal Dist2 As Long, ByVal posi_mode As Integer) As Long
Declare Function d5480_line3 Lib "DMC5480.dll" (axis As Integer, ByVal Dist1 As Long, ByVal Dist2 As Long, ByVal Dist3 As Long, ByVal posi_mode As Integer) As Long
Declare Function d5480_line4 Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal Dist1 As Long, ByVal Dist2 As Long, ByVal Dist3 As Long, ByVal Dist4 As Long, ByVal posi_mode As Integer) As Long

'圆弧插补
Declare Function d5480_arc_move Lib "DMC5480.dll" (axis As Integer, target_pos As Long, cen_pos As Long, ByVal arc_dir As Integer) As Long
Declare Function d5480_rel_arc_move Lib "DMC5480.dll" (axis As Integer, target_pos As Long, cen_pos As Long, ByVal arc_dir As Integer) As Long


'手轮运动
Declare Function d5480_set_handwheel_inmode Lib "DMC5480.dll" (ByVal axis As Integer, ByVal inmode As Integer, ByVal multi As Double) As Long
Declare Function d5480_get_handwheel_inmode Lib "DMC5480.dll" (ByVal axis As Integer, ByRef inmode As Integer, multi As Double) As Long

Declare Function d5480_handwheel_move Lib "DMC5480.dll" (ByVal axis As Integer) As Long


'//---------------------   编码器计数功能PLD  ----------------------//
Declare Function d5480_get_encoder Lib "DMC5480.dll" (ByVal axis As Integer) As Long
Declare Function d5480_set_encoder Lib "DMC5480.dll" (ByVal axis As Integer, ByVal encoder_value As Long) As Long

Declare Function d5480_config_LTC_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal ltc_logic As Integer, ByVal ltc_mode As Integer) As Long

Declare Function d5480_get_latch_value Lib "DMC5480.dll" (ByVal axis As Integer) As Long

Declare Function d5480_get_latch_flag Lib "DMC5480.dll" (ByVal cardno As Integer) As Long
Declare Function d5480_reset_latch_flag Lib "DMC5480.dll" (ByVal cardno As Integer) As Long

Declare Function d5480_get_counter_flag Lib "DMC5480.dll" (ByVal cardno As Integer) As Long
Declare Function d5480_reset_counter_flag Lib "DMC5480.dll" (ByVal cardno As Integer) As Long

Declare Function d5480_reset_clear_flag Lib "DMC5480.dll" (ByVal cardno As Integer) As Long

'//---------------------   DMC5480新加功能 ----------------------//
Declare Function d5480_config_EZ_PIN Lib "DMC5480.dll" (ByVal axis As Integer, ByVal ez_logic As Integer, ByVal ez_mode As Integer) As Long
Declare Function d5480_config_latch_mode Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal all_enable As Integer) As Long
Declare Function d5480_triger_chunnel Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal num As Integer) As Long
Declare Function d5480_set_speaker_logic Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal logic As Integer) As Long
Declare Function d5480_get_speaker_logic Lib "DMC5480.dll" (ByVal cardno As Integer, ByVal logic As Integer) As Long


'增加位置比较输出功能
Declare Function d5480_compare_config Lib "DMC5480.dll" (ByVal card As Integer, ByVal enable As Integer, ByVal axis As Integer, ByVal cmp_source As Integer) As Long
Declare Function d5480_compare_get_config Lib "DMC5480.dll" (ByVal card As Integer, ByVal enable As Integer, ByVal axis As Integer, ByVal cmp_source As Integer) As Long

Declare Function d5480_compare_clear_points Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_compare_add_point Lib "DMC5480.dll" (ByVal card As Integer, ByVal pos As Long, ByVal dir As Integer, ByVal action As Integer, ByVal actpara As Long) As Long
Declare Function d5480_compare_get_current_point Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_compare_get_points_runned Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_compare_get_points_remained Lib "DMC5480.dll" (ByVal card As Integer) As Long
 

'' 连续插补函数
Declare Function d5480_conti_lines Lib "DMC5480.dll" (ByVal axisNum As Integer, piaxisList As Integer, pPosList As Long, ByVal posi_mode As Integer) As Long
Declare Function d5480_conti_arc Lib "DMC5480.dll" (axis As Integer, rel_pos As Long, rel_cen As Long, ByVal arc_dir As Integer, ByVal posi_mode As Integer) As Long

Declare Function d5480_conti_restrain_speed Lib "DMC5480.dll" (ByVal card As Integer, ByVal v As Double) As Long

Declare Function d5480_conti_change_speed_ratio Lib "DMC5480.dll" (ByVal card As Integer, ByVal percent As Double) As Long
Declare Function d5480_conti_get_current_speed_ratio Lib "DMC5480.dll" (ByVal card As Integer) As Long

Declare Function d5480_conti_set_mode Lib "DMC5480.dll" (ByVal card As Integer, ByVal conti_mode As Integer, ByVal conti_vl As Double, ByVal conti_para As Double, ByVal filter As Double) As Long
Declare Function d5480_conti_get_mode Lib "DMC5480.dll" (ByVal card As Integer, ByVal conti_mode As Integer, ByVal conti_vl As Double, ByVal conti_para As Double, ByVal filter As Double) As Long

Declare Function d5480_conti_open_list Lib "DMC5480.dll" (ByVal axisNum As Integer, piaxisList As Integer) As Long
Declare Function d5480_conti_close_list Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_conti_check_remain_space Lib "DMC5480.dll" (ByVal card As Integer) As Long

Declare Function d5480_conti_decel_stop_list Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_conti_sudden_stop_list Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_conti_pause_list Lib "DMC5480.dll" (ByVal card As Integer) As Long
Declare Function d5480_conti_start_list Lib "DMC5480.dll" (ByVal card As Integer) As Long

Declare Function d5480_conti_read_current_mark Lib "DMC5480.dll" (ByVal card As Integer) As Long

Declare Function d5480_conti_extern_lines Lib "DMC5480.dll" (ByVal axisNum As Integer, piaxisList As Integer, pPosList As Long, ByVal posi_mode As Integer, ByVal imark As Long) As Long

Declare Function d5480_conti_extern_arc Lib "DMC5480.dll" (axis As Integer, rel_pos As Long, rel_cen As Long, ByVal arc_dir As Integer, ByVal posi_mode As Integer, ByVal imark As Long) As Long


'软件限位控制函数
Declare Function d5480_config_softlimit Lib "DMC5480.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal source_sel As Integer, ByVal SL_action As Integer, ByVal cmp1_data As Long, ByVal cmp2_data As Long) As Long
Declare Function d5480_get_config_softlimit Lib "DMC5480.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal source_sel As Integer, ByVal SL_action As Integer, ByVal cmp1_data As Long, ByVal cmp2_data As Long) As Long


Declare Function d5480_conti_rel_helix_move_extern Lib "DMC5480.dll" (ByVal card As Integer, axis As Integer, rel_pos As Long, rel_cen As Long, ByVal height As Long, ByVal arc_dir As Integer, ByVal imark As Long) As Long
Declare Function d5480_conti_helix_move_extern Lib "DMC5480.dll" (ByVal card As Integer, axis As Integer, target_pos As Long, cen_pos As Long, ByVal height As Long, ByVal arc_dir As Integer, ByVal imark As Long) As Long


'//相对螺旋插补运动函数, 只在连续插补中调用
'DMC5480_API  DWORD  __stdcall d5480_conti_rel_helix_move_extern(WORD card, WORD* axisList,long *rel_pos,long *rel_cen, long height,
'WORD arc_dir, long imark);
'
'//绝对螺旋插补运动函数, 只在连续插补中调用
'DMC5480_API  DWORD  __stdcall d5480_conti_helix_move_extern(WORD card,WORD* axisList,long *target_pos,long *cen_pos,long height,
'WORD arc_dir, long imark);

Public m_nAxisST As Integer
Public g_UseCard As Integer        '卡号定义


''函数参数必须严格保持一致性
            
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''                                 DMC5480 V1.0 end of module                       '''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
