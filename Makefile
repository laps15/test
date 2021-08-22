TESTDIR := test-io
SRCDIR := src
TESTSUBJECTS := $(addsuffix .test, $(shell basename --suffix=.cpp -- src/*.cpp))


FooBaa: src/FooBaa.cpp
	g++ -Wall -Wextra -o FooBaa src/FooBaa.cpp

test-all: $(TESTSUBJECTS)
	echo $(TESTSUBJECTS)

%.test: % $(TESTDIR)/%.in $(TESTDIR)/%.out
	./$< < $(word 2, $?) | diff - $(word 3, $?) && \
	echo "$@ passed" || echo "$@ failed. :("

all: FooBaa

clean:
	rm -rf FooBaa