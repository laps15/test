#include <iostream>
#include <string>

#define max(a,b) ((a>b)?(a):(b))
#define min(a,b) ((a<b)?(a):(b))

using namespace std;

int get_equal_prefix_length(string &a, string &b) {
    int min_len = min(a.length(), b.length());
    int prefix_size = 0;

    while (a[prefix_size] == b[prefix_size] && prefix_size++ < min_len);

    return prefix_size;
}

int get_diff(string &s, string &t) {
    int prefix_size = get_equal_prefix_length(s,t);

    return (s.length()-prefix_size)+(t.length()-prefix_size);
}


int main() {
    string s, t;
    int k;

    while (cin >> s >> t >> k) {
        int diff = get_diff(s,t);

        if (diff <= k) {
            cout << "yes" << endl;
        } else {
            cout << "no" << endl;
        }
    }

    return 0;
}