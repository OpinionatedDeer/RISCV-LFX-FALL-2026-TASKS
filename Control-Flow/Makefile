RUN = demo
SRC = src/*
BUILD = obj_dir


all:
	verilator --binary -j 0 -Wall $(SRC)

run: all
	./$(BUILD)/V$(RUN)

clean:
	rm -rf $(BUILD) *.vcd

.PHONY: all run clean


	# verilator --binary -j 0 -Wall \
		--top-module $(TOP) \
		$(SRC)
