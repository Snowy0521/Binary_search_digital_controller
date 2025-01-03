// Created by ihdl
module Controller ( Vppg, Find_Setting, CLK, rst_n, DC_Comp, PGA_Gain, 
        CLK_Filter, LED_IR, LED_RED, IR_ADC_Value, RED_ADC_Value, LED_Drive );
  input [7:0] Vppg;
  output [6:0] DC_Comp;
  output [3:0] PGA_Gain;
  output [7:0] IR_ADC_Value;
  output [7:0] RED_ADC_Value;
  output [3:0] LED_Drive;
  input Find_Setting, CLK, rst_n;
  output CLK_Filter, LED_IR, LED_RED;
  wire   start, N397, N398, N399, N400, N401, N402, N403, N404, N405, N406,
         C134_DATA2_0, C134_DATA2_1, C134_DATA2_2, C134_DATA2_3, C134_DATA2_4,
         C134_DATA2_5, C134_DATA2_6, n248, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, C1_Z_6, C1_Z_5, C1_Z_4, C1_Z_3,
         C1_Z_2, C1_Z_1, C1_Z_0, DP_OP_189J1_124_5499_n7,
         DP_OP_189J1_124_5499_n6, DP_OP_189J1_124_5499_n5,
         DP_OP_189J1_124_5499_n4, DP_OP_189J1_124_5499_n3,
         DP_OP_189J1_124_5499_n2, intadd_0_CI, intadd_0_SUM_8_,
         intadd_0_SUM_7_, intadd_0_SUM_6_, intadd_0_SUM_5_, intadd_0_SUM_4_,
         intadd_0_SUM_3_, intadd_0_SUM_2_, intadd_0_SUM_1_, intadd_0_SUM_0_,
         intadd_0_n9, intadd_0_n8, intadd_0_n7, intadd_0_n6, intadd_0_n5,
         intadd_0_n4, intadd_0_n3, intadd_0_n2, intadd_0_n1, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754;
  wire   [2:0] currentState;
  wire   [2:0] nextState;
  wire   [9:0] counter;
  wire   [1:0] red_on_flag;
  wire   [6:0] DC_left;
  wire   [7:1] DC_Comp_temp;
  wire   [6:0] DC_right;
  wire   [9:0] min_index;
  wire   [9:0] max_index;
  wire   [3:0] gaintemp_max;
  wire   [3:0] PGA_Gain_RED;
  wire   [3:0] PGA_Gain_IR;
  wire   [6:0] DC_Comp_IR;
  wire   [6:0] DC_Comp_RED;
  wire   [7:0] temp_min;
  wire   [7:0] temp_max;

  DFQM2SA counter_reg_2_ ( .D(N399), .CK(CLK), .Q(counter[2]) );
  DFQM2SA counter_reg_6_ ( .D(N403), .CK(CLK), .Q(counter[6]) );
  DFQM2SA counter_reg_4_ ( .D(N401), .CK(CLK), .Q(counter[4]) );
  DFQM2SA counter_reg_8_ ( .D(N405), .CK(CLK), .Q(counter[8]) );
  DFRM1SA currentState_reg_2_ ( .D(nextState[2]), .CK(CLK), .RB(rst_n), .Q(
        currentState[2]), .QB(n752) );
  DFRM1SA currentState_reg_1_ ( .D(nextState[1]), .CK(CLK), .RB(rst_n), .Q(
        currentState[1]), .QB(n750) );
  DFSM1SA currentState_reg_0_ ( .D(nextState[0]), .CK(CLK), .SB(rst_n), .Q(
        currentState[0]), .QB(n751) );
  DFM2SA LED_RED_reg ( .D(n369), .CK(CLK), .Q(LED_RED), .QB(n753) );
  DFQM1SA min_index_reg_5_ ( .D(n325), .CK(CLK), .Q(min_index[5]) );
  DFQM1SA temp_min_reg_3_ ( .D(n309), .CK(CLK), .Q(temp_min[3]) );
  DFQM1SA IR_ADC_Value_reg_7_ ( .D(n365), .CK(CLK), .Q(IR_ADC_Value[7]) );
  DFQM1SA DC_Comp_RED_reg_0_ ( .D(n749), .CK(CLK), .Q(DC_Comp_RED[0]) );
  DFQM1SA DC_Comp_RED_reg_3_ ( .D(n745), .CK(CLK), .Q(DC_Comp_RED[3]) );
  DFQM1SA DC_Comp_RED_reg_6_ ( .D(n748), .CK(CLK), .Q(DC_Comp_RED[6]) );
  DFQM1SA gaintemp_max_reg_2_ ( .D(n272), .CK(CLK), .Q(gaintemp_max[2]) );
  DFQM1SA LED_IR_reg ( .D(n304), .CK(CLK), .Q(LED_IR) );
  DFQM1SA nextState_reg_1_ ( .D(n344), .CK(CLK), .Q(nextState[1]) );
  DFQM1SA start_reg ( .D(n275), .CK(CLK), .Q(start) );
  DFQM1SA counter_reg_0_ ( .D(N397), .CK(CLK), .Q(counter[0]) );
  DFQM1SA counter_reg_1_ ( .D(N398), .CK(CLK), .Q(counter[1]) );
  DFQM1SA counter_reg_3_ ( .D(N400), .CK(CLK), .Q(counter[3]) );
  DFQM1SA counter_reg_5_ ( .D(N402), .CK(CLK), .Q(counter[5]) );
  DFQM1SA counter_reg_7_ ( .D(N404), .CK(CLK), .Q(counter[7]) );
  DFQM1SA nextState_reg_0_ ( .D(n345), .CK(CLK), .Q(nextState[0]) );
  DFQM1SA red_on_flag_reg_1_ ( .D(n341), .CK(CLK), .Q(red_on_flag[1]) );
  DFQM1SA nextState_reg_2_ ( .D(n368), .CK(CLK), .Q(nextState[2]) );
  DFQM1SA CLK_Filter_reg ( .D(n343), .CK(CLK), .Q(CLK_Filter) );
  DFQM1SA red_on_flag_reg_0_ ( .D(n342), .CK(CLK), .Q(red_on_flag[0]) );
  DFQM1SA max_index_reg_0_ ( .D(n340), .CK(CLK), .Q(max_index[0]) );
  DFQM1SA max_index_reg_1_ ( .D(n339), .CK(CLK), .Q(max_index[1]) );
  DFQM1SA max_index_reg_2_ ( .D(n338), .CK(CLK), .Q(max_index[2]) );
  DFQM1SA max_index_reg_3_ ( .D(n337), .CK(CLK), .Q(max_index[3]) );
  DFQM1SA max_index_reg_4_ ( .D(n336), .CK(CLK), .Q(max_index[4]) );
  DFQM1SA max_index_reg_5_ ( .D(n335), .CK(CLK), .Q(max_index[5]) );
  DFQM1SA max_index_reg_6_ ( .D(n334), .CK(CLK), .Q(max_index[6]) );
  DFQM1SA max_index_reg_7_ ( .D(n333), .CK(CLK), .Q(max_index[7]) );
  DFQM1SA max_index_reg_8_ ( .D(n332), .CK(CLK), .Q(max_index[8]) );
  DFQM1SA min_index_reg_0_ ( .D(n330), .CK(CLK), .Q(min_index[0]) );
  DFQM1SA min_index_reg_1_ ( .D(n329), .CK(CLK), .Q(min_index[1]) );
  DFQM1SA min_index_reg_2_ ( .D(n328), .CK(CLK), .Q(min_index[2]) );
  DFQM1SA min_index_reg_3_ ( .D(n327), .CK(CLK), .Q(min_index[3]) );
  DFQM1SA min_index_reg_4_ ( .D(n326), .CK(CLK), .Q(min_index[4]) );
  DFQM1SA min_index_reg_6_ ( .D(n324), .CK(CLK), .Q(min_index[6]) );
  DFQM1SA min_index_reg_7_ ( .D(n323), .CK(CLK), .Q(min_index[7]) );
  DFQM1SA min_index_reg_8_ ( .D(n322), .CK(CLK), .Q(min_index[8]) );
  DFQM1SA temp_max_reg_0_ ( .D(n320), .CK(CLK), .Q(temp_max[0]) );
  DFQM1SA temp_max_reg_1_ ( .D(n319), .CK(CLK), .Q(temp_max[1]) );
  DFQM1SA temp_max_reg_2_ ( .D(n318), .CK(CLK), .Q(temp_max[2]) );
  DFQM1SA temp_max_reg_3_ ( .D(n317), .CK(CLK), .Q(temp_max[3]) );
  DFQM1SA temp_max_reg_4_ ( .D(n316), .CK(CLK), .Q(temp_max[4]) );
  DFQM1SA temp_max_reg_5_ ( .D(n315), .CK(CLK), .Q(temp_max[5]) );
  DFQM1SA temp_max_reg_6_ ( .D(n314), .CK(CLK), .Q(temp_max[6]) );
  DFQM1SA temp_max_reg_7_ ( .D(n313), .CK(CLK), .Q(temp_max[7]) );
  DFQM1SA temp_min_reg_0_ ( .D(n312), .CK(CLK), .Q(temp_min[0]) );
  DFQM1SA temp_min_reg_1_ ( .D(n311), .CK(CLK), .Q(temp_min[1]) );
  DFQM1SA temp_min_reg_2_ ( .D(n310), .CK(CLK), .Q(temp_min[2]) );
  DFQM1SA temp_min_reg_4_ ( .D(n308), .CK(CLK), .Q(temp_min[4]) );
  DFQM1SA temp_min_reg_5_ ( .D(n307), .CK(CLK), .Q(temp_min[5]) );
  DFQM1SA temp_min_reg_6_ ( .D(n306), .CK(CLK), .Q(temp_min[6]) );
  DFQM1SA temp_min_reg_7_ ( .D(n305), .CK(CLK), .Q(temp_min[7]) );
  DFQM1SA DC_Comp_temp_reg_1_ ( .D(n282), .CK(CLK), .Q(DC_Comp_temp[1]) );
  DFQM1SA DC_Comp_temp_reg_2_ ( .D(n281), .CK(CLK), .Q(DC_Comp_temp[2]) );
  DFQM1SA DC_Comp_temp_reg_3_ ( .D(n280), .CK(CLK), .Q(DC_Comp_temp[3]) );
  DFQM1SA DC_Comp_temp_reg_4_ ( .D(n279), .CK(CLK), .Q(DC_Comp_temp[4]) );
  DFQM1SA DC_Comp_temp_reg_5_ ( .D(n278), .CK(CLK), .Q(DC_Comp_temp[5]) );
  DFQM1SA DC_Comp_temp_reg_6_ ( .D(n277), .CK(CLK), .Q(DC_Comp_temp[6]) );
  DFQM1SA DC_Comp_temp_reg_7_ ( .D(n276), .CK(CLK), .Q(DC_Comp_temp[7]) );
  DFQM1SA max_index_reg_9_ ( .D(n331), .CK(CLK), .Q(max_index[9]) );
  DFQM1SA min_index_reg_9_ ( .D(n321), .CK(CLK), .Q(min_index[9]) );
  DFQM1SA IR_ADC_Value_reg_0_ ( .D(n366), .CK(CLK), .Q(IR_ADC_Value[0]) );
  DFQM1SA IR_ADC_Value_reg_6_ ( .D(n364), .CK(CLK), .Q(IR_ADC_Value[6]) );
  DFQM1SA IR_ADC_Value_reg_5_ ( .D(n363), .CK(CLK), .Q(IR_ADC_Value[5]) );
  DFQM1SA IR_ADC_Value_reg_4_ ( .D(n362), .CK(CLK), .Q(IR_ADC_Value[4]) );
  DFQM1SA IR_ADC_Value_reg_3_ ( .D(n361), .CK(CLK), .Q(IR_ADC_Value[3]) );
  DFQM1SA IR_ADC_Value_reg_2_ ( .D(n360), .CK(CLK), .Q(IR_ADC_Value[2]) );
  DFQM1SA IR_ADC_Value_reg_1_ ( .D(n359), .CK(CLK), .Q(IR_ADC_Value[1]) );
  DFQM1SA RED_ADC_Value_reg_0_ ( .D(n358), .CK(CLK), .Q(RED_ADC_Value[0]) );
  DFQM1SA RED_ADC_Value_reg_7_ ( .D(n357), .CK(CLK), .Q(RED_ADC_Value[7]) );
  DFQM1SA RED_ADC_Value_reg_6_ ( .D(n356), .CK(CLK), .Q(RED_ADC_Value[6]) );
  DFQM1SA RED_ADC_Value_reg_5_ ( .D(n355), .CK(CLK), .Q(RED_ADC_Value[5]) );
  DFQM1SA RED_ADC_Value_reg_4_ ( .D(n354), .CK(CLK), .Q(RED_ADC_Value[4]) );
  DFQM1SA RED_ADC_Value_reg_3_ ( .D(n353), .CK(CLK), .Q(RED_ADC_Value[3]) );
  DFQM1SA RED_ADC_Value_reg_2_ ( .D(n352), .CK(CLK), .Q(RED_ADC_Value[2]) );
  DFQM1SA RED_ADC_Value_reg_1_ ( .D(n351), .CK(CLK), .Q(RED_ADC_Value[1]) );
  DFQM1SA DC_Comp_reg_0_ ( .D(n303), .CK(CLK), .Q(DC_Comp[0]) );
  DFQM1SA DC_right_reg_0_ ( .D(n296), .CK(CLK), .Q(DC_right[0]) );
  DFQM1SA DC_left_reg_0_ ( .D(n289), .CK(CLK), .Q(DC_left[0]) );
  DFQM1SA DC_Comp_IR_reg_0_ ( .D(n263), .CK(CLK), .Q(DC_Comp_IR[0]) );
  DFQM1SA DC_Comp_RED_reg_1_ ( .D(n747), .CK(CLK), .Q(DC_Comp_RED[1]) );
  DFQM1SA DC_Comp_reg_1_ ( .D(n302), .CK(CLK), .Q(DC_Comp[1]) );
  DFQM1SA DC_right_reg_1_ ( .D(n295), .CK(CLK), .Q(DC_right[1]) );
  DFQM1SA DC_left_reg_1_ ( .D(n288), .CK(CLK), .Q(DC_left[1]) );
  DFQM1SA DC_Comp_IR_reg_1_ ( .D(n262), .CK(CLK), .Q(DC_Comp_IR[1]) );
  DFQM1SA DC_Comp_RED_reg_2_ ( .D(n746), .CK(CLK), .Q(DC_Comp_RED[2]) );
  DFQM1SA DC_Comp_reg_2_ ( .D(n301), .CK(CLK), .Q(DC_Comp[2]) );
  DFQM1SA DC_right_reg_2_ ( .D(n294), .CK(CLK), .Q(DC_right[2]) );
  DFQM1SA DC_left_reg_2_ ( .D(n287), .CK(CLK), .Q(DC_left[2]) );
  DFQM1SA DC_Comp_IR_reg_2_ ( .D(n261), .CK(CLK), .Q(DC_Comp_IR[2]) );
  DFQM1SA DC_Comp_reg_3_ ( .D(n300), .CK(CLK), .Q(DC_Comp[3]) );
  DFQM1SA DC_right_reg_3_ ( .D(n293), .CK(CLK), .Q(DC_right[3]) );
  DFQM1SA DC_left_reg_3_ ( .D(n286), .CK(CLK), .Q(DC_left[3]) );
  DFQM1SA DC_Comp_IR_reg_3_ ( .D(n260), .CK(CLK), .Q(DC_Comp_IR[3]) );
  DFQM1SA DC_Comp_RED_reg_4_ ( .D(n744), .CK(CLK), .Q(DC_Comp_RED[4]) );
  DFQM1SA DC_Comp_reg_4_ ( .D(n299), .CK(CLK), .Q(DC_Comp[4]) );
  DFQM1SA DC_right_reg_4_ ( .D(n292), .CK(CLK), .Q(DC_right[4]) );
  DFQM1SA DC_left_reg_4_ ( .D(n285), .CK(CLK), .Q(DC_left[4]) );
  DFQM1SA DC_Comp_IR_reg_4_ ( .D(n259), .CK(CLK), .Q(DC_Comp_IR[4]) );
  DFQM1SA DC_Comp_RED_reg_5_ ( .D(n743), .CK(CLK), .Q(DC_Comp_RED[5]) );
  DFQM1SA DC_Comp_reg_5_ ( .D(n298), .CK(CLK), .Q(DC_Comp[5]) );
  DFQM1SA DC_right_reg_5_ ( .D(n291), .CK(CLK), .Q(DC_right[5]) );
  DFQM1SA DC_left_reg_5_ ( .D(n284), .CK(CLK), .Q(DC_left[5]) );
  DFQM1SA DC_Comp_IR_reg_5_ ( .D(n258), .CK(CLK), .Q(DC_Comp_IR[5]) );
  DFQM1SA DC_Comp_reg_6_ ( .D(n297), .CK(CLK), .Q(DC_Comp[6]) );
  DFQM1SA DC_right_reg_6_ ( .D(n290), .CK(CLK), .Q(DC_right[6]) );
  DFQM1SA DC_left_reg_6_ ( .D(n283), .CK(CLK), .Q(DC_left[6]) );
  DFQM1SA DC_Comp_IR_reg_6_ ( .D(n257), .CK(CLK), .Q(DC_Comp_IR[6]) );
  DFQM1SA PGA_Gain_RED_reg_0_ ( .D(n252), .CK(CLK), .Q(PGA_Gain_RED[0]) );
  DFQM1SA PGA_Gain_reg_0_ ( .D(n348), .CK(CLK), .Q(PGA_Gain[0]) );
  DFQM1SA gaintemp_max_reg_0_ ( .D(n274), .CK(CLK), .Q(gaintemp_max[0]) );
  DFQM1SA PGA_Gain_IR_reg_0_ ( .D(n256), .CK(CLK), .Q(PGA_Gain_IR[0]) );
  DFQM1SA PGA_Gain_RED_reg_1_ ( .D(n251), .CK(CLK), .Q(PGA_Gain_RED[1]) );
  DFQM1SA PGA_Gain_reg_1_ ( .D(n346), .CK(CLK), .Q(PGA_Gain[1]) );
  DFQM1SA gaintemp_max_reg_1_ ( .D(n273), .CK(CLK), .Q(gaintemp_max[1]) );
  DFQM1SA PGA_Gain_IR_reg_1_ ( .D(n255), .CK(CLK), .Q(PGA_Gain_IR[1]) );
  DFQM1SA PGA_Gain_RED_reg_2_ ( .D(n250), .CK(CLK), .Q(PGA_Gain_RED[2]) );
  DFQM1SA PGA_Gain_reg_2_ ( .D(n347), .CK(CLK), .Q(PGA_Gain[2]) );
  DFQM1SA PGA_Gain_IR_reg_2_ ( .D(n254), .CK(CLK), .Q(PGA_Gain_IR[2]) );
  DFQM1SA PGA_Gain_RED_reg_3_ ( .D(n248), .CK(CLK), .Q(PGA_Gain_RED[3]) );
  DFQM1SA PGA_Gain_reg_3_ ( .D(n367), .CK(CLK), .Q(PGA_Gain[3]) );
  DFQM1SA gaintemp_max_reg_3_ ( .D(n271), .CK(CLK), .Q(gaintemp_max[3]) );
  DFQM1SA PGA_Gain_IR_reg_3_ ( .D(n253), .CK(CLK), .Q(PGA_Gain_IR[3]) );
  AN2M1S DP_OP_189J1_124_5499_U8 ( .A(C1_Z_0), .B(DC_Comp[0]), .Z(
        DP_OP_189J1_124_5499_n7) );
  ADFM1SA DP_OP_189J1_124_5499_U7 ( .A(DC_Comp[1]), .B(C1_Z_1), .CI(
        DP_OP_189J1_124_5499_n7), .CO(DP_OP_189J1_124_5499_n6), .S(
        C134_DATA2_0) );
  ADFM1SA DP_OP_189J1_124_5499_U6 ( .A(DC_Comp[2]), .B(C1_Z_2), .CI(
        DP_OP_189J1_124_5499_n6), .CO(DP_OP_189J1_124_5499_n5), .S(
        C134_DATA2_1) );
  ADFM1SA DP_OP_189J1_124_5499_U5 ( .A(DC_Comp[3]), .B(C1_Z_3), .CI(
        DP_OP_189J1_124_5499_n5), .CO(DP_OP_189J1_124_5499_n4), .S(
        C134_DATA2_2) );
  ADFM1SA DP_OP_189J1_124_5499_U4 ( .A(DC_Comp[4]), .B(C1_Z_4), .CI(
        DP_OP_189J1_124_5499_n4), .CO(DP_OP_189J1_124_5499_n3), .S(
        C134_DATA2_3) );
  ADFM1SA DP_OP_189J1_124_5499_U3 ( .A(DC_Comp[5]), .B(C1_Z_5), .CI(
        DP_OP_189J1_124_5499_n3), .CO(DP_OP_189J1_124_5499_n2), .S(
        C134_DATA2_4) );
  ADFM1SA DP_OP_189J1_124_5499_U2 ( .A(DC_Comp[6]), .B(C1_Z_6), .CI(
        DP_OP_189J1_124_5499_n2), .CO(C134_DATA2_6), .S(C134_DATA2_5) );
  ADFM1SA intadd_0_U2 ( .A(max_index[9]), .B(min_index[9]), .CI(intadd_0_n2), 
        .CO(intadd_0_n1), .S(intadd_0_SUM_8_) );
  ADFM1SA intadd_0_U3 ( .A(max_index[8]), .B(min_index[8]), .CI(intadd_0_n3), 
        .CO(intadd_0_n2), .S(intadd_0_SUM_7_) );
  ADFM1SA intadd_0_U4 ( .A(max_index[7]), .B(min_index[7]), .CI(intadd_0_n4), 
        .CO(intadd_0_n3), .S(intadd_0_SUM_6_) );
  ADFM1SA intadd_0_U5 ( .A(max_index[6]), .B(min_index[6]), .CI(intadd_0_n5), 
        .CO(intadd_0_n4), .S(intadd_0_SUM_5_) );
  ADFM1SA intadd_0_U6 ( .A(max_index[5]), .B(min_index[5]), .CI(intadd_0_n6), 
        .CO(intadd_0_n5), .S(intadd_0_SUM_4_) );
  ADFM1SA intadd_0_U7 ( .A(max_index[4]), .B(min_index[4]), .CI(intadd_0_n7), 
        .CO(intadd_0_n6), .S(intadd_0_SUM_3_) );
  ADFM1SA intadd_0_U8 ( .A(max_index[3]), .B(min_index[3]), .CI(intadd_0_n8), 
        .CO(intadd_0_n7), .S(intadd_0_SUM_2_) );
  ADFM1SA intadd_0_U9 ( .A(max_index[2]), .B(min_index[2]), .CI(intadd_0_n9), 
        .CO(intadd_0_n8), .S(intadd_0_SUM_1_) );
  ADFM1SA intadd_0_U10 ( .A(max_index[1]), .B(min_index[1]), .CI(intadd_0_CI), 
        .CO(intadd_0_n9), .S(intadd_0_SUM_0_) );
  DFM1SA counter_reg_9_ ( .D(N406), .CK(CLK), .Q(counter[9]), .QB(n754) );
  NR2M5S U384 ( .A(Vppg[7]), .B(n566), .Z(n567) );
  NR2M3S U385 ( .A(n623), .B(n537), .Z(n531) );
  ND4M2R U386 ( .A(n729), .B(n588), .C(n587), .D(n586), .Z(n669) );
  NR2M4S U387 ( .A(n626), .B(n678), .Z(n467) );
  NR2M4S U388 ( .A(n537), .B(n583), .Z(n538) );
  INVM1S U389 ( .A(1'b1), .Z(LED_Drive[0]) );
  INVM1S U391 ( .A(1'b1), .Z(LED_Drive[1]) );
  INVM1S U393 ( .A(1'b1), .Z(LED_Drive[2]) );
  INVM1S U395 ( .A(1'b0), .Z(LED_Drive[3]) );
  NR2M3S U397 ( .A(n613), .B(n611), .Z(n614) );
  NR3M4R U398 ( .A(LED_RED), .B(n621), .C(n688), .Z(n622) );
  NR2M3S U399 ( .A(n613), .B(n541), .Z(n540) );
  OA21M1SA U400 ( .A1(n690), .A2(n693), .B(n424), .Z(n425) );
  MAOI22M1SA U401 ( .A1(n620), .A2(n710), .B1(n620), .B2(RED_ADC_Value[1]), 
        .Z(n351) );
  MAOI22M1SA U402 ( .A1(n597), .A2(n558), .B1(n597), .B2(IR_ADC_Value[0]), .Z(
        n366) );
  MOAI22M1SA U403 ( .A1(n683), .A2(n662), .B1(n683), .B2(nextState[2]), .Z(
        n368) );
  INVM1S U404 ( .A(counter[7]), .Z(n704) );
  INVM1S U405 ( .A(counter[5]), .Z(n700) );
  INVM1S U406 ( .A(counter[3]), .Z(n696) );
  INVM1S U407 ( .A(counter[1]), .Z(n692) );
  INVM1S U408 ( .A(counter[0]), .Z(n691) );
  NR2M1S U409 ( .A(n692), .B(n691), .Z(n630) );
  ND2M1S U410 ( .A(counter[2]), .B(n630), .Z(n632) );
  NR2M1S U411 ( .A(n696), .B(n632), .Z(n631) );
  ND2M1S U412 ( .A(counter[4]), .B(n631), .Z(n634) );
  NR2M1S U413 ( .A(n700), .B(n634), .Z(n633) );
  ND2M1S U414 ( .A(counter[6]), .B(n633), .Z(n636) );
  NR2M1S U415 ( .A(n704), .B(n636), .Z(n635) );
  NR2M1S U416 ( .A(currentState[1]), .B(n752), .Z(n640) );
  ND2M1S U417 ( .A(currentState[0]), .B(n640), .Z(n688) );
  INVM1S U418 ( .A(n688), .Z(n720) );
  NR4M1S U419 ( .A(counter[9]), .B(counter[6]), .C(counter[4]), .D(counter[2]), 
        .Z(n381) );
  NR4M1S U420 ( .A(counter[7]), .B(counter[5]), .C(counter[8]), .D(n696), .Z(
        n380) );
  ND4M2S U421 ( .A(counter[0]), .B(n381), .C(n380), .D(n692), .Z(n533) );
  NR2M2S U422 ( .A(currentState[0]), .B(currentState[2]), .Z(n681) );
  AOI211M1S U423 ( .A1(n720), .A2(n533), .B(currentState[1]), .C(n681), .Z(
        n384) );
  ND2M1S U424 ( .A(n640), .B(n751), .Z(n659) );
  INVM1S U425 ( .A(n659), .Z(n723) );
  INVM1S U426 ( .A(start), .Z(n581) );
  ND2M1S U427 ( .A(n723), .B(n581), .Z(n433) );
  NR4M1S U428 ( .A(counter[4]), .B(counter[3]), .C(n700), .D(n704), .Z(n382)
         );
  ND4M1S U429 ( .A(counter[9]), .B(counter[6]), .C(counter[8]), .D(n382), .Z(
        n383) );
  NR2M1S U430 ( .A(n632), .B(n383), .Z(n645) );
  AOI21M2S U431 ( .A1(n384), .A2(n433), .B(n645), .Z(n629) );
  ND2M1S U432 ( .A(counter[8]), .B(n635), .Z(n639) );
  OA211M1SA U433 ( .A1(counter[8]), .A2(n635), .B(n629), .C(n639), .Z(N405) );
  INVM1S U434 ( .A(max_index[6]), .Z(n702) );
  INVM1S U435 ( .A(max_index[1]), .Z(n693) );
  INVM1S U436 ( .A(max_index[0]), .Z(n690) );
  ND2M1S U437 ( .A(n693), .B(n690), .Z(n424) );
  NR2M1S U438 ( .A(n424), .B(max_index[2]), .Z(n389) );
  INVM1S U439 ( .A(n389), .Z(n388) );
  NR2M2S U440 ( .A(max_index[3]), .B(n388), .Z(n395) );
  INVM1S U441 ( .A(max_index[4]), .Z(n698) );
  NR2M1S U442 ( .A(n395), .B(n698), .Z(n387) );
  ND2M1S U443 ( .A(max_index[5]), .B(n387), .Z(n386) );
  NR2M1S U444 ( .A(n702), .B(n386), .Z(n385) );
  ND2M1S U445 ( .A(max_index[7]), .B(n385), .Z(n405) );
  MAOI22M1SA U446 ( .A1(max_index[8]), .A2(n405), .B1(max_index[8]), .B2(n405), 
        .Z(n404) );
  MAOI22M1SA U447 ( .A1(max_index[7]), .A2(n385), .B1(max_index[7]), .B2(n385), 
        .Z(n402) );
  MAOI22M1SA U448 ( .A1(max_index[6]), .A2(n386), .B1(max_index[6]), .B2(n386), 
        .Z(n400) );
  MAOI22M1SA U449 ( .A1(max_index[5]), .A2(n387), .B1(max_index[5]), .B2(n387), 
        .Z(n398) );
  AOI21M1S U450 ( .A1(max_index[3]), .A2(n388), .B(n395), .Z(n422) );
  INVM1S U451 ( .A(n422), .Z(n394) );
  AOI21M1S U452 ( .A1(max_index[2]), .A2(n424), .B(n389), .Z(n423) );
  NR2M1S U453 ( .A(counter[0]), .B(counter[1]), .Z(n391) );
  OAI211M1S U454 ( .A1(counter[0]), .A2(n690), .B(counter[1]), .C(max_index[1]), .Z(n390) );
  OAI31M1S U455 ( .A1(n391), .A2(n690), .A3(max_index[1]), .B(n390), .Z(n392)
         );
  MAOI222M1SA U456 ( .A(n423), .B(counter[2]), .C(n392), .Z(n393) );
  MAOI222M1SA U457 ( .A(n696), .B(n394), .C(n393), .Z(n396) );
  MAOI22M1SA U458 ( .A1(max_index[4]), .A2(n395), .B1(max_index[4]), .B2(n395), 
        .Z(n430) );
  MAOI222M1SA U459 ( .A(counter[4]), .B(n396), .C(n430), .Z(n397) );
  MAOI222M1SA U460 ( .A(n398), .B(n700), .C(n397), .Z(n399) );
  MAOI222M1SA U461 ( .A(counter[6]), .B(n400), .C(n399), .Z(n401) );
  MAOI222M1SA U462 ( .A(n402), .B(n704), .C(n401), .Z(n403) );
  MAOI222M1SA U463 ( .A(n404), .B(n403), .C(counter[8]), .Z(n408) );
  INVM1S U464 ( .A(max_index[8]), .Z(n705) );
  NR2M1S U465 ( .A(n705), .B(n405), .Z(n406) );
  NR2M1S U466 ( .A(max_index[9]), .B(n406), .Z(n409) );
  ND2M1S U467 ( .A(counter[9]), .B(n409), .Z(n407) );
  ND2M1S U468 ( .A(n408), .B(n407), .Z(n421) );
  OR2M1S U469 ( .A(n409), .B(counter[9]), .Z(n420) );
  INVM1S U470 ( .A(max_index[9]), .Z(n709) );
  INVM1S U471 ( .A(counter[8]), .Z(n706) );
  INVM1S U472 ( .A(counter[6]), .Z(n701) );
  INVM1S U473 ( .A(counter[4]), .Z(n697) );
  INVM1S U474 ( .A(counter[2]), .Z(n694) );
  ND2M1S U475 ( .A(max_index[0]), .B(n691), .Z(n410) );
  MAOI222M1SA U476 ( .A(n410), .B(n693), .C(counter[1]), .Z(n411) );
  MAOI222M1SA U477 ( .A(max_index[2]), .B(n694), .C(n411), .Z(n412) );
  INVM1S U478 ( .A(max_index[3]), .Z(n695) );
  MAOI222M1SA U479 ( .A(counter[3]), .B(n412), .C(n695), .Z(n413) );
  MAOI222M1SA U480 ( .A(max_index[4]), .B(n697), .C(n413), .Z(n414) );
  INVM1S U481 ( .A(max_index[5]), .Z(n699) );
  MAOI222M1SA U482 ( .A(counter[5]), .B(n414), .C(n699), .Z(n415) );
  MAOI222M1SA U483 ( .A(max_index[6]), .B(n701), .C(n415), .Z(n416) );
  INVM1S U484 ( .A(max_index[7]), .Z(n703) );
  MAOI222M1SA U485 ( .A(counter[7]), .B(n416), .C(n703), .Z(n417) );
  MAOI222M1SA U486 ( .A(max_index[8]), .B(n706), .C(n417), .Z(n418) );
  MAOI222M1SA U487 ( .A(counter[9]), .B(n709), .C(n418), .Z(n419) );
  AOI211M1S U488 ( .A1(n421), .A2(n420), .B(n419), .C(n659), .Z(n585) );
  INVM1S U489 ( .A(n585), .Z(n731) );
  NR2M1S U490 ( .A(counter[4]), .B(n430), .Z(n429) );
  NR2M1S U491 ( .A(counter[3]), .B(n422), .Z(n428) );
  NR2M1S U492 ( .A(counter[2]), .B(n423), .Z(n427) );
  OAI22M1S U493 ( .A1(counter[1]), .A2(n425), .B1(counter[0]), .B2(
        max_index[0]), .Z(n426) );
  NR4M1S U494 ( .A(n429), .B(n428), .C(n427), .D(n426), .Z(n432) );
  ND2M1S U495 ( .A(counter[4]), .B(n430), .Z(n431) );
  ND2M1S U496 ( .A(n432), .B(n431), .Z(n589) );
  ND2M2S U497 ( .A(n723), .B(start), .Z(n536) );
  NR2M1S U498 ( .A(currentState[1]), .B(n751), .Z(n687) );
  ND2B1M2S U499 ( .NA(currentState[2]), .B(n687), .Z(n689) );
  OAI211M1S U500 ( .A1(n731), .A2(n589), .B(n536), .C(n689), .Z(n434) );
  MAOI22M1SA U501 ( .A1(n434), .A2(n433), .B1(n434), .B2(start), .Z(n275) );
  OA211M1SA U502 ( .A1(counter[2]), .A2(n630), .B(n629), .C(n632), .Z(N399) );
  OA211M1SA U503 ( .A1(counter[6]), .A2(n633), .B(n629), .C(n636), .Z(N403) );
  ND2M1S U504 ( .A(currentState[1]), .B(currentState[2]), .Z(n684) );
  NR2M2S U505 ( .A(currentState[0]), .B(n684), .Z(n535) );
  INVM1S U506 ( .A(DC_right[4]), .Z(n576) );
  INVM1S U507 ( .A(DC_right[2]), .Z(n572) );
  INVM1S U508 ( .A(DC_left[0]), .Z(n617) );
  NR2M1S U509 ( .A(n617), .B(DC_right[1]), .Z(n435) );
  ND2B1M1S U510 ( .NA(DC_right[0]), .B(n435), .Z(n441) );
  NR2B1M1S U511 ( .NA(n572), .B(n441), .Z(n440) );
  INVM1S U512 ( .A(DC_right[3]), .Z(n574) );
  ND2M1S U513 ( .A(n440), .B(n574), .Z(n438) );
  NR2B1M1S U514 ( .NA(n576), .B(n438), .Z(n451) );
  INVM1S U515 ( .A(DC_right[5]), .Z(n578) );
  ND2M1S U516 ( .A(n451), .B(n578), .Z(n450) );
  INVM1S U517 ( .A(DC_left[6]), .Z(n436) );
  ND2M1S U518 ( .A(n436), .B(DC_right[6]), .Z(n437) );
  CKXOR2M1SA U519 ( .A(n450), .B(n437), .Z(n455) );
  XNR3M1S U520 ( .A(DC_left[4]), .B(n576), .C(n438), .Z(n449) );
  INVM1S U521 ( .A(n440), .Z(n439) );
  XNR3M1S U522 ( .A(DC_left[3]), .B(DC_right[3]), .C(n439), .Z(n444) );
  AOI21M1S U523 ( .A1(DC_right[2]), .A2(n441), .B(n440), .Z(n442) );
  XNR2M1SA U524 ( .A(n442), .B(DC_left[2]), .Z(n443) );
  NR2M1S U525 ( .A(n444), .B(n443), .Z(n448) );
  INVM1S U526 ( .A(DC_right[6]), .Z(n580) );
  NR2M1S U527 ( .A(n617), .B(DC_right[0]), .Z(n445) );
  XOR3M1SA U528 ( .A(DC_left[1]), .B(DC_right[1]), .C(n445), .Z(n446) );
  AOI21M1S U529 ( .A1(DC_left[6]), .A2(n580), .B(n446), .Z(n447) );
  ND3M1S U530 ( .A(n449), .B(n448), .C(n447), .Z(n454) );
  OAI21M1S U531 ( .A1(n451), .A2(n578), .B(n450), .Z(n452) );
  CKXOR2M1SA U532 ( .A(n452), .B(DC_left[5]), .Z(n453) );
  NR3M1S U533 ( .A(n455), .B(n454), .C(n453), .Z(n529) );
  ND2M1S U534 ( .A(n535), .B(n529), .Z(n646) );
  AN3M1S U535 ( .A(n536), .B(n689), .C(n646), .Z(n456) );
  INVM1S U536 ( .A(red_on_flag[1]), .Z(n556) );
  MAOI22M1SA U537 ( .A1(n456), .A2(n556), .B1(n456), .B2(n535), .Z(n341) );
  INVM1S U538 ( .A(n689), .Z(n537) );
  AO31M1SA U539 ( .A1(red_on_flag[0]), .A2(n536), .A3(n646), .B(n537), .Z(n342) );
  INVM1S U540 ( .A(Vppg[7]), .Z(n611) );
  ND2M1S U541 ( .A(temp_min[7]), .B(n611), .Z(n466) );
  INVM1S U542 ( .A(temp_min[1]), .Z(n711) );
  INVM1S U543 ( .A(Vppg[0]), .Z(n558) );
  ND2M1S U544 ( .A(temp_min[0]), .B(n558), .Z(n457) );
  MAOI222M1SA U545 ( .A(Vppg[1]), .B(n711), .C(n457), .Z(n458) );
  INVM1S U546 ( .A(Vppg[2]), .Z(n559) );
  MAOI222M1SA U547 ( .A(n458), .B(temp_min[2]), .C(n559), .Z(n459) );
  INVM1S U548 ( .A(temp_min[3]), .Z(n713) );
  MAOI222M1SA U549 ( .A(Vppg[3]), .B(n459), .C(n713), .Z(n460) );
  INVM1S U550 ( .A(Vppg[4]), .Z(n560) );
  MAOI222M1SA U551 ( .A(n460), .B(temp_min[4]), .C(n560), .Z(n461) );
  INVM1S U552 ( .A(temp_min[5]), .Z(n716) );
  MAOI222M1SA U553 ( .A(Vppg[5]), .B(n461), .C(n716), .Z(n462) );
  INVM1S U554 ( .A(Vppg[6]), .Z(n561) );
  MAOI222M1SA U555 ( .A(n462), .B(temp_min[6]), .C(n561), .Z(n465) );
  INVM1S U556 ( .A(temp_min[7]), .Z(n463) );
  ND2B1M4S U557 ( .NA(n750), .B(n681), .Z(n679) );
  ND2B1M1S U558 ( .NA(n679), .B(LED_RED), .Z(n551) );
  AOI21M1S U559 ( .A1(Vppg[7]), .A2(n463), .B(n551), .Z(n464) );
  OAI21B20M1S U560 ( .NA1(n466), .NA2(n465), .B(n464), .Z(n626) );
  INVM1S U561 ( .A(red_on_flag[0]), .Z(n721) );
  ND2M1S U562 ( .A(red_on_flag[1]), .B(n721), .Z(n678) );
  NR2M4S U563 ( .A(n537), .B(n467), .Z(n532) );
  AO22M1SA U564 ( .A1(counter[0]), .A2(n467), .B1(n532), .B2(min_index[0]), 
        .Z(n330) );
  AO22M1SA U565 ( .A1(counter[1]), .A2(n467), .B1(n532), .B2(min_index[1]), 
        .Z(n329) );
  AO22M1SA U566 ( .A1(counter[2]), .A2(n467), .B1(n532), .B2(min_index[2]), 
        .Z(n328) );
  AO22M1SA U567 ( .A1(counter[3]), .A2(n467), .B1(n532), .B2(min_index[3]), 
        .Z(n327) );
  AO22M1SA U568 ( .A1(counter[4]), .A2(n467), .B1(n532), .B2(min_index[4]), 
        .Z(n326) );
  AO22M1SA U569 ( .A1(counter[5]), .A2(n467), .B1(n532), .B2(min_index[5]), 
        .Z(n325) );
  AO22M1SA U570 ( .A1(counter[6]), .A2(n467), .B1(n532), .B2(min_index[6]), 
        .Z(n324) );
  AO22M1SA U571 ( .A1(counter[7]), .A2(n467), .B1(n532), .B2(min_index[7]), 
        .Z(n323) );
  AO22M1SA U572 ( .A1(counter[8]), .A2(n467), .B1(n532), .B2(min_index[8]), 
        .Z(n322) );
  INVM1S U573 ( .A(intadd_0_SUM_8_), .Z(n498) );
  INVM1S U574 ( .A(intadd_0_SUM_6_), .Z(n497) );
  INVM1S U575 ( .A(intadd_0_SUM_4_), .Z(n496) );
  NR2M1S U576 ( .A(intadd_0_SUM_0_), .B(intadd_0_SUM_1_), .Z(n472) );
  INVM1S U577 ( .A(intadd_0_SUM_2_), .Z(n505) );
  ND2M1S U578 ( .A(n472), .B(n505), .Z(n471) );
  ND2M1S U579 ( .A(intadd_0_SUM_3_), .B(n471), .Z(n478) );
  NR2M1S U580 ( .A(n496), .B(n478), .Z(n470) );
  ND2M1S U581 ( .A(intadd_0_SUM_5_), .B(n470), .Z(n483) );
  NR2M1S U582 ( .A(n497), .B(n483), .Z(n469) );
  ND2M1S U583 ( .A(intadd_0_SUM_7_), .B(n469), .Z(n468) );
  NR2M1S U584 ( .A(n498), .B(n468), .Z(n495) );
  NR2M1S U585 ( .A(n495), .B(intadd_0_n1), .Z(n493) );
  MAOI22M1SA U586 ( .A1(intadd_0_SUM_8_), .A2(n468), .B1(intadd_0_SUM_8_), 
        .B2(n468), .Z(n489) );
  MAOI22M1SA U587 ( .A1(intadd_0_SUM_7_), .A2(n469), .B1(intadd_0_SUM_7_), 
        .B2(n469), .Z(n487) );
  MAOI22M1SA U588 ( .A1(intadd_0_SUM_5_), .A2(n470), .B1(intadd_0_SUM_5_), 
        .B2(n470), .Z(n482) );
  MAOI22M1SA U589 ( .A1(intadd_0_SUM_3_), .A2(n471), .B1(intadd_0_SUM_3_), 
        .B2(n471), .Z(n477) );
  INVM1S U590 ( .A(n472), .Z(n473) );
  AOI22M1S U591 ( .A1(intadd_0_SUM_2_), .A2(n473), .B1(n505), .B2(n472), .Z(
        n475) );
  NR2M1S U592 ( .A(counter[0]), .B(intadd_0_SUM_0_), .Z(n506) );
  ND2M1S U593 ( .A(intadd_0_SUM_0_), .B(intadd_0_SUM_1_), .Z(n504) );
  ND2M1S U594 ( .A(n473), .B(n504), .Z(n507) );
  MAOI222M1SA U595 ( .A(n506), .B(n692), .C(n507), .Z(n474) );
  MAOI222M1SA U596 ( .A(counter[2]), .B(n475), .C(n474), .Z(n476) );
  MAOI222M1SA U597 ( .A(n477), .B(n696), .C(n476), .Z(n480) );
  MAOI22M1SA U598 ( .A1(intadd_0_SUM_4_), .A2(n478), .B1(intadd_0_SUM_4_), 
        .B2(n478), .Z(n479) );
  MAOI222M1SA U599 ( .A(counter[4]), .B(n480), .C(n479), .Z(n481) );
  MAOI222M1SA U600 ( .A(n482), .B(n481), .C(n700), .Z(n485) );
  MAOI22M1SA U601 ( .A1(intadd_0_SUM_6_), .A2(n483), .B1(intadd_0_SUM_6_), 
        .B2(n483), .Z(n484) );
  MAOI222M1SA U602 ( .A(counter[6]), .B(n485), .C(n484), .Z(n486) );
  MAOI222M1SA U603 ( .A(n487), .B(n486), .C(n704), .Z(n488) );
  OAI21M1S U604 ( .A1(counter[8]), .A2(n489), .B(n488), .Z(n491) );
  ND2M1S U605 ( .A(counter[8]), .B(n489), .Z(n490) );
  ND2M1S U606 ( .A(n491), .B(n490), .Z(n492) );
  MAOI222M1SA U607 ( .A(n493), .B(counter[9]), .C(n492), .Z(n494) );
  AOI21M1S U608 ( .A1(intadd_0_n1), .A2(n495), .B(n494), .Z(n655) );
  ND3B1M2S U609 ( .NA(currentState[2]), .B(currentState[0]), .C(
        currentState[1]), .Z(n660) );
  NR2M1S U610 ( .A(n505), .B(n504), .Z(n503) );
  NR2M1S U611 ( .A(intadd_0_SUM_3_), .B(n503), .Z(n502) );
  ND2M1S U612 ( .A(n502), .B(n496), .Z(n501) );
  NR2M1S U613 ( .A(intadd_0_SUM_5_), .B(n501), .Z(n517) );
  ND2M1S U614 ( .A(n517), .B(n497), .Z(n500) );
  NR2M1S U615 ( .A(intadd_0_SUM_7_), .B(n500), .Z(n522) );
  ND2M1S U616 ( .A(n522), .B(n498), .Z(n499) );
  ND2M1S U617 ( .A(intadd_0_n1), .B(n499), .Z(n526) );
  MAOI22M1SA U618 ( .A1(intadd_0_SUM_7_), .A2(n500), .B1(intadd_0_SUM_7_), 
        .B2(n500), .Z(n521) );
  MAOI22M1SA U619 ( .A1(intadd_0_SUM_5_), .A2(n501), .B1(intadd_0_SUM_5_), 
        .B2(n501), .Z(n516) );
  MAOI22M1SA U620 ( .A1(intadd_0_SUM_4_), .A2(n502), .B1(intadd_0_SUM_4_), 
        .B2(n502), .Z(n514) );
  MAOI22M1SA U621 ( .A1(intadd_0_SUM_3_), .A2(n503), .B1(intadd_0_SUM_3_), 
        .B2(n503), .Z(n512) );
  MAOI22M1SA U622 ( .A1(n505), .A2(n504), .B1(n505), .B2(n504), .Z(n510) );
  INVM1S U623 ( .A(n506), .Z(n508) );
  MAOI222M1SA U624 ( .A(counter[1]), .B(n508), .C(n507), .Z(n509) );
  MAOI222M1SA U625 ( .A(n510), .B(n509), .C(n694), .Z(n511) );
  MAOI222M1SA U626 ( .A(counter[3]), .B(n512), .C(n511), .Z(n513) );
  MAOI222M1SA U627 ( .A(n697), .B(n514), .C(n513), .Z(n515) );
  MAOI222M1SA U628 ( .A(counter[5]), .B(n516), .C(n515), .Z(n519) );
  MAOI22M1SA U629 ( .A1(intadd_0_SUM_6_), .A2(n517), .B1(intadd_0_SUM_6_), 
        .B2(n517), .Z(n518) );
  MAOI222M1SA U630 ( .A(n519), .B(n518), .C(n701), .Z(n520) );
  MAOI222M1SA U631 ( .A(counter[7]), .B(n521), .C(n520), .Z(n524) );
  MAOI22M1SA U632 ( .A1(intadd_0_SUM_8_), .A2(n522), .B1(intadd_0_SUM_8_), 
        .B2(n522), .Z(n523) );
  MAOI222M1SA U633 ( .A(n524), .B(n706), .C(n523), .Z(n525) );
  MAOI222M1SA U634 ( .A(counter[9]), .B(n526), .C(n525), .Z(n527) );
  NR2M1S U635 ( .A(n660), .B(n527), .Z(n528) );
  ND2B1M1S U636 ( .NA(n655), .B(n528), .Z(n643) );
  OAI21B10M1S U637 ( .NA2(n535), .A1(n529), .B(n643), .Z(n565) );
  INVM1S U638 ( .A(Vppg[3]), .Z(n712) );
  INVM1S U639 ( .A(Vppg[5]), .Z(n715) );
  NR4M1S U640 ( .A(n712), .B(n560), .C(n715), .D(n561), .Z(n584) );
  AN4M1S U641 ( .A(n584), .B(Vppg[2]), .C(Vppg[0]), .D(Vppg[1]), .Z(n530) );
  NR2M1S U642 ( .A(Vppg[7]), .B(n530), .Z(n534) );
  NR2M1S U643 ( .A(Vppg[7]), .B(n534), .Z(n657) );
  NR2B1M6SA U644 ( .NA(n565), .B(n657), .Z(n623) );
  AO22M1SA U645 ( .A1(DC_Comp_temp[1]), .A2(n531), .B1(n623), .B2(C134_DATA2_0), .Z(n282) );
  AO22M1SA U646 ( .A1(DC_Comp_temp[2]), .A2(n531), .B1(n623), .B2(C134_DATA2_1), .Z(n281) );
  AO22M1SA U647 ( .A1(DC_Comp_temp[3]), .A2(n531), .B1(n623), .B2(C134_DATA2_2), .Z(n280) );
  AO22M1SA U648 ( .A1(DC_Comp_temp[4]), .A2(n531), .B1(n623), .B2(C134_DATA2_3), .Z(n279) );
  AO22M1SA U649 ( .A1(DC_Comp_temp[5]), .A2(n531), .B1(n623), .B2(C134_DATA2_4), .Z(n278) );
  AO22M1SA U650 ( .A1(DC_Comp_temp[6]), .A2(n531), .B1(n623), .B2(C134_DATA2_5), .Z(n277) );
  AO22M1SA U651 ( .A1(DC_Comp_temp[7]), .A2(n531), .B1(n623), .B2(C134_DATA2_6), .Z(n276) );
  AO22M1SA U652 ( .A1(counter[9]), .A2(n467), .B1(n532), .B2(min_index[9]), 
        .Z(n321) );
  INVM1S U653 ( .A(LED_IR), .Z(n724) );
  NR2M1S U654 ( .A(n688), .B(n533), .Z(n641) );
  ND2B1M1S U655 ( .NA(n724), .B(n641), .Z(n587) );
  INVM3S U656 ( .A(n587), .Z(n597) );
  MAOI22M1SA U657 ( .A1(n597), .A2(n561), .B1(n597), .B2(IR_ADC_Value[6]), .Z(
        n364) );
  MAOI22M1SA U658 ( .A1(n597), .A2(n715), .B1(n597), .B2(IR_ADC_Value[5]), .Z(
        n363) );
  MAOI22M1SA U659 ( .A1(n597), .A2(n560), .B1(n597), .B2(IR_ADC_Value[4]), .Z(
        n362) );
  MAOI22M1SA U660 ( .A1(n597), .A2(n712), .B1(n597), .B2(IR_ADC_Value[3]), .Z(
        n361) );
  MAOI22M1SA U661 ( .A1(n597), .A2(n559), .B1(n597), .B2(IR_ADC_Value[2]), .Z(
        n360) );
  INVM1S U662 ( .A(Vppg[1]), .Z(n710) );
  MAOI22M1SA U663 ( .A1(n597), .A2(n710), .B1(n597), .B2(IR_ADC_Value[1]), .Z(
        n359) );
  ND2B1M1S U664 ( .NA(n753), .B(n641), .Z(n586) );
  INVM4S U665 ( .A(n586), .Z(n620) );
  MAOI22M1SA U666 ( .A1(n620), .A2(n558), .B1(n620), .B2(RED_ADC_Value[0]), 
        .Z(n358) );
  MAOI22M1SA U667 ( .A1(n620), .A2(n561), .B1(n620), .B2(RED_ADC_Value[6]), 
        .Z(n356) );
  MAOI22M1SA U668 ( .A1(n620), .A2(n715), .B1(n620), .B2(RED_ADC_Value[5]), 
        .Z(n355) );
  MAOI22M1SA U669 ( .A1(n620), .A2(n560), .B1(n620), .B2(RED_ADC_Value[4]), 
        .Z(n354) );
  MAOI22M1SA U670 ( .A1(n620), .A2(n712), .B1(n620), .B2(RED_ADC_Value[3]), 
        .Z(n353) );
  MAOI22M1SA U671 ( .A1(n620), .A2(n559), .B1(n620), .B2(RED_ADC_Value[2]), 
        .Z(n352) );
  OA21M2SA U672 ( .A1(n536), .A2(n753), .B(n689), .Z(n740) );
  INVM1S U673 ( .A(n740), .Z(n582) );
  ND2M2S U674 ( .A(n723), .B(n582), .Z(n741) );
  INVM1S U675 ( .A(n741), .Z(n539) );
  AO22M1SA U676 ( .A1(DC_Comp[0]), .A2(n539), .B1(n740), .B2(DC_Comp_RED[0]), 
        .Z(n749) );
  INVM1S U677 ( .A(n534), .Z(n612) );
  AOI21B01M4S U678 ( .A1(n565), .A2(n612), .NB(n679), .Z(n541) );
  INVM1S U679 ( .A(n660), .Z(n654) );
  NR2M1S U680 ( .A(n654), .B(n535), .Z(n613) );
  AO22M1SA U681 ( .A1(DC_left[0]), .A2(n541), .B1(DC_Comp[0]), .B2(n540), .Z(
        n289) );
  NR2M1S U682 ( .A(n536), .B(n724), .Z(n583) );
  BUFM2S U683 ( .A(n583), .Z(n542) );
  AO22M1SA U684 ( .A1(DC_Comp_IR[0]), .A2(n538), .B1(DC_Comp[0]), .B2(n542), 
        .Z(n263) );
  AO22M1SA U685 ( .A1(DC_Comp[1]), .A2(n539), .B1(n740), .B2(DC_Comp_RED[1]), 
        .Z(n747) );
  AO22M1SA U686 ( .A1(DC_Comp[1]), .A2(n540), .B1(n541), .B2(DC_left[1]), .Z(
        n288) );
  AO22M1SA U687 ( .A1(DC_Comp_IR[1]), .A2(n538), .B1(DC_Comp[1]), .B2(n542), 
        .Z(n262) );
  AO22M1SA U688 ( .A1(DC_Comp[2]), .A2(n539), .B1(n740), .B2(DC_Comp_RED[2]), 
        .Z(n746) );
  AO22M1SA U689 ( .A1(DC_Comp[2]), .A2(n540), .B1(n541), .B2(DC_left[2]), .Z(
        n287) );
  AO22M1SA U690 ( .A1(DC_Comp_IR[2]), .A2(n538), .B1(DC_Comp[2]), .B2(n542), 
        .Z(n261) );
  AO22M1SA U691 ( .A1(DC_Comp[3]), .A2(n539), .B1(n740), .B2(DC_Comp_RED[3]), 
        .Z(n745) );
  AO22M1SA U692 ( .A1(DC_Comp[3]), .A2(n540), .B1(n541), .B2(DC_left[3]), .Z(
        n286) );
  AO22M1SA U693 ( .A1(DC_Comp_IR[3]), .A2(n538), .B1(DC_Comp[3]), .B2(n542), 
        .Z(n260) );
  AO22M1SA U694 ( .A1(DC_Comp[4]), .A2(n539), .B1(n740), .B2(DC_Comp_RED[4]), 
        .Z(n744) );
  AO22M1SA U695 ( .A1(DC_Comp[4]), .A2(n540), .B1(n541), .B2(DC_left[4]), .Z(
        n285) );
  AO22M1SA U696 ( .A1(DC_Comp_IR[4]), .A2(n538), .B1(DC_Comp[4]), .B2(n542), 
        .Z(n259) );
  AO22M1SA U697 ( .A1(DC_Comp[5]), .A2(n539), .B1(n740), .B2(DC_Comp_RED[5]), 
        .Z(n743) );
  AO22M1SA U698 ( .A1(DC_Comp[5]), .A2(n540), .B1(n541), .B2(DC_left[5]), .Z(
        n284) );
  AO22M1SA U699 ( .A1(DC_Comp_IR[5]), .A2(n538), .B1(DC_Comp[5]), .B2(n542), 
        .Z(n258) );
  AO22M1SA U700 ( .A1(DC_Comp[6]), .A2(n539), .B1(n740), .B2(DC_Comp_RED[6]), 
        .Z(n748) );
  AO22M1SA U701 ( .A1(DC_left[6]), .A2(n541), .B1(DC_Comp[6]), .B2(n540), .Z(
        n283) );
  AO22M1SA U702 ( .A1(DC_Comp_IR[6]), .A2(n538), .B1(DC_Comp[6]), .B2(n542), 
        .Z(n257) );
  AO22M1SA U703 ( .A1(PGA_Gain_IR[0]), .A2(n538), .B1(gaintemp_max[0]), .B2(
        n542), .Z(n256) );
  AO22M1SA U704 ( .A1(PGA_Gain_IR[1]), .A2(n538), .B1(gaintemp_max[1]), .B2(
        n542), .Z(n255) );
  AO22M1SA U705 ( .A1(PGA_Gain_IR[2]), .A2(n538), .B1(gaintemp_max[2]), .B2(
        n542), .Z(n254) );
  AO22M1SA U706 ( .A1(PGA_Gain_IR[3]), .A2(n538), .B1(gaintemp_max[3]), .B2(
        n542), .Z(n253) );
  OA211M1SA U707 ( .A1(counter[4]), .A2(n631), .B(n629), .C(n634), .Z(N401) );
  NR2M1S U708 ( .A(n611), .B(temp_max[7]), .Z(n553) );
  NR2M1S U709 ( .A(n558), .B(temp_max[0]), .Z(n543) );
  INVM1S U710 ( .A(temp_max[1]), .Z(n594) );
  MAOI222M1SA U711 ( .A(n543), .B(Vppg[1]), .C(n594), .Z(n544) );
  MAOI222M1SA U712 ( .A(n544), .B(temp_max[2]), .C(n559), .Z(n545) );
  INVM1S U713 ( .A(temp_max[3]), .Z(n595) );
  MAOI222M1SA U714 ( .A(Vppg[3]), .B(n545), .C(n595), .Z(n546) );
  MAOI222M1SA U715 ( .A(n546), .B(temp_max[4]), .C(n560), .Z(n547) );
  INVM1S U716 ( .A(temp_max[5]), .Z(n596) );
  MAOI222M1SA U717 ( .A(Vppg[5]), .B(n547), .C(n596), .Z(n548) );
  MAOI222M1SA U718 ( .A(n548), .B(temp_max[6]), .C(n561), .Z(n550) );
  ND2M1S U719 ( .A(temp_max[7]), .B(n611), .Z(n549) );
  ND2M1S U720 ( .A(n550), .B(n549), .Z(n552) );
  AOI21B10M1S U721 ( .NA2(n553), .A1(n552), .B(n551), .Z(n555) );
  INVM1S U722 ( .A(n678), .Z(n554) );
  ND2M6S U723 ( .A(n555), .B(n554), .Z(n707) );
  INVM1S U724 ( .A(n555), .Z(n557) );
  NR2B1M4S U725 ( .NA(n556), .B(n679), .Z(n722) );
  NR2B1M4S U726 ( .NA(n689), .B(n722), .Z(n714) );
  OAI21M2S U727 ( .A1(red_on_flag[0]), .A2(n557), .B(n714), .Z(n650) );
  INVM1S U728 ( .A(n650), .Z(n562) );
  MOAI22M1SA U729 ( .A1(n558), .A2(n707), .B1(n562), .B2(temp_max[0]), .Z(n320) );
  MOAI22M1SA U730 ( .A1(n559), .A2(n707), .B1(n562), .B2(temp_max[2]), .Z(n318) );
  MOAI22M1SA U731 ( .A1(n560), .A2(n707), .B1(n562), .B2(temp_max[4]), .Z(n316) );
  MOAI22M1SA U732 ( .A1(n561), .A2(n707), .B1(n562), .B2(temp_max[6]), .Z(n314) );
  MOAI22M1SA U733 ( .A1(n611), .A2(n707), .B1(temp_max[7]), .B2(n562), .Z(n313) );
  INVM1S U734 ( .A(IR_ADC_Value[7]), .Z(n563) );
  MXB2M1SA U735 ( .A(n563), .B(n611), .S(n597), .Z(n365) );
  INVM1S U736 ( .A(RED_ADC_Value[7]), .Z(n564) );
  MXB2M1SA U737 ( .A(n564), .B(n611), .S(n620), .Z(n357) );
  INVM1S U738 ( .A(n565), .Z(n566) );
  INVM1S U739 ( .A(DC_right[0]), .Z(n619) );
  ND2M1S U740 ( .A(DC_Comp[0]), .B(n567), .Z(n568) );
  OAI211M1S U741 ( .A1(n567), .A2(n619), .B(n679), .C(n568), .Z(n296) );
  INVM1S U742 ( .A(DC_right[1]), .Z(n570) );
  ND2M1S U743 ( .A(DC_Comp[1]), .B(n567), .Z(n569) );
  OAI211M1S U744 ( .A1(n567), .A2(n570), .B(n679), .C(n569), .Z(n295) );
  ND2M1S U745 ( .A(DC_Comp[2]), .B(n567), .Z(n571) );
  OAI211M1S U746 ( .A1(n567), .A2(n572), .B(n679), .C(n571), .Z(n294) );
  ND2M1S U747 ( .A(DC_Comp[3]), .B(n567), .Z(n573) );
  OAI211M1S U748 ( .A1(n567), .A2(n574), .B(n679), .C(n573), .Z(n293) );
  ND2M1S U749 ( .A(DC_Comp[4]), .B(n567), .Z(n575) );
  OAI211M1S U750 ( .A1(n567), .A2(n576), .B(n679), .C(n575), .Z(n292) );
  ND2M1S U751 ( .A(DC_Comp[5]), .B(n567), .Z(n577) );
  OAI211M1S U752 ( .A1(n567), .A2(n578), .B(n679), .C(n577), .Z(n291) );
  ND2M1S U753 ( .A(DC_Comp[6]), .B(n567), .Z(n579) );
  OAI211M1S U754 ( .A1(n567), .A2(n580), .B(n679), .C(n579), .Z(n290) );
  AOI21M1S U755 ( .A1(n753), .A2(n724), .B(n581), .Z(n649) );
  NR2M1S U756 ( .A(n649), .B(n659), .Z(n732) );
  NR2M1S U757 ( .A(n583), .B(n582), .Z(n729) );
  OAI211M1S U758 ( .A1(Vppg[1]), .A2(Vppg[2]), .B(n584), .C(Vppg[7]), .Z(n730)
         );
  OAI21B10M1S U759 ( .NA2(n589), .A1(n730), .B(n585), .Z(n588) );
  ND3M2S U760 ( .A(n732), .B(n589), .C(n669), .Z(n670) );
  INVM1S U761 ( .A(n670), .Z(n672) );
  ND3M1S U762 ( .A(PGA_Gain[2]), .B(PGA_Gain[1]), .C(PGA_Gain[0]), .Z(n667) );
  ND2M1S U763 ( .A(n672), .B(n667), .Z(n593) );
  ND2M1S U764 ( .A(PGA_Gain[1]), .B(PGA_Gain[0]), .Z(n592) );
  ND2M1S U765 ( .A(n669), .B(n593), .Z(n665) );
  ND2M1S U766 ( .A(PGA_Gain[2]), .B(n665), .Z(n591) );
  ND2M1S U767 ( .A(n720), .B(n669), .Z(n664) );
  INVM1S U768 ( .A(n664), .Z(n673) );
  OAI221M1S U769 ( .A1(LED_RED), .A2(PGA_Gain_RED[2]), .B1(n753), .B2(
        PGA_Gain_IR[2]), .C(n673), .Z(n590) );
  OAI211M1S U770 ( .A1(n593), .A2(n592), .B(n591), .C(n590), .Z(n347) );
  OAI22M1S U771 ( .A1(n710), .A2(n707), .B1(n650), .B2(n594), .Z(n319) );
  OAI22M1S U772 ( .A1(n712), .A2(n707), .B1(n650), .B2(n595), .Z(n317) );
  OAI22M1S U773 ( .A1(n715), .A2(n707), .B1(n650), .B2(n596), .Z(n315) );
  NR4M1S U774 ( .A(n623), .B(n620), .C(n597), .D(n722), .Z(n598) );
  BUFM2S U775 ( .A(n598), .Z(n621) );
  AOI22M1S U776 ( .A1(n621), .A2(DC_Comp[6]), .B1(n620), .B2(DC_Comp_IR[6]), 
        .Z(n600) );
  AOI22M1S U777 ( .A1(n623), .A2(DC_Comp_temp[7]), .B1(n622), .B2(
        DC_Comp_RED[6]), .Z(n599) );
  ND2M1S U778 ( .A(n600), .B(n599), .Z(n297) );
  AOI22M1S U779 ( .A1(n621), .A2(DC_Comp[4]), .B1(n620), .B2(DC_Comp_IR[4]), 
        .Z(n602) );
  AOI22M1S U780 ( .A1(n623), .A2(DC_Comp_temp[5]), .B1(n622), .B2(
        DC_Comp_RED[4]), .Z(n601) );
  ND2M1S U781 ( .A(n602), .B(n601), .Z(n299) );
  AOI22M1S U782 ( .A1(n621), .A2(DC_Comp[3]), .B1(n620), .B2(DC_Comp_IR[3]), 
        .Z(n604) );
  AOI22M1S U783 ( .A1(n623), .A2(DC_Comp_temp[4]), .B1(n622), .B2(
        DC_Comp_RED[3]), .Z(n603) );
  ND2M1S U784 ( .A(n604), .B(n603), .Z(n300) );
  AOI22M1S U785 ( .A1(n621), .A2(DC_Comp[2]), .B1(n620), .B2(DC_Comp_IR[2]), 
        .Z(n606) );
  AOI22M1S U786 ( .A1(n623), .A2(DC_Comp_temp[3]), .B1(n622), .B2(
        DC_Comp_RED[2]), .Z(n605) );
  ND2M1S U787 ( .A(n606), .B(n605), .Z(n301) );
  AOI22M1S U788 ( .A1(n621), .A2(DC_Comp[1]), .B1(n620), .B2(DC_Comp_IR[1]), 
        .Z(n608) );
  AOI22M1S U789 ( .A1(n623), .A2(DC_Comp_temp[2]), .B1(n622), .B2(
        DC_Comp_RED[1]), .Z(n607) );
  ND2M1S U790 ( .A(n608), .B(n607), .Z(n302) );
  AOI22M1S U791 ( .A1(n621), .A2(DC_Comp[0]), .B1(n620), .B2(DC_Comp_IR[0]), 
        .Z(n610) );
  AOI22M1S U792 ( .A1(n623), .A2(DC_Comp_temp[1]), .B1(n622), .B2(
        DC_Comp_RED[0]), .Z(n609) );
  ND2M1S U793 ( .A(n610), .B(n609), .Z(n303) );
  NR2M3S U794 ( .A(n613), .B(n612), .Z(n615) );
  AO22M1SA U795 ( .A1(DC_right[6]), .A2(n614), .B1(DC_left[6]), .B2(n615), .Z(
        C1_Z_6) );
  AO22M1SA U796 ( .A1(DC_right[5]), .A2(n614), .B1(DC_left[5]), .B2(n615), .Z(
        C1_Z_5) );
  AO22M1SA U797 ( .A1(DC_right[4]), .A2(n614), .B1(DC_left[4]), .B2(n615), .Z(
        C1_Z_4) );
  AO22M1SA U798 ( .A1(DC_right[3]), .A2(n614), .B1(DC_left[3]), .B2(n615), .Z(
        C1_Z_3) );
  AO22M1SA U799 ( .A1(DC_right[2]), .A2(n614), .B1(DC_left[2]), .B2(n615), .Z(
        C1_Z_2) );
  AO22M1SA U800 ( .A1(DC_right[1]), .A2(n614), .B1(DC_left[1]), .B2(n615), .Z(
        C1_Z_1) );
  INVM1S U801 ( .A(n614), .Z(n618) );
  INVM1S U802 ( .A(n615), .Z(n616) );
  OAI22M1S U803 ( .A1(n619), .A2(n618), .B1(n617), .B2(n616), .Z(C1_Z_0) );
  AOI22M1S U804 ( .A1(n621), .A2(DC_Comp[5]), .B1(n620), .B2(DC_Comp_IR[5]), 
        .Z(n625) );
  AOI22M1S U805 ( .A1(n623), .A2(DC_Comp_temp[6]), .B1(n622), .B2(
        DC_Comp_RED[5]), .Z(n624) );
  ND2M1S U806 ( .A(n625), .B(n624), .Z(n298) );
  INVM1S U807 ( .A(n626), .Z(n627) );
  ND2B1M4S U808 ( .NA(red_on_flag[0]), .B(n627), .Z(n718) );
  OAI21M1S U809 ( .A1(Vppg[7]), .A2(n718), .B(temp_min[7]), .Z(n628) );
  ND2M1S U810 ( .A(n714), .B(n628), .Z(n305) );
  INVM1S U811 ( .A(n629), .Z(n638) );
  NR2M1S U812 ( .A(counter[0]), .B(n638), .Z(N397) );
  AOI211M1S U813 ( .A1(n692), .A2(n691), .B(n630), .C(n638), .Z(N398) );
  AOI211M1S U814 ( .A1(n696), .A2(n632), .B(n631), .C(n638), .Z(N400) );
  AOI211M1S U815 ( .A1(n700), .A2(n634), .B(n633), .C(n638), .Z(N402) );
  AOI211M1S U816 ( .A1(n704), .A2(n636), .B(n635), .C(n638), .Z(N404) );
  NR2M1S U817 ( .A(n754), .B(n639), .Z(n637) );
  AOI211M1S U818 ( .A1(n754), .A2(n639), .B(n638), .C(n637), .Z(N406) );
  AOI22M1S U819 ( .A1(n640), .A2(n753), .B1(red_on_flag[0]), .B2(n722), .Z(
        n642) );
  NR3B1M2S U820 ( .NA(n729), .B(n641), .C(n722), .Z(n725) );
  INVM1S U821 ( .A(n725), .Z(n727) );
  AOI32M1S U822 ( .A1(n642), .A2(n727), .A3(n689), .B1(n725), .B2(n753), .Z(
        n369) );
  NR2B1M1S U823 ( .NA(min_index[0]), .B(n690), .Z(intadd_0_CI) );
  INVM1S U824 ( .A(n643), .Z(n658) );
  ND2M1S U825 ( .A(n681), .B(Find_Setting), .Z(n644) );
  OAI22M1S U826 ( .A1(currentState[1]), .A2(n644), .B1(n751), .B2(n684), .Z(
        n648) );
  AOI21M1S U827 ( .A1(LED_RED), .A2(n645), .B(LED_IR), .Z(n680) );
  OAI31M1S U828 ( .A1(red_on_flag[0]), .A2(n680), .A3(n679), .B(n646), .Z(n647) );
  AOI211M1S U829 ( .A1(n723), .A2(n649), .B(n648), .C(n647), .Z(n652) );
  INVM1S U830 ( .A(n718), .Z(n719) );
  NR2M1S U831 ( .A(n719), .B(n650), .Z(n651) );
  ND2M1S U832 ( .A(n652), .B(n651), .Z(n653) );
  AO21M1SA U833 ( .A1(n655), .A2(n654), .B(n653), .Z(n656) );
  AOI21M2S U834 ( .A1(n658), .A2(n657), .B(n656), .Z(n683) );
  NR2M1S U835 ( .A(LED_RED), .B(n659), .Z(n676) );
  ND2B1M1S U836 ( .NA(n722), .B(n660), .Z(n661) );
  NR2M1S U837 ( .A(n676), .B(n661), .Z(n662) );
  AOI22M1S U838 ( .A1(LED_RED), .A2(PGA_Gain_IR[3]), .B1(PGA_Gain_RED[3]), 
        .B2(n753), .Z(n663) );
  MAOI22M1SA U839 ( .A1(PGA_Gain[3]), .A2(n665), .B1(n664), .B2(n663), .Z(n666) );
  OAI31M1S U840 ( .A1(PGA_Gain[3]), .A2(n670), .A3(n667), .B(n666), .Z(n367)
         );
  INVM1S U841 ( .A(PGA_Gain[0]), .Z(n733) );
  OAI221M1S U842 ( .A1(LED_RED), .A2(PGA_Gain_RED[0]), .B1(n753), .B2(
        PGA_Gain_IR[0]), .C(n673), .Z(n668) );
  OAI221M1S U843 ( .A1(PGA_Gain[0]), .A2(n670), .B1(n733), .B2(n669), .C(n668), 
        .Z(n348) );
  INVM1S U844 ( .A(PGA_Gain[1]), .Z(n734) );
  OAI21M1S U845 ( .A1(PGA_Gain[0]), .A2(n670), .B(n669), .Z(n671) );
  AOI32M1S U846 ( .A1(n672), .A2(n734), .A3(PGA_Gain[0]), .B1(PGA_Gain[1]), 
        .B2(n671), .Z(n675) );
  OAI221M1S U847 ( .A1(LED_RED), .A2(PGA_Gain_RED[1]), .B1(n753), .B2(
        PGA_Gain_IR[1]), .C(n673), .Z(n674) );
  ND2M1S U848 ( .A(n675), .B(n674), .Z(n346) );
  INVM1S U849 ( .A(n683), .Z(n685) );
  AOI22M1S U850 ( .A1(n683), .A2(nextState[0]), .B1(n676), .B2(n685), .Z(n677)
         );
  OAI31M1S U851 ( .A1(n680), .A2(n679), .A3(n678), .B(n677), .Z(n345) );
  AOI21M1S U852 ( .A1(LED_RED), .A2(n723), .B(n681), .Z(n686) );
  INVM1S U853 ( .A(nextState[1]), .Z(n682) );
  AOI32M1S U854 ( .A1(n686), .A2(n685), .A3(n684), .B1(n683), .B2(n682), .Z(
        n344) );
  MXB2M1SA U855 ( .A(n688), .B(n687), .S(CLK_Filter), .Z(n343) );
  ND2M3S U856 ( .A(n689), .B(n707), .Z(n708) );
  OAI22M1S U857 ( .A1(n691), .A2(n707), .B1(n690), .B2(n708), .Z(n340) );
  OAI22M1S U858 ( .A1(n693), .A2(n708), .B1(n692), .B2(n707), .Z(n339) );
  OAI22B10M1S U859 ( .NA2(max_index[2]), .A1(n708), .B1(n694), .B2(n707), .Z(
        n338) );
  OAI22M1S U860 ( .A1(n696), .A2(n707), .B1(n695), .B2(n708), .Z(n337) );
  OAI22M1S U861 ( .A1(n698), .A2(n708), .B1(n697), .B2(n707), .Z(n336) );
  OAI22M1S U862 ( .A1(n700), .A2(n707), .B1(n699), .B2(n708), .Z(n335) );
  OAI22M1S U863 ( .A1(n702), .A2(n708), .B1(n701), .B2(n707), .Z(n334) );
  OAI22M1S U864 ( .A1(n704), .A2(n707), .B1(n703), .B2(n708), .Z(n333) );
  OAI22M1S U865 ( .A1(n706), .A2(n707), .B1(n705), .B2(n708), .Z(n332) );
  OAI22M1S U866 ( .A1(n709), .A2(n708), .B1(n754), .B2(n707), .Z(n331) );
  INVM1S U867 ( .A(n714), .Z(n717) );
  AO221M1SA U868 ( .A1(n719), .A2(Vppg[0]), .B1(n718), .B2(temp_min[0]), .C(
        n717), .Z(n312) );
  OAI221M1S U869 ( .A1(n719), .A2(n711), .B1(n718), .B2(n710), .C(n714), .Z(
        n311) );
  AO221M1SA U870 ( .A1(n719), .A2(Vppg[2]), .B1(n718), .B2(temp_min[2]), .C(
        n717), .Z(n310) );
  OAI221M1S U871 ( .A1(n719), .A2(n713), .B1(n718), .B2(n712), .C(n714), .Z(
        n309) );
  AO221M1SA U872 ( .A1(n719), .A2(Vppg[4]), .B1(n718), .B2(temp_min[4]), .C(
        n717), .Z(n308) );
  OAI221M1S U873 ( .A1(n719), .A2(n716), .B1(n718), .B2(n715), .C(n714), .Z(
        n307) );
  AO221M1SA U874 ( .A1(n719), .A2(Vppg[6]), .B1(n718), .B2(temp_min[6]), .C(
        n717), .Z(n306) );
  AOI22M1S U875 ( .A1(n722), .A2(n721), .B1(n720), .B2(n724), .Z(n728) );
  ND2M1S U876 ( .A(n723), .B(LED_RED), .Z(n726) );
  AOI32M1S U877 ( .A1(n728), .A2(n727), .A3(n726), .B1(n725), .B2(n724), .Z(
        n304) );
  OAI21M2S U878 ( .A1(n731), .A2(n730), .B(n729), .Z(n735) );
  ND2M1S U879 ( .A(n732), .B(n735), .Z(n736) );
  INVM1S U880 ( .A(gaintemp_max[0]), .Z(n737) );
  OAI22M1S U881 ( .A1(n733), .A2(n736), .B1(n735), .B2(n737), .Z(n274) );
  INVM1S U882 ( .A(gaintemp_max[1]), .Z(n738) );
  OAI22M1S U883 ( .A1(n734), .A2(n736), .B1(n735), .B2(n738), .Z(n273) );
  INVM1S U884 ( .A(gaintemp_max[2]), .Z(n739) );
  OAI22B10M1S U885 ( .NA2(PGA_Gain[2]), .A1(n736), .B1(n735), .B2(n739), .Z(
        n272) );
  INVM1S U886 ( .A(gaintemp_max[3]), .Z(n742) );
  OAI22B10M1S U887 ( .NA2(PGA_Gain[3]), .A1(n736), .B1(n735), .B2(n742), .Z(
        n271) );
  MOAI22M1SA U888 ( .A1(n737), .A2(n741), .B1(n740), .B2(PGA_Gain_RED[0]), .Z(
        n252) );
  MOAI22M1SA U889 ( .A1(n738), .A2(n741), .B1(n740), .B2(PGA_Gain_RED[1]), .Z(
        n251) );
  MOAI22M1SA U890 ( .A1(n739), .A2(n741), .B1(n740), .B2(PGA_Gain_RED[2]), .Z(
        n250) );
  MOAI22M1SA U891 ( .A1(n742), .A2(n741), .B1(n740), .B2(PGA_Gain_RED[3]), .Z(
        n248) );
endmodule
