TESTDIR := test-io
SRCDIR := src
TARGETS := FooBaa ConcatRemove
TESTSUBJECTS := $(addsuffix .test, $(shell basename --suffix=.cpp -- src/*.cpp))


FooBaa: src/FooBaa.cpp
	g++ -Wall -Wextra -o FooBaa src/FooBaa.cpp

ConcatRemove: src/ConcatRemove.cpp
	g++ -Wall -Wextra -o ConcatRemove src/ConcatRemove.cpp

test-all: $(TESTSUBJECTS)
	echo $(TESTSUBJECTS)

%.test: % $(TESTDIR)/%.in $(TESTDIR)/%.out
	./$< < $(word 2, $?) | diff - $(word 3, $?) && \
	echo "$@ passed" || echo "$@ failed. :("

clean:
	rm -rf $(TARGETS)