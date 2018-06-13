BIN=hello_mpi
MPICC?=mpicc

all: ${BIN}

hello_mpi: hello_mpi.c
	${MPICC} -o hello_mpi hello_mpi.c

clean:
	rm ${BIN}
