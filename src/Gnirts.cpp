#include <iostream>
#include <string>

int strlenght(std::string s, int len = 0) {
    if (s[len] == 10 || !s[len]) {
        return len;
    }
    return strlenght(s, len+1);
}

void gnirts(std::string &s, int end, int start = 0) {
    if (end <= start) {
        return;
    }
    s[start] += s[end];
    s[end] = s[start] - s[end];
    s[start] = s[start] - s[end];
    return gnirts(s, end-1, start+1);
}

int main() {
    std::string s;
    while (std::getline(std::cin, s)) {
        gnirts(s, strlenght(s)-1);
        std::cout << s << std::endl;
    }

    return 0;
}