SRC = src
BUILD = build
TEST =  tests

all:
	mkdir -p $(BUILD)
	cmake -S $(SRC) -B $(BUILD)
	make -C $(BUILD)

run: all
	cd $(BUILD) && \
	for f in ../$(TEST)/*.c; do \
		clang -O0 -emit-llvm -S $$f; \
	done && \
	for f in *.ll; do \
		printf "\n\n\n$$f\n\n" && \
		opt \
			-load-pass-plugin ./libSimplePass.so \
			-passes=Simple-Pass \
			$$f \
			-disable-output; \
	done


clean:
	rm -rf $(BUILD)

.PHONY: all run clean
