#include <iostream>
#include <string>

#include "lib/ConcatRemove.h"

#define max(a,b) ((a>b)?(a):(b))
#define min(a,b) ((a<b)?(a):(b))

using namespace std;

int ConcatRemove::get_equal_prefix_length(string &a, string &b) {
    int min_len = min(a.length(), b.length());
    int prefix_size = 0;

    while (a[prefix_size] == b[prefix_size] && prefix_size++ < min_len);

    return prefix_size;
}

int ConcatRemove::get_diff(string &s, string &t) {
    int prefix_size = get_equal_prefix_length(s,t);

    return (s.length()-prefix_size)+(t.length()-prefix_size);
}

const string ConcatRemove::concat_remove(string &s, string &t, int k) {
    int diff = get_diff(s,t);

    if (diff <= k) {
        return "yes";
    }
    return"no";
}

#ifndef TESTING
int main() {
    string s, t;
    int k;

    while (cin >> s >> t >> k) {
        cout << ConcatRemove::concat_remove(s, t, k) << endl;
    }

    return 0;
}
#endif
