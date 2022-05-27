
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
DMC5400_API WORD WINAPI d5400_board_init(void);
DMC5400_API void WINAPI d5400_board_close(void);
DMC5400_API void WINAPI d5400_board_config(WORD card);

DMC5400_API void WINAPI d5400_set_form_hwnd(HWND hWnd) ;


DMC5400_API int WINAPI d5400_set_int_enable(WORD cardno);
DMC5400_API void WINAPI d5400_set_int_disable(void);
DMC5400_API void WINAPI d5400_set_board_isr(void ( * MyIsr)());
DMC5400_API void WINAPI d5400_set_int_factor(WORD axis, DWORD int_factor);

DMC5400_API DWORD WINAPI d5400_read_event_int_factor(WORD axis);
DMC5400_API DWORD WINAPI d5400_read_error_int_factor(WORD axis);

//DMC5400_API DWORD WINAPI get_interrupt_test(void);

//
DMC5400_API void WINAPI d5400_set_pulse_outmode(WORD axis,WORD outmode);
DMC5400_API void WINAPI d5400_set_pulse_inmode(WORD axis,WORD inmode,WORD count_dir);
DMC5400_API void WINAPI d5400_set_handwheel_inmode(WORD axis,WORD inmode,WORD count_dir);

//专用信号设置函数
DMC5400_API void WINAPI d5400_config_SD_PIN(WORD axis,WORD enable, WORD sd_logic,WORD sd_mode);
DMC5400_API void WINAPI d5400_config_PCS_PIN(WORD axis,WORD enable,WORD pcs_logic);
DMC5400_API void WINAPI d5400_config_INP_PIN(WORD axis,WORD enable,WORD inp_logic);
DMC5400_API void WINAPI d5400_config_ERC_PIN(WORD axis,WORD enable,WORD erc_logic,
											 WORD erc_width,WORD erc_off_time);

DMC5400_API void WINAPI d5400_config_ALM_PIN(WORD axis,WORD alm_logic,WORD alm_action);
DMC5400_API void WINAPI d5400_config_LTC_PIN(WORD axis,WORD enable,WORD ltc_logic) ;
DMC5400_API void WINAPI d5400_config_CUN_CLR(WORD axis,WORD trigger_mode,WORD enable);
DMC5400_API void WINAPI d5400_config_EL_MODE(WORD axis,WORD el_mode);
DMC5400_API void WINAPI d5400_set_HOME_pin_logic(WORD axis,WORD org_logic,WORD filter);
DMC5400_API void WINAPI d5400_set_ez_logic(WORD axis,WORD ez_logic);

//通用输入/输出控制函数
DMC5400_API int WINAPI d5400_read_inbit(WORD bitno)	;
DMC5400_API void WINAPI d5400_write_outbit (WORD bitno,WORD on_off);
DMC5400_API int WINAPI d5400_read_outbit(WORD bitno) ;
DMC5400_API long WINAPI d5400_read_inport(WORD card);
DMC5400_API long WINAPI d5400_read_outport(WORD card) ;

//制动函数
DMC5400_API void WINAPI d5400_decel_stop(WORD axis,double Tdec)	;
DMC5400_API void WINAPI d5400_imd_stop(WORD axis)	;
DMC5400_API void WINAPI d5400_emg_stop(void) ;
DMC5400_API void WINAPI d5400_simultaneous_stop(WORD axis) ;

//软件限位控制函数
DMC5400_API void WINAPI d5400_config_softlimit(WORD axis,WORD source_sel,WORD SL_action);
DMC5400_API void WINAPI d5400_enable_softlimit(WORD axis,WORD ON_OFF) ;
DMC5400_API void WINAPI d5400_set_softlimit_data(WORD axis,long N_limit,long P_limit)	;

//位置设置和读取函数
DMC5400_API long WINAPI d5400_get_position(WORD axis)	;
DMC5400_API void WINAPI d5400_set_position(WORD axis,long current_position);
DMC5400_API long WINAPI d5400_get_encoder(WORD axis);
DMC5400_API void WINAPI d5400_set_encoder(WORD axis,long encoder_value);
DMC5400_API long WINAPI d5400_get_postion_deviation(WORD axis) ;
DMC5400_API void WINAPI d5400_cls_postion_deviation(WORD axis) ;
DMC5400_API long WINAPI d5400_get_handwheel_pulse(WORD axis) ;


//状态检测函数
DMC5400_API WORD WINAPI d5400_axis_io_status(WORD axis);
DMC5400_API WORD WINAPI d5400_axis_status(WORD axis);
DMC5400_API DWORD WINAPI d5400_get_rsts(WORD axis) ;
DMC5400_API int WINAPI d5400_check_done(WORD axis) ;

DMC5400_API WORD WINAPI d5400_prebuff_status(WORD axis);
DMC5400_API DWORD WINAPI d5400_get_error_intfactor(WORD axis);
DMC5400_API void WINAPI d5400_set_latch_trigger_source(WORD axis,WORD sel) ;
DMC5400_API long WINAPI d5400_get_rcun_latch_value(WORD axis,WORD sel);

//单轴定长运动
DMC5400_API void WINAPI d5400_t_pmove(WORD axis,long Dist,WORD posi_mode);
DMC5400_API void WINAPI d5400_ex_t_pmove(WORD axis,long Dist,WORD posi_mode);

//速度设置
DMC5400_API void WINAPI d5400_variety_speed_range(WORD axis,WORD chg_enable ,double Max_Vel);
DMC5400_API double WINAPI d5400_read_current_speed(WORD axis);
DMC5400_API void WINAPI d5400_change_speed(WORD axis,double Curr_Vel);
DMC5400_API void WINAPI d5400_set_vector_profile(double Min_Vel,double Max_Vel,double Tacc,double Tdec);
DMC5400_API void WINAPI d5400_set_profile(WORD axis,double Min_Vel,double Max_Vel,double Tacc,double Tdec);
DMC5400_API void WINAPI d5400_set_s_profile(WORD axis,double Min_Vel,double Max_Vel
																						,double Tacc,double Tdec, long Sacc,long Sdec);

DMC5400_API void WINAPI d5400_reset_target_position(WORD axis,long dist);

//线性插补
DMC5400_API void WINAPI d5400_t_line2(WORD axis1,long Dist1,WORD axis2,long Dist2,WORD posi_mode);
DMC5400_API void WINAPI d5400_t_line3(WORD *axis,long Dist1,long Dist2,long Dist3,WORD posi_mode);
DMC5400_API void WINAPI d5400_t_line4(WORD cardno,long Dist1,long Dist2,long Dist3,long Dist4,WORD posi_mode);


DMC5400_API void WINAPI d5400_handwheel_move(WORD axis,double vh);
DMC5400_API void WINAPI d5400_set_handwheel_pulse(WORD axis,long hPulse);

//找原点
DMC5400_API void WINAPI d5400_config_home_mode(WORD axis,WORD mode,WORD EZ_count);
DMC5400_API void WINAPI d5400_home_move(WORD axis,WORD home_mode,WORD vel_mode);

//单轴连续运动
DMC5400_API void WINAPI d5400_s_vmove(WORD axis,WORD dir);
DMC5400_API void WINAPI d5400_t_vmove(WORD axis,WORD dir);


DMC5400_API void WINAPI d5400_arc_move(WORD *axis,long *target_pos,long *cen_pos, WORD arc_dir);
DMC5400_API void WINAPI d5400_pre_arc_move(WORD *axis,long *star_pos,long *target_pos,long *cen_pos, WORD arc_dir);

DMC5400_API void WINAPI d5400_s_pmove(WORD axis,long Dist,WORD posi_mode);
DMC5400_API void WINAPI d5400_ex_s_pmove(WORD axis,long Dist,WORD posi_mode);



//写指定寄存器的操作
DMC5400_API void WINAPI d5400_write_pcl_register(WORD card, WORD axis,WORD reg_name,DWORD value);
//读指定寄存器的操作
DMC5400_API DWORD WINAPI d5400_read_pcl_register(WORD card, WORD axis, WORD reg_name);













