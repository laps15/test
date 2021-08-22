#include <iostream>
#include <string>

using namespace std;

// CAUTION: By not using the limit argument, this method will not halt when a non-null-terminated string is given.
// The limit parameter is optional but not using it may cause security issues on thwe family of Buffer overflow.
int string_lenght(const char *s, int limit = -1) {
    int lenght = 0;

    while(s[lenght++] && (limit < 0 || lenght <= limit));

    return lenght-1;
}

int main() {
    string s;

    while (getline(cin, s)) {
        cout << string_lenght(s.c_str(), 200) << endl;
    }

    return 0;
}