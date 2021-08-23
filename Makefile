TESTDIR := test-io
SRCDIR := src
TARGETS := $(shell basename --suffix=.cpp -- src/*.cpp)
TESTSUBJECTS := $(addsuffix .test, $(shell basename --suffix=.cpp -- src/*.cpp))

CFLAGS := -g -O3 -Wall -Wextra -std=c++11

all: $(TARGETS)

ConcatRemoveTest: src/ConcatRemoveTest.cpp src/ConcatRemove.cpp
	g++ -o ConcatRemoveTest $(CFLAGS)  $? -DTESTING

%: src/%.cpp
	g++ $(CFLAGS) -o $@ $<

test-all: $(TESTSUBJECTS)

%.test: % $(TESTDIR)/%.in $(TESTDIR)/%.out
	./$< < $(word 2, $?) | diff - $(word 3, $?) && \
	echo "\n\033[0;32m$@ passed\033[0m\n" || echo -e "\n\033[0;31m$@ failed. :(\033[0m\n"

clean:
	rm -rf $(TARGETS) *.o