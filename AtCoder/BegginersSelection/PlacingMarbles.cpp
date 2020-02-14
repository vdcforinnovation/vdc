#include <iostream>
using namespace std;
 
int main()
{
    int a;
    int s1, s2, s3;
 
    cin >> a;
 
    s1 = a / 100;
 
    s2 = (a - s1 * 100) / 10;
 
    s3 = (a - s1 * 100 - s2 * 10);
 
    int total;
    total = s1 + s2 + s3;
 
    cout << total << endl;
 
    return 0;
 
}