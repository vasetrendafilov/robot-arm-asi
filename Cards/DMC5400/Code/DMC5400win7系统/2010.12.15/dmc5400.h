#ifndef _DMC5400_DLL_H
#define _DMC5400_DLL_H

#ifdef DMC5400_EXPORTS
    #define DMC5400_API __declspec(dllexport)
#else
    #define DMC5400_API __declspec(dllimport)
#endif

//��ʼ������
WORD __stdcall d5400_board_init(void);
void __stdcall d5400_board_close(void);

void __stdcall d5400_set_int_factor(WORD axis, DWORD int_factor);

DWORD __stdcall d5400_read_event_int_factor(WORD axis);
DWORD __stdcall d5400_read_error_int_factor(WORD axis);

void __stdcall d5400_set_pulse_outmode(WORD axis,WORD outmode);
void __stdcall d5400_set_pulse_inmode(WORD axis,WORD inmode,WORD count_dir);
void __stdcall d5400_set_handwheel_inmode(WORD axis,WORD inmode,WORD count_dir);

//ר���ź����ú���
void __stdcall d5400_config_SD_PIN(WORD axis,WORD enable, WORD sd_logic,WORD sd_mode);
void __stdcall d5400_config_PCS_PIN(WORD axis,WORD enable,WORD pcs_logic);
void __stdcall d5400_config_INP_PIN(WORD axis,WORD enable,WORD inp_logic);
void __stdcall d5400_config_ERC_PIN(WORD axis,WORD enable,WORD erc_logic,
											 WORD erc_width,WORD erc_off_time);

void __stdcall d5400_config_ALM_PIN(WORD axis,WORD alm_logic,WORD alm_action);
void __stdcall d5400_config_LTC_PIN(WORD axis,WORD enable,WORD ltc_logic) ;
void __stdcall d5400_config_CUN_CLR(WORD axis,WORD trigger_mode,WORD enable);
void __stdcall d5400_config_EL_MODE(WORD axis,WORD el_mode);
void __stdcall d5400_set_HOME_pin_logic(WORD axis,WORD org_logic,WORD filter);
void __stdcall d5400_set_ez_logic(WORD axis,WORD ez_logic);

//ͨ������/������ƺ���
int __stdcall d5400_read_inbit(WORD bitno)	;
void __stdcall d5400_write_outbit (WORD bitno,WORD on_off);
int __stdcall d5400_read_outbit(WORD bitno) ;
long __stdcall d5400_read_inport(WORD card);
long __stdcall d5400_read_outport(WORD card);

//�ƶ�����
void __stdcall d5400_decel_stop(WORD axis,double Tdec)	;
void __stdcall d5400_imd_stop(WORD axis);
void __stdcall d5400_emg_stop(void) ;
void __stdcall d5400_simultaneous_stop(WORD axis) ;

//�����λ���ƺ���
void __stdcall d5400_config_softlimit(WORD axis,WORD source_sel,WORD SL_action);
void __stdcall d5400_enable_softlimit(WORD axis,WORD ON_OFF) ;
void __stdcall d5400_set_softlimit_data(WORD axis,long N_limit,long P_limit);

//λ�����úͶ�ȡ����
long __stdcall d5400_get_position(WORD axis)	;
void __stdcall d5400_set_position(WORD axis,long current_position);
long __stdcall d5400_get_encoder(WORD axis);
void __stdcall d5400_set_encoder(WORD axis,long encoder_value);
long __stdcall d5400_get_postion_deviation(WORD axis);
void __stdcall d5400_cls_postion_deviation(WORD axis);
long __stdcall d5400_get_handwheel_pulse(WORD axis);


//״̬��⺯��
WORD __stdcall d5400_axis_io_status(WORD axis);
WORD __stdcall d5400_axis_status(WORD axis);
DWORD __stdcall d5400_get_rsts(WORD axis);
int __stdcall d5400_check_done(WORD axis);

WORD __stdcall d5400_prebuff_status(WORD axis);
DWORD __stdcall d5400_get_error_intfactor(WORD axis);
void __stdcall d5400_set_latch_trigger_source(WORD axis,WORD sel) ;
long __stdcall d5400_get_rcun_latch_value(WORD axis,WORD sel);

//���ᶨ���˶�
void __stdcall d5400_t_pmove(WORD axis,long Dist,WORD posi_mode);
void __stdcall d5400_ex_t_pmove(WORD axis,long Dist,WORD posi_mode);

void __stdcall d5400_s_pmove(WORD axis,long Dist,WORD posi_mode);
void __stdcall d5400_ex_s_pmove(WORD axis,long Dist,WORD posi_mode);

//�ٶ�����
void __stdcall d5400_variety_speed_range(WORD axis,WORD chg_enable ,double Max_Vel);
double __stdcall d5400_read_current_speed(WORD axis);
void __stdcall d5400_change_speed(WORD axis,double Curr_Vel);
void __stdcall d5400_set_vector_profile(double Min_Vel,double Max_Vel,double Tacc,double Tdec);
void __stdcall d5400_set_profile(WORD axis,double Min_Vel,double Max_Vel,double Tacc,double Tdec);
void __stdcall d5400_set_s_profile(WORD axis,double Min_Vel,double Max_Vel,
                                   double Tacc,double Tdec, long Sacc,long Sdec);

void __stdcall d5400_reset_target_position(WORD axis,long dist);

//���Բ岹
void __stdcall d5400_t_line2(WORD axis1,long Dist1,WORD axis2,long Dist2,WORD posi_mode);
void __stdcall d5400_t_line3(WORD *axis,long Dist1,long Dist2,long Dist3,WORD posi_mode);
void __stdcall d5400_t_line4(WORD cardno,long Dist1,long Dist2,long Dist3,long Dist4,WORD posi_mode);


void __stdcall d5400_handwheel_move(WORD axis,double vh);
void __stdcall d5400_set_handwheel_pulse(WORD axis,long hPulse);

int __stdcall d5400_enable_handwheel(WORD axis, WORD mag, double div, WORD hand_enable);


//��ԭ��
void __stdcall d5400_config_home_mode(WORD axis,WORD mode,WORD EZ_count);
void __stdcall d5400_home_move(WORD axis,WORD home_mode,WORD vel_mode);

//���������˶�
void __stdcall d5400_s_vmove(WORD axis,WORD dir);
void __stdcall d5400_t_vmove(WORD axis,WORD dir);


void __stdcall d5400_arc_move(WORD *axis,long *target_pos,long *cen_pos, WORD arc_dir);
void __stdcall d5400_rel_arc_move(WORD *axis,long *rel_pos,long *rel_cen, WORD arc_dir);

/********************************************************************************
** ��������: d5400_helix_move 
** ��������: ����������������岹����
**           ָ��X, Y�����Ե�ǰλ��Ϊ��㣬��ָ����Բ�ġ�Ŀ��λ�úͷ�����Բ���岹�˶���
             Z��ͬ���˶�ָ���߶�.  ���У�Ŀ��λ�ú�Բ�����꼰�����߶ȱ���Ϊ��������ֵ
             ͬʱ,U�ᱻռ��,�����ı�, ����Ҫ�õ�U��,���ȱ���U�ᵱǰ����.
             �����岹������, ����d5400_stop_helix_move���ͷ�U��.
** �䡡  ��: cardno: ����. ͬһ�鿨��XYZ�����ִ�������岹.��
             target_pos: XY��Ŀ��λ���б�
             cen_pos: XY��Բ��λ���б�
             height: z�������߶�
** �� �� ֵ: ��
** �޸�����:
** �޸�����: 
*********************************************************************************/
void __stdcall d5400_helix_move(WORD cardno, long *target_pos,long *cen_pos,long height, WORD arc_dir);

/********************************************************************************
** ��������: d5400_rel_helix_move 
** ��������: ����������������岹����
**           ָ��X, Y�����Ե�ǰλ��Ϊ��㣬��ָ����Բ�ġ�Ŀ��λ�úͷ�����Բ���岹�˶���
             Z��ͬ���˶�ָ���߶�.  ���У�Ŀ��λ�ú�Բ�����꼰�����߶ȱ���Ϊ�������ֵ
             ͬʱ,U�ᱻռ��,�����ı�, ����Ҫ�õ�U��,���ȱ���U�ᵱǰ����.
             �����岹������, ����d5400_stop_helix_move���ͷ�U��.
** �䡡  ��: cardno: ����. ͬһ�鿨��XYZ�����ִ�������岹.��
             target_pos: XY��Ŀ��λ���б�
             cen_pos: XY��Բ��λ���б�
             height: z�������߶�
** �� �� ֵ: ��
** �޸�����:
** �޸�����: 
*********************************************************************************/
void __stdcall d5400_rel_helix_move(WORD cardno, long *rel_pos,long *rel_cen, long height, WORD arc_dir);

/********************************************************************************
** ��������: d5400_stop_helix_move 
** ��������: �����岹ֹͣ����
**           ʹ�������岹��, U�ᱻռ��,�����ı�, ����Ҫ�õ�U��,���ȱ���U�ᵱǰ����.
             �����岹������, ���ñ��������ͷ�U��.
** �䡡  ��: cardno: ����. ��
** �� �� ֵ: ��
** �޸�����:
** �޸�����: 
*********************************************************************************/
void __stdcall d5400_stop_helix_move(WORD cardno);


//���嵱������
int __stdcall d5400_set_scale(WORD axis, double new_scale);
int __stdcall d5400_get_scale(WORD axis, double *pscale);

////�����������嵽ָ������ı��� 
int __stdcall d5400_get_move_ratio(WORD axis, double *pEncoder_ratio);
int __stdcall d5400_set_move_ratio(WORD axis, double encoder_ratio);

//��������(�����)Ϊ��λ����������С���
int __stdcall d5400_config_pulse_loop_scale(WORD axis, WORD max_num, double min_err, double max_err);

//����ջ�����
int __stdcall d5400_pulse_compensate_scale(WORD axis);

int __stdcall d5400_config_pulse_loop(WORD axis, WORD max_num, long min_err, long max_err);

#endif








