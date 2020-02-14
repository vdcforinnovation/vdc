#include <iostream>
using namespace std;
 
int main()
{
    int N,A,B;
    int i;
    int sum = 0;
    int s1,s2,s3,s4,s5;

    cin >> N >> A >> B;
 
for (i = 0; i <= N; i++) {
  
    s1 =   i / 10000;
    s2 = ( i - s1 * 10000 ) / 1000;
    s3 = ( i - s1 * 10000 - s2 * 1000 ) / 100;
    s4 = ( i - s1 * 10000 - s2 * 1000 - s3 * 100 ) / 10;
    s5 = ( i - s1 * 10000 - s2 * 1000 - s3 * 100 - s4 * 10);

    if (    ( ( s1 + s2 + s3 + s4 + s5 ) >= A ) && ( ( s1 + s2 + s3 + s4 + s5 ) <= B ) ){
           sum += i;      
       }

}

    cout << sum << endl;

    return 0;
 
}