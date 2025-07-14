#  Configurable LFSR Peripheral (RTL to GDSII)

This project implements a **4-bit configurable LFSR-based pseudo-random number generator** as a **memory-mapped AXI-Lite peripheral**, taken from **Verilog RTL all the way to GDSII** using open-source tools like **Yosys**, **OpenLane**, **Magic**, and **KLayout**.

---

##  Features

- Written in **Verilog** and wrapped with a **lightweight AXI-Lite interface**
- Supports:
  - Runtime configurable **SEED**
  - Programmable **TAPS**
  - Control register for **load/enable/reset**
  - Live **LFSR output** register
- Parameterized RTL (scalable up to 32-bit)
- Tested using both **Verilog testbench** and **Cocotb** (Python-based)
- Synthesized with **Yosys**, placed and routed with **OpenLane**
- Final GDSII validated with **Magic** and **KLayout**

---

## 🛠 Toolchain

| Tool       | Purpose                     |
|------------|-----------------------------|
| Verilog    | RTL Design                  |
| Cocotb     | Python-based Testbench      |
| Yosys      | Logic Synthesis             |
| OpenSTA    | Static Timing Analysis      |
| OpenLane   | Floorplanning to Routing    |
| Magic      | DRC / Layout View           |
| KLayout    | Final GDS Viewing           |
| Sky130 PDK | Open-source Process Library |

---

