#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
 
int main()
{
    int N;

    cin >> N;
    
    std::vector<int> d(N);

    for (int i=0;i<N;i++){
       cin >> d[i];
    }

    // 降順で並び替え
    std::sort(d.begin(), d.end(), std::greater<int>() );

 //   for (int i=0;i<N;i++){
 //      cout << d[i];
 //   }

    int step;

    for (int j; j<N;j++) {
		if(d[j] > d[j+1]){
            step++;
        }
	}

    cout << step << endl;
 
    return 0;
 
}