# AHB to APB Bridge – Verilog Implementation

## 📌 Project Objective

This project implements an **AHB to APB Bridge** in Verilog using Vivado. The goal is to design, simulate, and verify a bridge that connects a high-performance AHB master to low-power APB peripherals, ensuring protocol compliance and correct data transfer.

---

## 🔄 AHB & APB Protocol Overview

### AHB (Advanced High-performance Bus)
- Pipelined, burst-capable, high-speed bus.
- Signals: `HADDR`, `HWRITE`, `HTRANS`, `HWDATA`, `HRDATA`, `HREADY`, `HRESP`.

### APB (Advanced Peripheral Bus)
- Simple, low-power, non-pipelined bus.
- Signals: `PADDR`, `PWRITE`, `PENABLE`, `PSEL`, `PWDATA`, `PRDATA`, `PREADY`.

---

## 🧱 Block Diagram Description

The system includes:
- AHB Slave Interface
- FSM-based APB Controller
- Dummy APB Peripheral Interface
- Bridge Top module
- AHB Master Testbench for verification

---

## 🧠 Design Details

### FSM States:
- `ST_IDLE`: Wait for valid AHB transfer
- `ST_READ`: Setup phase for APB read
- `ST_WRITE`: Setup phase for APB write
- `ST_WWAIT`: Wait for write data
- `ST_WENABLE`: Enable phase for write
- `ST_RENABLE`: Enable phase for read
- `ST_WRITEP`, `ST_WENABLEP`: Pipelined write support

### Modules:
- `AHB_M.v`: AHB master generator
- `AHB_slave_interface.v`
- `APB_controller.v`
- `APB_interface.v`
- `Bridge_top.v`
- `tb.v`: Testbench with waveform monitoring

---

## 🔁 Transaction Phases Explained

- **Transfer Phase**: AHB master initiates with `HTRANS`, `HWRITE`, `HADDR`, `HWDATA`
- **Address Phase**: AHB slave decodes address and forwards to APB controller
- **Response Phase**: APB controller manages `PSEL`, `PENABLE`, `PWRITE`, and returns `PRDATA`

The bridge ensures:
- `HREADYOUT` stalls AHB when APB is busy
- `HRESP` always returns OKAY
- `PRDATA` is valid during the enable phase of APB read

---

## 📷 Waveform Snapshots

*(Add images in your doc/ folder and reference them here)*

- ✅ Single Write
- ✅ Single Read
- ✅ Burst Write

---

## 🛠️ Tools Used

- Vivado 2022.2 (XSim)
- Verilog HDL
- GTKWave (optional)

---

## ✅ Project Status

- [x] RTL Design Complete
- [x] Simulation Verified
- [x] Protocol Compliant
- [x] Debugged and Documented

---

## 🛠️ Debug Log & Fix Summary

🔧 1. **Port Redeclaration Error**  
Fixed redeclaration of `pwrite_out` in `APB_interface.v`.

🔧 2. **Signal Name Mismatch**  
Declared missing signal `Hwritereg1` in `Bridge_top.v`.

🔧 3. **Clock Signal Inconsistency**  
Unified naming from `Hclk` to `hclk` across modules.

🔧 4. **Missing APB Enable Phase**  
FSM updated to correctly assert `penable_temp` in `ST_WENABLE`, `ST_WENABLEP`, and `ST_RENABLE`.

🔧 5. **Incorrect Read Data Timing**  
`PRDATA` was not returned during the enable phase; fixed in `APB_interface.v`.

🔧 6. **FSM Timing Misalignment**  
Ensured FSM phases match one clock cycle, outputs synchronized properly.

🔧 7. **Simulation Launch Failure**  
Fixed compilation errors from earlier bugs.

🔧 8. **Waveform Signal Absence**  
Corrected testbench to include monitored signals.

✅ **Outcome**  
- Simulation ran successfully  
- Waveforms validated protocol behavior  
- FSM transitions aligned  
- Read/Write transactions verified  
- Burst and pipelined transfers worked

---

## 👨‍💻 Author

**Jaideep Patel**  
BTech in Electronics and Communication  
VLSI Design Intern @ Maven Silicon  
GitHub: [182004jaideep](https://github.com/182004jaideep)  
LinkedIn:[(https://www.linkedin.com/in/jaideep-patel-8113ab247/)](https://www.linkedin.com/in/jaideep-patel-8113ab247/)
