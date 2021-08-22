#include <iostream>
#include <string>

using namespace std;

int main() {
    int k = 100;

    for (int i = 1; i<= k; i++) {
        if (!(i%15)) {
            cout << "FooBaa";
        } else if (!(i%3)) {
            cout << "Foo";
        } else if (!(i%5)) {
            cout << "Baa";
        } else {
            cout << i;
        }
        cout << endl;
    }
    return 0;
}