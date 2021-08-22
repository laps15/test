TESTDIR := test-io
SRCDIR := src
TARGETS := $(shell basename --suffix=.cpp -- src/*.cpp)
TESTSUBJECTS := $(addsuffix .test, $(shell basename --suffix=.cpp -- src/*.cpp))

CFLAGS := -g -O3 -Wall -Wextra -std=c++11

all: $(TARGETS)

FooBaa: src/FooBaa.cpp
	g++ $(CFLAGS) -o FooBaa src/FooBaa.cpp

ConcatRemove: src/ConcatRemove.cpp
	g++ $(CFLAGS) -o ConcatRemove src/ConcatRemove.cpp

ConcatRemoveTest: src/ConcatRemoveTest.cpp
	g++ -c -o ConcatRemove.o src/ConcatRemove.cpp -DTESTING
	g++ $(CFLAGS) -o ConcatRemoveTest ConcatRemove.o src/ConcatRemoveTest.cpp

StringLenght: src/StringLenght.cpp
	g++ $(CFLAGS) -o StringLenght src/StringLenght.cpp

test-all: $(TESTSUBJECTS)
	echo $(TESTSUBJECTS)

%.test: % $(TESTDIR)/%.in $(TESTDIR)/%.out
	./$< < $(word 2, $?) | diff - $(word 3, $?) && \
	echo "$@ passed" || echo "$@ failed. :("

clean:
	rm -rf $(TARGETS) *.o