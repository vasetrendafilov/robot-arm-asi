Attribute VB_Name = "dmc5400"
Option Explicit

'��ʼ������
Declare Function d5400_board_init Lib "dmc5400.dll" () As Integer
Declare Sub d5400_board_close Lib "dmc5400.dll" ()


'�жϿ��ƺ���
Declare Function d5400_set_int_enable Lib "dmc5400.dll" (ByVal cardno As Integer) As Integer
Declare Sub d5400_set_int_disable Lib "dmc5400.dll" ()
Declare Sub d5400_set_int_factor Lib "dmc5400.dll" (ByVal axis As Integer, ByVal int_factor As Long)
Declare Sub d5400_set_board_isr Lib "dmc5400.dll" (ByVal MyIsr As Long)
Declare Function d5400_read_event_int_factor Lib "dmc5400.dll" (ByVal axis As Integer) As Long
Declare Function d5400_read_error_int_factor Lib "dmc5400.dll" (ByVal axis As Integer) As Long


'��������\������ú���
Declare Sub d5400_set_pulse_outmode Lib "dmc5400.dll" (ByVal axis As Integer, ByVal outmode As Integer)
Declare Sub d5400_set_pulse_inmode Lib "dmc5400.dll" (ByVal axis As Integer, ByVal inmode As Integer, ByVal count_dir As Integer)

'�˶��ٶ����ú���
Declare Sub d5400_set_profile Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Min_Vel As Double, ByVal Max_Vel As Double, ByVal Tacc As Double, ByVal Tdec As Double)
Declare Sub d5400_set_s_profile Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Min_Vel As Double, ByVal Max_Vel As Double, _
                ByVal Tacc As Double, ByVal Tdec As Double, ByVal Sacc As Long, ByVal Sdec As Long)
Declare Sub d5400_change_speed Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Curr_Vel As Double)
Declare Sub d5400_variety_speed_range Lib "dmc5400.dll" (ByVal axis As Integer, ByVal chg_enable As Integer, ByVal Max_Vel As Double)

Declare Function d5400_read_current_speed Lib "dmc5400.dll" (ByVal axis As Integer) As Double

Declare Sub d5400_set_vector_profile Lib "dmc5400.dll" (ByVal Min_Vel As Double, ByVal Max_Vel As Double, ByVal Tacc As Double, ByVal Tdec As Double)

'�ƶ�����
Declare Sub d5400_decel_stop Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Tdec As Double)
Declare Sub d5400_imd_stop Lib "dmc5400.dll" (ByVal axis As Integer)
Declare Sub d5400_emg_stop Lib "dmc5400.dll" ()
Declare Sub d5400_simultaneous_stop Lib "dmc5400.dll" (ByVal axis As Integer)


'���ᶨ���˶�����
Declare Sub d5400_t_vmove Lib "dmc5400.dll" (ByVal axis As Integer, ByVal dir As Integer)
Declare Sub d5400_ex_t_pmove Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Dist As Long, ByVal posi_mode As Integer)
Declare Sub d5400_s_pmove Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Dist As Long, ByVal posi_mode As Integer)
Declare Sub d5400_ex_s_pmove Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Dist As Long, ByVal posi_mode As Integer)

Declare Sub d5400_t_pmove Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Dist As Long, ByVal posi_mode As Integer)
Declare Sub d5400_s_vmove Lib "dmc5400.dll" (ByVal axis As Integer, ByVal dir As Integer)


'���Բ岹����
Declare Sub d5400_t_line2 Lib "dmc5400.dll" (ByVal axis1 As Integer, ByVal Dist1 As Long, ByVal axis2 As Integer, ByVal Dist2 As Long, ByVal posi_mode As Integer)
Declare Sub d5400_t_line3 Lib "dmc5400.dll" (axis As Integer, ByVal Dist1 As Long, ByVal Dist2 As Long, ByVal Dist3 As Long, ByVal posi_mode As Integer)
Declare Sub d5400_t_line4 Lib "dmc5400.dll" (ByVal cardno As Integer, ByVal Dist1 As Long, ByVal Dist2 As Long, ByVal Dist3 As Long, ByVal Dist4 As Long, ByVal posi_mode As Integer)

'Բ���岹����
Declare Sub d5400_arc_move Lib "dmc5400.dll" (axis As Integer, target_pos As Long, cen_pos As Long, ByVal arc_dir As Integer)
Declare Sub d5400_rel_arc_move Lib "dmc5400.dll" (axis As Integer, rel_pos As Long, rel_cen As Long, ByVal arc_dir As Integer)


'ԭ�㷵�غ���
Declare Sub d5400_config_home_mode Lib "dmc5400.dll" (ByVal axis As Integer, ByVal mode As Integer, ByVal EZ_count As Integer)
Declare Sub d5400_home_move Lib "dmc5400.dll" (ByVal axis As Integer, ByVal home_mode As Integer, ByVal vel_mode As Integer)

'�����˶����ƺ���
Declare Sub d5400_set_handwheel_inmode Lib "dmc5400.dll" (ByVal axis As Integer, ByVal inmode As Integer, ByVal count_dir As Integer)
Declare Sub d5400_handwheel_move Lib "dmc5400.dll" (ByVal axis As Integer, ByVal vh As Double)
Declare Function d5400_get_handwheel_pulse Lib "dmc5400.dll" (ByVal axis As Integer) As Long
Declare Sub d5400_set_handwheel_pulse Lib "dmc5400.dll" (ByVal axis As Integer, ByVal value As Long)


'�˶�״̬����
Declare Function d5400_check_done Lib "dmc5400.dll" (ByVal axis As Integer) As Integer
Declare Function d5400_get_rsts Lib "dmc5400.dll" (ByVal axis As Integer) As Long
Declare Function d5400_axis_io_status Lib "dmc5400.dll" (ByVal axis As Integer) As Integer
Declare Function d5400_axis_status Lib "dmc5400.dll" (ByVal axis As Integer) As Integer



'ר���ź����ú���
Declare Sub d5400_config_SD_PIN Lib "dmc5400.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal sd_logic As Integer, ByVal sd_mode As Integer)
Declare Sub d5400_config_PCS_PIN Lib "dmc5400.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal pcs_logic As Integer)
Declare Sub d5400_config_INP_PIN Lib "dmc5400.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal inp_logic As Integer)
Declare Sub d5400_config_ERC_PIN Lib "dmc5400.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal erc_logic As Integer, ByVal erc_width As Integer, ByVal erc_off_time As Integer)
Declare Sub d5400_config_ALM_PIN Lib "dmc5400.dll" (ByVal axis As Integer, ByVal alm_logic As Integer, ByVal alm_action As Integer)
Declare Sub d5400_config_LTC_PIN Lib "dmc5400.dll" (ByVal axis As Integer, ByVal enable As Integer, ByVal ltc_logic As Integer)
Declare Sub d5400_config_CUN_CLR Lib "dmc5400.dll" (ByVal axis As Integer, ByVal trigger_mode As Integer, ByVal enable As Integer)
Declare Sub d5400_config_EL_MODE Lib "dmc5400.dll" (ByVal axis As Integer, ByVal el_mode As Integer)
Declare Sub d5400_set_HOME_pin_logic Lib "dmc5400.dll" (ByVal axis As Integer, ByVal org_logic As Integer, ByVal filter As Integer)

'������λ�ú��ڲ����������ƺ���
Declare Function d5400_get_position Lib "dmc5400.dll" (ByVal axis As Integer) As Long
Declare Sub d5400_set_position Lib "dmc5400.dll" (ByVal axis As Integer, ByVal current_position As Long)
Declare Function d5400_get_encoder Lib "dmc5400.dll" (ByVal axis As Integer) As Long
Declare Sub d5400_set_encoder Lib "dmc5400.dll" (ByVal axis As Integer, ByVal encoder_value As Long)
Declare Sub d5400_reset_target_position Lib "dmc5400.dll" (ByVal axis As Integer, ByVal Dist As Long)
Declare Function d5400_get_postion_deviation Lib "dmc5400.dll" (ByVal axis As Integer) As Long
Declare Sub d5400_cls_postion_deviation Lib "dmc5400.dll" (ByVal axis As Integer)

'�����λ�趨����
Declare Sub d5400_config_softlimit Lib "dmc5400.dll" (ByVal axis As Integer, ByVal source_sel As Integer, ByVal SL_action As Integer)
Declare Sub d5400_enable_softlimit Lib "dmc5400.dll" (ByVal axis As Integer, ByVal ON_OFF As Integer)
Declare Sub d5400_set_softlimit_data Lib "dmc5400.dll" (ByVal axis As Integer, ByVal N_limit As Long, ByVal P_limit As Long)

'������״̬��ȡ��λ�����湦�ܺ���
Declare Function d5400_prebuff_status Lib "dmc5400.dll" (ByVal axis As Integer) As Integer
Declare Sub d5400_set_latch_trigger_source Lib "dmc5400.dll" (ByVal axis As Integer, ByVal sel As Integer)
Declare Function d5400_get_rcun_latch_value Lib "dmc5400.dll" (ByVal axis As Integer, ByVal sel As Integer) As Long

'ͨ��I/O�ӿں���
Declare Function d5400_read_inbit Lib "dmc5400.dll" (ByVal bitno As Integer) As Integer
Declare Sub d5400_write_outbit Lib "dmc5400.dll" (ByVal bitno As Integer, ByVal ON_OFF As Integer)
Declare Function d5400_read_outbit Lib "dmc5400.dll" (ByVal bitno As Integer) As Integer
Declare Function d5400_read_inport Lib "dmc5400.dll" (ByVal card As Integer) As Long
Declare Function d5400_read_outport Lib "dmc5400.dll" (ByVal card As Integer) As Long

'���嵱���ͱջ�����
Declare Function d5400_get_scale Lib "dmc5400.dll" (ByVal axis As Integer, ByRef pscale As Double) As Long
Declare Function d5400_set_scale Lib "dmc5400.dll" (ByVal axis As Integer, ByVal new_scale As Double) As Long

Declare Function d5400_get_move_ratio Lib "dmc5400.dll" (ByVal axis As Integer, ByRef pEncoder_ratio As Double) As Long
Declare Function d5400_set_move_ratio Lib "dmc5400.dll" (ByVal axis As Integer, ByVal encoder_ratio As Double) As Long

Declare Function d5400_pulse_compensate_scale Lib "dmc5400.dll" (ByVal axis As Integer) As Long

Declare Function d5400_config_pulse_loop_scale Lib "dmc5400.dll" (ByVal axis As Integer, ByVal max_num As Integer, ByVal min_err As Double, ByVal max_err As Double) As Long


'��������
Declare Sub d5400_rel_helix_move Lib "dmc5400.dll" (ByVal cardno As Integer, rel_pos As Long, rel_cen As Long, ByVal height As Long, ByVal arc_dir As Integer)


Public Sub int_isr()
    If d5400_read_event_int_factor(0) & 1 Then
    
        g_flag_int = g_flag_int + 1
    
    End If
End Sub

''�жϺ���
Sub init()
     d5400_set_board_isr AddressOf int_isr
End Sub
