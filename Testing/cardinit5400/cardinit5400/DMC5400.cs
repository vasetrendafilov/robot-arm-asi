using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;


namespace csDmc5400
{
    public class Dmc5400
    {
         //--------------------- Board initial and configuration functions--------------------- -
         /************************************************* *******************************
         ** Function name: d5400_board_init
         ** Function description: Control board initialization, setting initialization and speed settings
         ** Input: None
         ** Return value: 0: no card; 1-8: success (the actual number of cards)
         **
         ************************************************** *******************************/
        [DllImport("DMC5400.dll", EntryPoint = "d5400_board_init", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt16  d5400_board_init();

        /************************************************* *******************************
         ** Function name: d5400_board_close
         ** Function description: Close all cards
         ** Input: None
         ** Return value: None
         ** Date: 2007.02.1
         ************************************************** *******************************/
        [DllImport("DMC5400.dll", EntryPoint = "d5400_board_close", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_board_close(); 

        // Pulse input and output configuration

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_pulse_outmode", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_set_pulse_outmode(UInt16 axis,UInt16 outmode);

        // Dedicated signal setting function

        [DllImport("DMC5400.dll", EntryPoint = "d5400_config_SD_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_SD_PIN(UInt16 axis,UInt16 enable, UInt16 sd_logic,UInt16 sd_mode);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_config_PCS_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_PCS_PIN(UInt16 axis,UInt16 enable, UInt16 pcs_logic);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_config_INP_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_INP_PIN(UInt16 axis,UInt16 enable,UInt16 inp_logic);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_config_ERC_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_ERC_PIN(UInt16 axis,UInt16 enable,UInt16 erc_logic, UInt16 erc_width,UInt16 erc_off_time);
        
        [DllImport("DMC5400.dll", EntryPoint = "d5400_config_ALM_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_ALM_PIN(UInt16 axis, UInt16 enable, UInt16 alm_logic,UInt16 alm_action);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_config_CUN_CLR", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_CUN_CLR(UInt16 axis, UInt16 trigger_mode, UInt16 enable);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_config_EL_MODE", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_EL_MODE(UInt16 axis, UInt16 el_mode);

        //General input/output control functions

        [DllImport("DMC5400.dll", EntryPoint = "d5400_read_inbit", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern int d5400_read_inbit(UInt16 bitno);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_write_outbit", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_write_outbit(UInt16 bitno,UInt16 on_off);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_read_outbit", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern int d5400_read_outbit(UInt16 bitno) ;

        [DllImport("DMC5400.dll", EntryPoint = "d5400_read_inport", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern long  d5400_read_inport(UInt16 card);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_read_outport", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern long d5400_read_outport(UInt16 card) ;

        [DllImport("DMC5400.dll", EntryPoint = "d5400_write_outport", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32  d5400_write_outport(UInt16 cardno, UInt32 port_value);

	// The software limit is set to function

	[DllImport("DMC5400.dll", EntryPoint = "d5400_config_softlimit", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_softlimit(UInt16 axis, UInt16 source_sel, UInt16 SL_action);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_enable_softlimit", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_enable_softlimit(UInt16 axis, UInt16 ON_OFF);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_set_softlimit_data", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_softlimit_data(UInt16 axis, long N_limit, long P_limit);

	// Interrupt the function letter number

	[DllImport("DMC5400.dll", EntryPoint = "d5400_set_int_enable", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern int d5400_set_int_enable(UInt16 cardno);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_set_int_disable", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_int_disable();

	[DllImport("DMC5400.dll", EntryPoint = "d5400_set_int_factor", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_int_factor(UInt16 axis, UInt32 int_factor);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_read_event_int_factor", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32  d5400_read_event_int_factor(UInt16 axis);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_read_error_int_factor", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32  d5400_read_error_int_factor(UInt16 axis);
	
	
        //Braking function

        [DllImport("DMC5400.dll", EntryPoint = "d5400_decel_stop", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_decel_stop(UInt16 axis,double Tdec);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_imd_stop", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_imd_stop(UInt16 axis);
        
        [DllImport("DMC5400.dll", EntryPoint = "d5400_emg_stop", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_emg_stop() ;

        //Position setting and reading function

        [DllImport("DMC5400.dll", EntryPoint = "d5400_get_position", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern long d5400_get_position(UInt16 axis);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_position", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_position(UInt16 axis,long current_position);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_get_position_deviation", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern long d5400_get_position_deviation(UInt16 axis);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_cls_position_deviation", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_cls_position_deviation(UInt16 axis);


	[DllImport("DMC5400.dll", EntryPoint = "d5400_set_latch_trigger_source", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_latch_trigger_source(UInt16 axis, UInt16 sel);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_get_rcun_latch_value", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern long d5400_get_rcun_latch_value(UInt16 axis, UInt16 sel);

        //State detection function

        [DllImport("DMC5400.dll", EntryPoint = "d5400_check_done", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt16   d5400_check_done(UInt16 axis) ;

        [DllImport("DMC5400.dll", EntryPoint = "d5400_axis_io_status", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt16  d5400_axis_io_status(UInt16 axis);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_get_rsts", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32  d5400_get_rsts(UInt16 axis);


        //Speed setting

        [DllImport("DMC5400.dll", EntryPoint = "d5400_read_current_speed", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern double  d5400_read_current_speed(UInt16 axis);
        
        [DllImport("DMC5400.dll", EntryPoint = "d5400_change_speed", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_change_speed(UInt16 axis,double Curr_Vel);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_variety_speed_range", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_variety_speed_range(UInt16 axis, UInt16 chg_enable, double Max_Vel);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_vector_profile", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_vector_profile(double Min_Vel, double Max_Vel, double Tacc,double Tdec );

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_profile", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_profile(UInt16 axis,double Min_Vel,double Max_Vel,double Tacc,double Tdec);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_s_profile", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_s_profile(UInt16 axis,double Min_Vel,double Max_Vel,double Tacc,double Tdec, long Sacc, long Sdec);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_t_vmove", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_t_vmove(UInt16 axis, UInt16 dir);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_s_vmove", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_s_vmove(UInt16 axis, UInt16 dir);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_t_pmove", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_t_pmove(UInt16 axis, long Dist, UInt16 posi_mode);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_ex_t_pmove", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_ex_t_pmove(UInt16 axis, long Dist, UInt16 posi_mode);

	
	[DllImport("DMC5400.dll", EntryPoint = "d5400_s_pmove", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_s_pmove(UInt16 axis, long Dist, UInt16 posi_mode);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_ex_s_pmove", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_ex_s_pmove(UInt16 axis, long Dist, UInt16 posi_mode);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_reset_target_position", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_reset_target_position(UInt16 axis,long dist);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_t_line2", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_t_line2(UInt16 axis1, long Dist1, UInt16 axis2, long Dist2, UInt16 posi_mode);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_t_line3", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_t_line3(ref UInt16 axis, long Dist1, long Dist2, long Dist3, UInt16 posi_mode);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_t_line4", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_t_line4(UInt16 cardno, long Dist1, long Dist2, long Dist3, long Dist4, UInt16 posi_mode);
	
	
        //Handwheel movement

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_handwheel_inmode", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_handwheel_inmode(UInt16 axis,UInt16 inmode, UInt16 count_dir);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_handwheel_move", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_handwheel_move(UInt16 axis, double vh);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_get_handwheel_pulse", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern long d5400_get_handwheel_pulse(UInt16 axis);

        //Find the origin

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_HOME_pin_logic", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_HOME_pin_logic(UInt16 axis, UInt16 org_logic, UInt16 filter);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_config_home_mode", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_config_home_mode(UInt16 axis, UInt16 mode, UInt16 EZ_count);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_home_move", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void  d5400_home_move(UInt16 axis, UInt16 home_mode, UInt16 vel_mode);

        //Circular interpolation
        
        [DllImport("DMC5400.dll", EntryPoint = "d5400_arc_move", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_arc_move(ref UInt16 axis,ref long target_pos,ref long cen_pos, UInt16 arc_dir);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_rel_arc_move", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_rel_arc_move(ref UInt16 axis,ref long rel_pos,ref long rel_cen, UInt16 arc_dir);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_prebuff_status", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt16 d5400_prebuff_status(UInt16 axis);

        //---------------------   Encoder counting function  ----------------------//

        [DllImport("DMC5400.dll", EntryPoint = "d5400_get_encoder", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern long d5400_get_encoder(UInt16 axis);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_set_encoder", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_encoder(UInt16 axis,long encoder_value);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_config_EZ_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32  d5400_config_EZ_PIN(UInt16 axis,UInt16 ez_logic, UInt16 ez_mode);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_get_config_EZ_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32  d5400_get_config_EZ_PIN(UInt16 axis,ref UInt16 ez_logic, ref UInt16 ez_mode);

        [DllImport("DMC5400.dll", EntryPoint = "d5400_config_LTC_PIN", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_config_LTC_PIN(UInt16 axis,UInt16 enable, UInt16 ltc_logic);

	[DllImport("DMC5400.dll", EntryPoint = "d5400_set_pulse_inmode", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void d5400_set_pulse_inmode(UInt16 axis,UInt16 inmode, UInt16 count_dir);


        //PC library error code
        enum ERR_CODE_DMC
        {
            ERR_NOERR = 0,          //success      
            ERR_UNKNOWN = 1,
            ERR_PARAERR = 2,

            ERR_TIMEOUT = 3,
            ERR_CONTROLLERBUSY = 4,
            ERR_CONNECT_TOOMANY = 5,

            ERR_CONTILINE = 6,
            ERR_CANNOT_CONNECTETH = 8,
            ERR_HANDLEERR = 9,
            ERR_SENDERR = 10,
            ERR_FIRMWAREERR = 12, //Firmware file error
            ERR_FIRMWAR_MISMATCH = 14, //Firmware does not match

            ERR_FIRMWARE_INVALID_PARA = 20,  //Firmware parameter error
            ERR_FIRMWARE_PARA_ERR = 20,  //Firmware parameter error 2
            ERR_FIRMWARE_STATE_ERR = 22, //The current state of the firmware does not allow operation
            ERR_FIRMWARE_LIB_STATE_ERR = 22, //The current state of the firmware does not allow operation 2
            ERR_FIRMWARE_CARD_NOT_SUPPORT = 24,  //Features not supported by the firmware Features not supported by the controller
            ERR_FIRMWARE_LIB_NOTSUPPORT = 24,    //Features not supported by firmware 2
        };

    }
}

