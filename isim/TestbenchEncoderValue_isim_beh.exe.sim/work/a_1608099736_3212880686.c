/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/eduar/OneDrive/Documents/Tutoriais_Blog/FPGA/Leitura_Encoder_e_Display_7_Segmentos/Encoder_Rotativo_Teste.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );
char *ieee_p_3620187407_sub_436351764_3965413181(char *, char *, char *, char *, int );


static void work_a_1608099736_3212880686_p_0(char *t0)
{
    char t14[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1792U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5408);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 1032U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t4 = (t0 + 5520);
    t10 = (t4 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5584);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t3 = *((unsigned char *)t5);
    t8 = ((IEEE_P_2592010699) + 4024);
    t2 = xsi_base_array_concat(t2, t14, t8, (char)99, t1, (char)99, t3, (char)101);
    t15 = (1U + 1U);
    t6 = (2U != t15);
    if (t6 == 1)
        goto LAB8;

LAB9:    t10 = (t0 + 5648);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t16 = *((char **)t13);
    memcpy(t16, t2, 2U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2312U);
    t4 = *((char **)t2);
    t2 = (t0 + 10400);
    t17 = xsi_mem_cmp(t2, t4, 2U);
    if (t17 == 1)
        goto LAB11;

LAB16:    t8 = (t0 + 10402);
    t18 = xsi_mem_cmp(t8, t4, 2U);
    if (t18 == 1)
        goto LAB12;

LAB17:    t11 = (t0 + 10404);
    t19 = xsi_mem_cmp(t11, t4, 2U);
    if (t19 == 1)
        goto LAB13;

LAB18:    t13 = (t0 + 10406);
    t20 = xsi_mem_cmp(t13, t4, 2U);
    if (t20 == 1)
        goto LAB14;

LAB19:
LAB15:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5712);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5776);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);

LAB10:    goto LAB3;

LAB5:    t4 = (t0 + 1832U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_size_not_matching(2U, t15, 0);
    goto LAB9;

LAB11:    xsi_set_current_line(52, ng0);
    t21 = (t0 + 5712);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)2;
    xsi_driver_first_trans_fast(t21);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5776);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB12:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5712);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 5776);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB13:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5712);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 5776);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB14:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 5712);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5776);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB20:;
}

static void work_a_1608099736_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    unsigned char t22;
    unsigned char t23;
    unsigned char t24;
    unsigned char t25;
    unsigned char t26;
    unsigned char t27;
    char *t28;
    unsigned char t29;
    unsigned char t30;
    unsigned char t31;
    char *t32;
    unsigned char t33;
    char *t34;
    unsigned char t35;
    unsigned char t36;
    unsigned char t37;
    char *t38;
    unsigned char t39;
    unsigned char t40;
    unsigned char t41;
    unsigned char t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;

LAB0:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1792U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5424);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(83, ng0);
    t4 = (t0 + 2472U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t4 = (t0 + 5840);
    t10 = (t4 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 5904);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2472U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 2792U);
    t5 = *((char **)t2);
    t3 = *((unsigned char *)t5);
    t6 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t1, t3);
    t2 = (t0 + 2632U);
    t8 = *((char **)t2);
    t7 = *((unsigned char *)t8);
    t2 = (t0 + 2952U);
    t10 = *((char **)t2);
    t9 = *((unsigned char *)t10);
    t14 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t7, t9);
    t15 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t6, t14);
    t2 = (t0 + 5968);
    t11 = (t2 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t16 = *((char **)t13);
    *((unsigned char *)t16) = t15;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t1);
    t2 = (t0 + 2472U);
    t5 = *((char **)t2);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t3, t6);
    t2 = (t0 + 2632U);
    t8 = *((char **)t2);
    t9 = *((unsigned char *)t8);
    t14 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t9);
    t15 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t7, t14);
    t2 = (t0 + 2792U);
    t10 = *((char **)t2);
    t17 = *((unsigned char *)t10);
    t2 = (t0 + 2472U);
    t11 = *((char **)t2);
    t18 = *((unsigned char *)t11);
    t19 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t18);
    t20 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t17, t19);
    t2 = (t0 + 2632U);
    t12 = *((char **)t2);
    t21 = *((unsigned char *)t12);
    t22 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t20, t21);
    t23 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t15, t22);
    t2 = (t0 + 2952U);
    t13 = *((char **)t2);
    t24 = *((unsigned char *)t13);
    t25 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t24);
    t2 = (t0 + 2632U);
    t16 = *((char **)t2);
    t26 = *((unsigned char *)t16);
    t27 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t25, t26);
    t2 = (t0 + 2472U);
    t28 = *((char **)t2);
    t29 = *((unsigned char *)t28);
    t30 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t27, t29);
    t31 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t23, t30);
    t2 = (t0 + 2952U);
    t32 = *((char **)t2);
    t33 = *((unsigned char *)t32);
    t2 = (t0 + 2632U);
    t34 = *((char **)t2);
    t35 = *((unsigned char *)t34);
    t36 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t35);
    t37 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t33, t36);
    t2 = (t0 + 2472U);
    t38 = *((char **)t2);
    t39 = *((unsigned char *)t38);
    t40 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t39);
    t41 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t37, t40);
    t42 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t31, t41);
    t2 = (t0 + 6032);
    t43 = (t2 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t42;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 1832U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_1608099736_3212880686_p_2(char *t0)
{
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1792U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(116, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t1 = (t0 + 6160);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 13U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 5440);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(103, ng0);
    t1 = xsi_get_transient_memory(13U);
    memset(t1, 0, 13U);
    t5 = t1;
    memset(t5, (unsigned char)2, 13U);
    t6 = (t0 + 6096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 13U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1832U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 3112U);
    t7 = *((char **)t2);
    t15 = *((unsigned char *)t7);
    t16 = (t15 == (unsigned char)3);
    if (t16 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 3272U);
    t8 = *((char **)t2);
    t17 = *((unsigned char *)t8);
    t18 = (t17 == (unsigned char)3);
    if (t18 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(111, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t1 = (t0 + 10348U);
    t5 = ieee_p_3620187407_sub_436351764_3965413181(IEEE_P_3620187407, t19, t2, t1, 1);
    t6 = (t19 + 12U);
    t21 = *((unsigned int *)t6);
    t22 = (1U * t21);
    t3 = (13U != t22);
    if (t3 == 1)
        goto LAB21;

LAB22:    t7 = (t0 + 6096);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t20 = *((char **)t10);
    memcpy(t20, t5, 13U);
    xsi_driver_first_trans_fast(t7);

LAB17:    goto LAB14;

LAB16:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3432U);
    t9 = *((char **)t2);
    t2 = (t0 + 10348U);
    t10 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t19, t9, t2, 1);
    t20 = (t19 + 12U);
    t21 = *((unsigned int *)t20);
    t22 = (1U * t21);
    t23 = (13U != t22);
    if (t23 == 1)
        goto LAB19;

LAB20:    t24 = (t0 + 6096);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t10, 13U);
    xsi_driver_first_trans_fast(t24);
    goto LAB17;

LAB19:    xsi_size_not_matching(13U, t22, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(13U, t22, 0);
    goto LAB22;

}


extern void work_a_1608099736_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1608099736_3212880686_p_0,(void *)work_a_1608099736_3212880686_p_1,(void *)work_a_1608099736_3212880686_p_2};
	xsi_register_didat("work_a_1608099736_3212880686", "isim/TestbenchEncoderValue_isim_beh.exe.sim/work/a_1608099736_3212880686.didat");
	xsi_register_executes(pe);
}
