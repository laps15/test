FooBaa: src/FooBaa.cpp
	g++ -Wall -Wextra -o FooBaa src/FooBaa.cpp

all: FooBaa

clean:
	rm -rf FooBaa