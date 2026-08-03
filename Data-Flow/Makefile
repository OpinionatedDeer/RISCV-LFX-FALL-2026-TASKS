SRC = src
BUILD = build

all:
	mkdir -p $(BUILD)
	cmake -S $(SRC) -B $(BUILD)
	make -C $(BUILD)

run:
	echo $(SRC)

clean:
	rm -rf $(BUILD)
	rm -r 

.PHONY: all run clean
