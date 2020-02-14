#include <iostream>
using namespace std;
 
int main()
{
    int N,X;
    int i,j,k;
    int id1,id2,id3;
    int exist = 0;

    cin >> N >> X;

 
for (i = 0; i <= N  ; i++) {
   for (j = 0; j <= N-i ; j++) {
     for (k = 0; k <= N-i-j ; k++) {
     
       if (     ((  i * 10000 + j * 5000 + k * 1000 )  == X )
            &&  ((  i + j + k                       )  == N )  )
       {
        id1 = i;
        id2 = j;
        id3 = k;
        exist++;        
       }
     
     } 
   }
}

    if ( exist == 0 ){
        id1 = -1;
        id2 = -1;
        id3 = -1;
    }

    cout << id1 << " " <<id2 << " " << id3 << endl;

    return 0;
 
}