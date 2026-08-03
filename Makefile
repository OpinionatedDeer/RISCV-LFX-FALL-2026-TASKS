all:
	cd Control-Flow && \
		make clean
	tar cvf Control-Flow.tar Control-Flow
	cd Data-Flow && \
		make clean
	tar cvf Data-Flow.tar Data-Flow

clean:
	rm *.tar
