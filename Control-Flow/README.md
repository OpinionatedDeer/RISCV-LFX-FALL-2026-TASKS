### This is my solution for the Coding Challenge

# Assumptions

- I built this fsm according to idea i had after reading the Coding Challenge/
- [Core Idea](2026-07-30-12-49-27-834.jpg)
- Sources used to learn SystemVerilog [Sources](Sources.md)/

# How to run

- Compile the files `make`.
- Run all tests `make all_tests`.
- Run `make run TEST="Test Name"` , replace `Test Name` with file name.
- If adding new or updating the mem files, please change the time before $finish in (src/testrunner.sv).
# Package Used

Verilator 5.050 2026-07-01 rev vUNKNOWN-built20260730
From sci-electronics/verilator ebuild Gentoo.
