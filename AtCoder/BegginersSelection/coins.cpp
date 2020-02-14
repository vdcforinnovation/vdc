#include <iostream>
using namespace std;
 
int main()
{
    int a,b,c;
    int X;
    int i,j,k;
    int Num = 0;

    cin >> a;
    cin >> b;
    cin >> c;
    cin >> X;
 
for (i = 0; i <= a  ; i++) {
   for (j = 0; j <= b ; j++) {
     for (k = 0; k <= c ; k++) {
     
       if ( (i * 500 + j * 100 + k * 50 ) == X ){
        Num++;
       }
     
     } 
   }
}

    cout << Num << endl;

    return 0;
 
}