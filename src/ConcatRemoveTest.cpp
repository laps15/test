#include <iostream>
#include <string>
#include <cassert>

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

const string concat_remove(string &s, string &t, int k) {
    int diff = get_diff(s,t);

    if (diff <= k) {
        return "yes";
    }
    return"no";
}

int main() {
    string test_cases[][4] = {
        {
            string("blablablabla"),
            string("blablabcde"),
            string("8"),
            string("yes"),
        },
        {
            string("blablablabla"),
            string("blablabcde"),
            string("1"),
            string("no"),
        },
        {
            string("blablablabla"),
            string("blablablabla"),
            string("0"),
            string("yes"),
        },
        {
            string("thisstringisreallylong"),
            string("thisisnt"),
            string("14"),
            string("no"),
        },
        {
            string("thisstringisreallylong"),
            string("thisisnt"),
            string("15"),
            string("no"),
        },
        {
            string("thisstringisreallylong"),
            string("thisisnt"),
            string("23"),
            string("yes"),
        },
        {
            string("1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"),
            string("1"),
            string("99"), 
            string("yes"),
        },
        {
            string("2"),
            string("1"),
            string("2"), 
            string("yes"),
        },
    };

    int test_case_index= 0;
    for (auto test_case:test_cases) {
        string s = test_case[0];
        string t = test_case[1];
        int k = stoi(test_case[2]);
        string expected_output = test_case[3];

        string output = concat_remove(test_case[0], test_case[1], k);
        if (expected_output != output) {
            cout << "Error on test case #" << test_case_index << endl;
            cout << "\tFailed asserting that function returns expected value: " << expected_output << " returned " << output << " instead." << endl;
        }
        assert(expected_output == output);

        test_case_index++;
    }

    cout << "All test cases passed." << endl;
    return 0;
}