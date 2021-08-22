TESTDIR := test-io
SRCDIR := src
TARGETS := FooBaa ConcatRemove ConcatRemoveTest
TESTSUBJECTS := $(addsuffix .test, $(shell basename --suffix=.cpp -- src/*.cpp))

CFLAGS := -g -O3 -Wall -Wextra -std=c++11

FooBaa: src/FooBaa.cpp
	g++ $(CFLAGS) -o FooBaa src/FooBaa.cpp

ConcatRemove: src/ConcatRemove.cpp
	g++ $(CFLAGS) -o ConcatRemove src/ConcatRemove.cpp

ConcatRemoveTest: src/ConcatRemoveTest.cpp
	g++ $(CFLAGS) -o ConcatRemoveTest src/ConcatRemoveTest.cpp

test-all: $(TESTSUBJECTS)
	echo $(TESTSUBJECTS)

%.test: % $(TESTDIR)/%.in $(TESTDIR)/%.out
	./$< < $(word 2, $?) | diff - $(word 3, $?) && \
	echo "$@ passed" || echo "$@ failed. :("

clean:
	rm -rf $(TARGETS)