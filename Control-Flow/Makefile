TOP = testrunner
SRC = src/*.sv
BUILD = obj_dir

TEST ?= pass

all:
	verilator --binary -j 0 -Wall \
		--top-module $(TOP) \
		-GMEMFILE=\"tests/$(TEST).mem\" \
		$(SRC)

run: all
	./$(BUILD)/V$(TOP)

all_tests:
	$(MAKE) run TEST=pass
	$(MAKE) run TEST=fail
	$(MAKE) run TEST=idle
	$(MAKE) run TEST=error

clean:
	rm -rf $(BUILD) *.vcd

.PHONY: all run all_tests clean
