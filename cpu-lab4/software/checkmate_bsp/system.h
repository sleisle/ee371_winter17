/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_qsys_0' in SOPC Builder design 'nios_system_checkersv3'
 * SOPC Builder design path: ../../nios_system_checkersv3.sopcinfo
 *
 * Generated: Wed Mar 08 13:42:18 PST 2017
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00040820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x13
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00020020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x13
#define ALT_CPU_NAME "nios2_qsys_0"
#define ALT_CPU_RESET_ADDR 0x00020000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00040820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x13
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00020020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x13
#define NIOS2_RESET_ADDR 0x00020000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_NIOS2_QSYS


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x41130
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x41130
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x41130
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios_system_checkersv3"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x41130
#define JTAG_UART_0_IRQ 5
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * newData configuration
 *
 */

#define ALT_MODULE_CLASS_newData altera_avalon_pio
#define NEWDATA_BASE 0x41100
#define NEWDATA_BIT_CLEARING_EDGE_REGISTER 0
#define NEWDATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define NEWDATA_CAPTURE 0
#define NEWDATA_DATA_WIDTH 8
#define NEWDATA_DO_TEST_BENCH_WIRING 0
#define NEWDATA_DRIVEN_SIM_VALUE 0
#define NEWDATA_EDGE_TYPE "NONE"
#define NEWDATA_FREQ 50000000
#define NEWDATA_HAS_IN 1
#define NEWDATA_HAS_OUT 0
#define NEWDATA_HAS_TRI 0
#define NEWDATA_IRQ -1
#define NEWDATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define NEWDATA_IRQ_TYPE "NONE"
#define NEWDATA_NAME "/dev/newData"
#define NEWDATA_RESET_VALUE 0
#define NEWDATA_SPAN 16
#define NEWDATA_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x20000
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "nios_system_checkersv3_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 131072
#define ONCHIP_MEMORY2_0_SPAN 131072
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * receiveState configuration
 *
 */

#define ALT_MODULE_CLASS_receiveState altera_avalon_pio
#define RECEIVESTATE_BASE 0x41110
#define RECEIVESTATE_BIT_CLEARING_EDGE_REGISTER 0
#define RECEIVESTATE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define RECEIVESTATE_CAPTURE 0
#define RECEIVESTATE_DATA_WIDTH 8
#define RECEIVESTATE_DO_TEST_BENCH_WIRING 0
#define RECEIVESTATE_DRIVEN_SIM_VALUE 0
#define RECEIVESTATE_EDGE_TYPE "NONE"
#define RECEIVESTATE_FREQ 50000000
#define RECEIVESTATE_HAS_IN 1
#define RECEIVESTATE_HAS_OUT 0
#define RECEIVESTATE_HAS_TRI 0
#define RECEIVESTATE_IRQ -1
#define RECEIVESTATE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RECEIVESTATE_IRQ_TYPE "NONE"
#define RECEIVESTATE_NAME "/dev/receiveState"
#define RECEIVESTATE_RESET_VALUE 0
#define RECEIVESTATE_SPAN 16
#define RECEIVESTATE_TYPE "altera_avalon_pio"


/*
 * row1 configuration
 *
 */

#define ALT_MODULE_CLASS_row1 altera_avalon_pio
#define ROW1_BASE 0x41000
#define ROW1_BIT_CLEARING_EDGE_REGISTER 0
#define ROW1_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW1_CAPTURE 0
#define ROW1_DATA_WIDTH 32
#define ROW1_DO_TEST_BENCH_WIRING 0
#define ROW1_DRIVEN_SIM_VALUE 0
#define ROW1_EDGE_TYPE "NONE"
#define ROW1_FREQ 50000000
#define ROW1_HAS_IN 1
#define ROW1_HAS_OUT 1
#define ROW1_HAS_TRI 0
#define ROW1_IRQ -1
#define ROW1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW1_IRQ_TYPE "NONE"
#define ROW1_NAME "/dev/row1"
#define ROW1_RESET_VALUE 0
#define ROW1_SPAN 32
#define ROW1_TYPE "altera_avalon_pio"


/*
 * row2 configuration
 *
 */

#define ALT_MODULE_CLASS_row2 altera_avalon_pio
#define ROW2_BASE 0x41020
#define ROW2_BIT_CLEARING_EDGE_REGISTER 0
#define ROW2_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW2_CAPTURE 0
#define ROW2_DATA_WIDTH 32
#define ROW2_DO_TEST_BENCH_WIRING 0
#define ROW2_DRIVEN_SIM_VALUE 0
#define ROW2_EDGE_TYPE "NONE"
#define ROW2_FREQ 50000000
#define ROW2_HAS_IN 1
#define ROW2_HAS_OUT 1
#define ROW2_HAS_TRI 0
#define ROW2_IRQ -1
#define ROW2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW2_IRQ_TYPE "NONE"
#define ROW2_NAME "/dev/row2"
#define ROW2_RESET_VALUE 0
#define ROW2_SPAN 32
#define ROW2_TYPE "altera_avalon_pio"


/*
 * row3 configuration
 *
 */

#define ALT_MODULE_CLASS_row3 altera_avalon_pio
#define ROW3_BASE 0x41040
#define ROW3_BIT_CLEARING_EDGE_REGISTER 0
#define ROW3_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW3_CAPTURE 0
#define ROW3_DATA_WIDTH 32
#define ROW3_DO_TEST_BENCH_WIRING 0
#define ROW3_DRIVEN_SIM_VALUE 0
#define ROW3_EDGE_TYPE "NONE"
#define ROW3_FREQ 50000000
#define ROW3_HAS_IN 1
#define ROW3_HAS_OUT 1
#define ROW3_HAS_TRI 0
#define ROW3_IRQ -1
#define ROW3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW3_IRQ_TYPE "NONE"
#define ROW3_NAME "/dev/row3"
#define ROW3_RESET_VALUE 0
#define ROW3_SPAN 32
#define ROW3_TYPE "altera_avalon_pio"


/*
 * row4 configuration
 *
 */

#define ALT_MODULE_CLASS_row4 altera_avalon_pio
#define ROW4_BASE 0x41060
#define ROW4_BIT_CLEARING_EDGE_REGISTER 0
#define ROW4_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW4_CAPTURE 0
#define ROW4_DATA_WIDTH 32
#define ROW4_DO_TEST_BENCH_WIRING 0
#define ROW4_DRIVEN_SIM_VALUE 0
#define ROW4_EDGE_TYPE "NONE"
#define ROW4_FREQ 50000000
#define ROW4_HAS_IN 1
#define ROW4_HAS_OUT 1
#define ROW4_HAS_TRI 0
#define ROW4_IRQ -1
#define ROW4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW4_IRQ_TYPE "NONE"
#define ROW4_NAME "/dev/row4"
#define ROW4_RESET_VALUE 0
#define ROW4_SPAN 32
#define ROW4_TYPE "altera_avalon_pio"


/*
 * row5 configuration
 *
 */

#define ALT_MODULE_CLASS_row5 altera_avalon_pio
#define ROW5_BASE 0x41080
#define ROW5_BIT_CLEARING_EDGE_REGISTER 0
#define ROW5_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW5_CAPTURE 0
#define ROW5_DATA_WIDTH 32
#define ROW5_DO_TEST_BENCH_WIRING 0
#define ROW5_DRIVEN_SIM_VALUE 0
#define ROW5_EDGE_TYPE "NONE"
#define ROW5_FREQ 50000000
#define ROW5_HAS_IN 1
#define ROW5_HAS_OUT 1
#define ROW5_HAS_TRI 0
#define ROW5_IRQ -1
#define ROW5_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW5_IRQ_TYPE "NONE"
#define ROW5_NAME "/dev/row5"
#define ROW5_RESET_VALUE 0
#define ROW5_SPAN 32
#define ROW5_TYPE "altera_avalon_pio"


/*
 * row6 configuration
 *
 */

#define ALT_MODULE_CLASS_row6 altera_avalon_pio
#define ROW6_BASE 0x410a0
#define ROW6_BIT_CLEARING_EDGE_REGISTER 0
#define ROW6_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW6_CAPTURE 0
#define ROW6_DATA_WIDTH 32
#define ROW6_DO_TEST_BENCH_WIRING 0
#define ROW6_DRIVEN_SIM_VALUE 0
#define ROW6_EDGE_TYPE "NONE"
#define ROW6_FREQ 50000000
#define ROW6_HAS_IN 1
#define ROW6_HAS_OUT 1
#define ROW6_HAS_TRI 0
#define ROW6_IRQ -1
#define ROW6_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW6_IRQ_TYPE "NONE"
#define ROW6_NAME "/dev/row6"
#define ROW6_RESET_VALUE 0
#define ROW6_SPAN 32
#define ROW6_TYPE "altera_avalon_pio"


/*
 * row7 configuration
 *
 */

#define ALT_MODULE_CLASS_row7 altera_avalon_pio
#define ROW7_BASE 0x410c0
#define ROW7_BIT_CLEARING_EDGE_REGISTER 0
#define ROW7_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW7_CAPTURE 0
#define ROW7_DATA_WIDTH 32
#define ROW7_DO_TEST_BENCH_WIRING 0
#define ROW7_DRIVEN_SIM_VALUE 0
#define ROW7_EDGE_TYPE "NONE"
#define ROW7_FREQ 50000000
#define ROW7_HAS_IN 1
#define ROW7_HAS_OUT 1
#define ROW7_HAS_TRI 0
#define ROW7_IRQ -1
#define ROW7_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW7_IRQ_TYPE "NONE"
#define ROW7_NAME "/dev/row7"
#define ROW7_RESET_VALUE 0
#define ROW7_SPAN 32
#define ROW7_TYPE "altera_avalon_pio"


/*
 * row8 configuration
 *
 */

#define ALT_MODULE_CLASS_row8 altera_avalon_pio
#define ROW8_BASE 0x410e0
#define ROW8_BIT_CLEARING_EDGE_REGISTER 0
#define ROW8_BIT_MODIFYING_OUTPUT_REGISTER 1
#define ROW8_CAPTURE 0
#define ROW8_DATA_WIDTH 32
#define ROW8_DO_TEST_BENCH_WIRING 0
#define ROW8_DRIVEN_SIM_VALUE 0
#define ROW8_EDGE_TYPE "NONE"
#define ROW8_FREQ 50000000
#define ROW8_HAS_IN 1
#define ROW8_HAS_OUT 1
#define ROW8_HAS_TRI 0
#define ROW8_IRQ -1
#define ROW8_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROW8_IRQ_TYPE "NONE"
#define ROW8_NAME "/dev/row8"
#define ROW8_RESET_VALUE 0
#define ROW8_SPAN 32
#define ROW8_TYPE "altera_avalon_pio"


/*
 * sendState configuration
 *
 */

#define ALT_MODULE_CLASS_sendState altera_avalon_pio
#define SENDSTATE_BASE 0x41120
#define SENDSTATE_BIT_CLEARING_EDGE_REGISTER 0
#define SENDSTATE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SENDSTATE_CAPTURE 0
#define SENDSTATE_DATA_WIDTH 8
#define SENDSTATE_DO_TEST_BENCH_WIRING 0
#define SENDSTATE_DRIVEN_SIM_VALUE 0
#define SENDSTATE_EDGE_TYPE "NONE"
#define SENDSTATE_FREQ 50000000
#define SENDSTATE_HAS_IN 0
#define SENDSTATE_HAS_OUT 1
#define SENDSTATE_HAS_TRI 0
#define SENDSTATE_IRQ -1
#define SENDSTATE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SENDSTATE_IRQ_TYPE "NONE"
#define SENDSTATE_NAME "/dev/sendState"
#define SENDSTATE_RESET_VALUE 0
#define SENDSTATE_SPAN 16
#define SENDSTATE_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
