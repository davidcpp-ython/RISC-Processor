# **🚀 RISC Processor Project**

## **📝 Overview**
This project implements a simple **RISC (Reduced Instruction Set Computer) processor** without pipelining. The processor operates with **32-bit instructions** and **16-bit data**. The design includes key components such as:

- 🧮 **ALU (Arithmetic Logic Unit)**  
- 📜 **Register File (16 registers, 16-bit each)**  
- 🎯 **Program Counter (PC)**  
- ⚙️ **Control Units for Instruction Execution**  

The processor executes instructions stored in instruction memory and interacts with a data memory module.

This project is implemented using **🛠️ Vivado** for **RTL synthesis and schematics**, and the design is written in **📜 SystemVerilog** syntax.

---

## **📖 Instruction Set Architecture (ISA)**
The processor supports **16 different instructions**, each encoded in **32 bits** with the following format:

| **Field**  | **Bits** | **Description** |
|------------|---------|----------------|
| **🎯 Opcode**  | 4 bits  | Operation Code |
| **📍 Dest Addr** | 4 bits | Destination Register |
| **🔢 Operand0 Addr** | 4 bits | First Operand Register |
| **🔢 Operand1 Addr** | 4 bits | Second Operand Register |
| **📦 Immediate Value** | 16 bits | Immediate or Jump Address |

---

## **🛠️ Supported Instructions**
| **Opcode** | **Instruction** | **Operation** |
|------------|----------------|---------------|
| `0`  | **NOP**  | No operation |
| `1`  | **ADD**  | `R[dest] = R[op0] + R[op1]` |
| `2`  | **SUB**  | `R[dest] = R[op0] - R[op1]` |
| `3`  | **MULT**  | `R[dest] = R[op0] * R[op1]` |
| `4`  | **SHIFT RIGHT**  | `R[dest] = R[op1] >> 1` |
| `6`  | **AND**  | `R[dest] = R[op0] & R[op1]` |
| `7`  | **OR**  | `R[dest] = R[op0] | R[op1]` |
| `8`  | **XOR**  | `R[dest] = R[op0] ^ R[op1]` |
| `10` | **VALUE LOAD**  | `R[dest] = immediate` |
| `11` | **JUMP**  | `PC = immediate` |
| `12` | **JUMP IF ZERO**  | `if Z_flag: PC = immediate` |
| `13` | **STORE (WRITE MEM)**  | `mem[R[op1]] = R[op0]` |
| `14` | **LOAD (READ MEM)**  | `R[dest] = mem[R[op0]]` |
| `15` | **HALT**  | Stop execution |

---

## **💾 Memory Organization**
- **🗂️ Instruction Memory**: 256 locations, each 32-bit wide.
- **📀 Data Memory**: 65,536 locations, each 16-bit wide.

Instructions are pre-loaded into instruction memory using an **initial block** in the testbench.

---

## **🧪 Testing**
The processor is verified using a **testbench** that initializes instruction memory with a simple program performing arithmetic and logical operations, followed by a conditional jump and halt.

---
