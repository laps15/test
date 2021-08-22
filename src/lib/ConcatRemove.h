#ifndef __CONCATREMOVE__
#define __CONCATREMOVE__

#include <string>

#define max(a,b) ((a>b)?(a):(b))
#define min(a,b) ((a<b)?(a):(b))

using namespace std;

class ConcatRemove {
    public:
    const string static concat_remove(string &s, string &t, int k);


    private:
    int static get_equal_prefix_length(string &a, string &b);

    int static get_diff(string &s, string &t);
};

#endif