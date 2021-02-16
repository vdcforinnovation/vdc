#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
 
int main()
{
  int V, T, S, D;

  cin >> V >> T >> S >> D;

  if (V * T > D || D > V * S){
    cout << "Yes" << endl;
  }else{
    cout << "No" << endl;
  }
   
  return 0;
 
}