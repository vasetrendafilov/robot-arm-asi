
#ifdef DMC5400_EXPORTS
#define DMC5400_API __declspec(dllexport)
#else
#define DMC5400_API __declspec(dllimport)
#endif

#define  RMV_R		0xd0	//目标位置读指令
#define  RMV_W		0x90	//目标位置写指令
#define  PRMV_R		0xc0	//预置目标位置读指令
#define  PRMV_W		0x80	//预置目标位置写指令

#define  RFL_R		0xd1	//起跳速度读指令
#define  RFL_W		0x91	//起跳速度写指令
#define  PRFL_R		0xc1	//预置起跳速度读指令
#define  PRFL_W		0x81	//预置起跳速度写指令

#define  RFH_R		0xd2	//运行速度读指令
#define  RFH_W		0x92	//运行速度写指令
#define  PRFH_R		0xc2	
#define  PRFH_W		0x82
#define  RUR_R		0xd3
#define  RUR_W		0x93
#define  PRUR_R		0xc3
#define  PRUR_W		0x83
#define  RDR_R		0xd4
#define  RDR_W		0x94
#define  PRDR_R		0xc4
#define  PRDR_W		0x84
#define  RMG_R		0xd5
#define  RMG_W		0x95
#define  PRMG_R		0xc5
#define  PRMG_W		0x85
#define  RDP_R		0xd6
#define  RDP_W		0x96
#define  PRDP_R		0xc6
#define  PRDP_W		0x86
#define  RMD_R		0xd7
#define  RMD_W		0x97
#define  PRMD_R		0xc7
#define  PRMD_W		0x87

#define  RIP_R		0xd8
#define  RIP_W		0x98
#define  PRIP_R		0xc8
#define  PRIP_W		0x88
#define  RUS_R		0xd9
#define  RUS_W		0x99
#define  PRUS_R		0xc9
#define  PRUS_W		0x89
#define  RDS_R		0xda
#define  RDS_W		0x9a
#define  PRDS_R		0xca
#define  PRDS_W		0x8a
#define  RFA_R		0xdb
#define  RFA_W		0x9b

#define  RENV1_R	0xdc
#define  RENV1_W	0x9c
#define  RENV2_R	0xdd
#define  RENV2_W	0x9d
#define  RENV3_R	0xde
#define  RENV3_W	0x9e
#define  RENV4_R	0xdf
#define  RENV4_W	0x9f
#define  RENV5_R	0xe0
#define  RENV5_W	0xa0
#define  RENV6_R	0xe1
#define  RENV6_W	0xa1
#define  RENV7_R	0xe2
#define  RENV7_W	0xa2

#define  RCUN1_R	0xe3
#define  RCUN1_W	0xa3
#define  RCUN2_R	0xe4
#define  RCUN2_W	0xa4
#define  RCUN3_R	0xe5
#define  RCUN3_W	0xa5
#define  RCUN4_R	0xe6
#define  RCUN4_W	0xa6

#define	 RCMP1_R	0xe7
#define	 RCMP1_W	0xa7
#define	 RCMP2_R	0xe8
#define	 RCMP2_W	0xa8
#define	 RCMP3_R	0xe9
#define	 RCMP3_W	0xa9
#define	 RCMP4_R	0xea
#define	 RCMP4_W	0xaa
#define	 RCMP5_R	0xeb
#define	 RCMP5_W	0xab
#define	 PRCMP5_R	0xcb
#define	 PRCMP5_W	0x8b

#define  RIRQ_R		0xec
#define  RIRQ_W		0xac

#define  RLTC1_R	0xed
#define  RLTC2_R	0xee
#define  RLTC3_R	0xef
#define  RLTC4_R	0xf0

#define  RSTS_R		0xf1
#define  REST_R		0xf2
#define  RIST_R		0xf3
#define  RPLS_R		0xf4
#define  RSPD_R		0xf5
#define  PSDC_R		0xf6

#define  RCI_R		0xfc
#define  RCI_W		0xbc
#define  PRCI_R		0xcc
#define  PRCI_W		0x8c

#define  RIPS_R		0xff



//初始化函数
WORD __stdcall d5400_board_init(void);
void __stdcall d5400_board_close(void);
void __stdcall d5400_board_config(WORD card);

void __stdcall d5400_set_form_hwnd(HWND hWnd) ;


int __stdcall d5400_set_int_enable(WORD cardno);
void __stdcall d5400_set_int_disable(void);
void __stdcall d5400_set_board_isr(void ( * MyIsr)());
void __stdcall d5400_set_int_factor(WORD axis, DWORD int_factor);

DWORD __stdcall d5400_read_event_int_factor(WORD axis);
DWORD __stdcall d5400_read_error_int_factor(WORD axis);


//
void __stdcall d5400_set_pulse_outmode(WORD axis,WORD outmode);
void __stdcall d5400_set_pulse_inmode(WORD axis,WORD inmode,WORD count_dir);
void __stdcall d5400_set_handwheel_inmode(WORD axis,WORD inmode,WORD count_dir);

//专用信号设置函数
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

//通用输入/输出控制函数
int __stdcall d5400_read_inbit(WORD bitno)	;
void __stdcall d5400_write_outbit (WORD bitno,WORD on_off);
int __stdcall d5400_read_outbit(WORD bitno) ;
long __stdcall d5400_read_inport(WORD card);
long __stdcall d5400_read_outport(WORD card) ;

//制动函数
void __stdcall d5400_decel_stop(WORD axis,double Tdec)	;
void __stdcall d5400_imd_stop(WORD axis)	;
void __stdcall d5400_emg_stop(void) ;
void __stdcall d5400_simultaneous_stop(WORD axis) ;

//软件限位控制函数
void __stdcall d5400_config_softlimit(WORD axis,WORD source_sel,WORD SL_action);
void __stdcall d5400_enable_softlimit(WORD axis,WORD ON_OFF) ;
void __stdcall d5400_set_softlimit_data(WORD axis,long N_limit,long P_limit)	;

//位置设置和读取函数
long __stdcall d5400_get_position(WORD axis)	;
void __stdcall d5400_set_position(WORD axis,long current_position);
long __stdcall d5400_get_encoder(WORD axis);
void __stdcall d5400_set_encoder(WORD axis,long encoder_value);
long __stdcall d5400_get_postion_deviation(WORD axis) ;
void __stdcall d5400_cls_postion_deviation(WORD axis) ;
long __stdcall d5400_get_handwheel_pulse(WORD axis) ;


//状态检测函数
WORD __stdcall d5400_axis_io_status(WORD axis);
WORD __stdcall d5400_axis_status(WORD axis);
DWORD __stdcall d5400_get_rsts(WORD axis) ;
int __stdcall d5400_check_done(WORD axis) ;

WORD __stdcall d5400_prebuff_status(WORD axis);
DWORD __stdcall d5400_get_error_intfactor(WORD axis);
void __stdcall d5400_set_latch_trigger_source(WORD axis,WORD sel) ;
long __stdcall d5400_get_rcun_latch_value(WORD axis,WORD sel);

//单轴定长运动
void __stdcall d5400_t_pmove(WORD axis,long Dist,WORD posi_mode);
void __stdcall d5400_ex_t_pmove(WORD axis,long Dist,WORD posi_mode);

//速度设置
void __stdcall d5400_variety_speed_range(WORD axis,WORD chg_enable ,double Max_Vel);
double __stdcall d5400_read_current_speed(WORD axis);
void __stdcall d5400_change_speed(WORD axis,double Curr_Vel);
void __stdcall d5400_set_vector_profile(double Min_Vel,double Max_Vel,double Tacc,double Tdec);
void __stdcall d5400_set_profile(WORD axis,double Min_Vel,double Max_Vel,double Tacc,double Tdec);
void __stdcall d5400_set_s_profile(WORD axis,double Min_Vel,double Max_Vel
								   ,double Tacc,double Tdec, long Sacc,long Sdec);

void __stdcall d5400_reset_target_position(WORD axis,long dist);

//线性插补
void __stdcall d5400_t_line2(WORD axis1,long Dist1,WORD axis2,long Dist2,WORD posi_mode);
void __stdcall d5400_t_line3(WORD *axis,long Dist1,long Dist2,long Dist3,WORD posi_mode);
void __stdcall d5400_t_line4(WORD cardno,long Dist1,long Dist2,long Dist3,long Dist4,WORD posi_mode);


void __stdcall d5400_handwheel_move(WORD axis,double vh);
void __stdcall d5400_set_handwheel_pulse(WORD axis,long hPulse);

//找原点
void __stdcall d5400_config_home_mode(WORD axis,WORD mode,WORD EZ_count);
void __stdcall d5400_home_move(WORD axis,WORD home_mode,WORD vel_mode);

//单轴连续运动
void __stdcall d5400_s_vmove(WORD axis,WORD dir);
void __stdcall d5400_t_vmove(WORD axis,WORD dir);


void __stdcall d5400_arc_move(WORD *axis,long *target_pos,long *cen_pos, WORD arc_dir);
void __stdcall d5400_pre_arc_move(WORD *axis,long *star_pos,long *target_pos,long *cen_pos, WORD arc_dir);
void __stdcall d5400_rel_arc_move(WORD *axis,long *rel_pos,long *rel_cen, WORD arc_dir);

void __stdcall d5400_s_pmove(WORD axis,long Dist,WORD posi_mode);
void __stdcall d5400_ex_s_pmove(WORD axis,long Dist,WORD posi_mode);



//写指定寄存器的操作
void __stdcall d5400_write_pcl_register(WORD card, WORD axis,WORD reg_name,DWORD value);
//读指定寄存器的操作
DWORD __stdcall d5400_read_pcl_register(WORD card, WORD axis, WORD reg_name);

/********************************************************************************
** 函数名称: d5400_helix_move 
** 功能描述: 三轴绝对坐标螺旋插补函数
**           指定X, Y两轴以当前位置为起点，按指定的圆心、目标位置和方向作圆弧插补运动，
Z轴同步运动指定高度.  其中：目标位置和圆心坐标及螺旋高度必须为绝对坐标值
同时,U轴被占用,坐标会改变, 如需要用到U轴,请先保存U轴当前坐标.
螺旋插补结束后, 调用d5400_stop_helix_move可释放U轴.
** 输　  入: cardno: 卡号. 同一块卡的XYZ轴才能执行螺旋插补.　
target_pos: XY轴目标位置列表
cen_pos: XY轴圆心位置列表
height: z轴螺旋高度
** 返 回 值: 无
** 修改内容:
** 修改日期: 
*********************************************************************************/
void __stdcall d5400_helix_move(WORD cardno, long *target_pos,long *cen_pos,long height, WORD arc_dir);

/********************************************************************************
** 函数名称: d5400_rel_helix_move 
** 功能描述: 三轴相对坐标螺旋插补函数
**           指定X, Y两轴以当前位置为起点，按指定的圆心、目标位置和方向作圆弧插补运动，
Z轴同步运动指定高度.  其中：目标位置和圆心坐标及螺旋高度必须为相对坐标值
同时,U轴被占用,坐标会改变, 如需要用到U轴,请先保存U轴当前坐标.
螺旋插补结束后, 调用d5400_stop_helix_move可释放U轴.
** 输　  入: cardno: 卡号. 同一块卡的XYZ轴才能执行螺旋插补.　
target_pos: XY轴目标位置列表
cen_pos: XY轴圆心位置列表
height: z轴螺旋高度
** 返 回 值: 无
** 修改内容:
** 修改日期: 
*********************************************************************************/
void __stdcall d5400_rel_helix_move(WORD cardno, long *rel_pos,long *rel_cen, long height, WORD arc_dir);

/********************************************************************************
** 函数名称: d5400_stop_helix_move 
** 功能描述: 螺旋插补停止函数
**           使用螺旋插补后, U轴被占用,坐标会改变, 如需要用到U轴,请先保存U轴当前坐标.
螺旋插补结束后, 调用本函数可释放U轴.
** 输　  入: cardno: 卡号. 　
** 返 回 值: 无
** 修改内容:
** 修改日期: 
*********************************************************************************/
void __stdcall d5400_stop_helix_move(WORD cardno);


//脉冲当量操作
int __stdcall d5400_set_scale(WORD axis, double new_scale);
int __stdcall d5400_get_scale(WORD axis, double *pscale);

////编码器的脉冲到指令脉冲的比例 
int __stdcall d5400_get_move_ratio(WORD axis, double *pEncoder_ratio);
int __stdcall d5400_set_move_ratio(WORD axis, double encoder_ratio);

//以物理长度(如毫米)为单位设置最大和最小误差
int __stdcall d5400_config_pulse_loop_scale(WORD axis, WORD max_num, double min_err, double max_err);

//脉冲闭环操作
int __stdcall d5400_pulse_compensate_scale(WORD axis);

int __stdcall d5400_config_pulse_loop(WORD axis, WORD max_num, long min_err, long max_err);













