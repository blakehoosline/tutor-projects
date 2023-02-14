#include <vector>
#include <iostream>

using namespace std;

class KMinHeap {
public:
    KMinHeap(int k) : size(0), K(k), heap(vector<int>(k+1)) {}

    void push(int x) {
        if (size < K) {
            heap[++size] = x;
            int i = size;
            while (i > 1 && heap[i/2] > heap[i]) {
                swap(heap[i/2], heap[i]);
                i /= 2;
            }
        } else if (x < heap[1]) {
            heap[1] = x;
            int i = 1;
            int smallest;
            while (2*i <= size) {
                if (2*i+1 <= size && heap[2*i+1] < heap[2*i]) {
                    smallest = 2*i+1;
                } else {
                    smallest = 2*i;
                }
                if (heap[i] > heap[smallest]) {
                    swap(heap[i], heap[smallest]);
                    i = smallest;
                } else {
                    break;
                }
            }
        }
    }

    int find_Kmin() {
        return heap[1];
    }

private:
    int size;
    int K;
    vector<int> heap;
};

int main() {
    int k = 3;
    KMinHeap minHeap(k);
    minHeap.push(3);
    minHeap.push(5);
    minHeap.push(2);
    minHeap.push(1);
    cout << minHeap.find_Kmin() << endl;
    return 0;
}
