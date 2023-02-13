import java.util.Random;

public class SortingAlgorithms {
    private static final int NUM_TRIALS = 100;
    private static final int[] ARRAY_SIZES = {100, 500, 1000, 5000, 10000};
    
    public static void main(String[] args) {
        for (int size : ARRAY_SIZES) {
            System.out.println("Array size: " + size);
            int[] array = generateRandomArray(size);
            long totalTime = 0;
            
            // Selection sort
            totalTime = 0;
            for (int i = 0; i < NUM_TRIALS; i++) {
                int[] copy = array.clone();
                long startTime = System.nanoTime();
                selectionSort(copy);
                long endTime = System.nanoTime();
                totalTime += (endTime - startTime);
            }
            long averageTime = totalTime / NUM_TRIALS;
            System.out.println("Selection sort average time: " + averageTime + " ns");
            
            // Insertion sort
            totalTime = 0;
            for (int i = 0; i < NUM_TRIALS; i++) {
                int[] copy = array.clone();
                long startTime = System.nanoTime();
                insertionSort(copy);
                long endTime = System.nanoTime();
                totalTime += (endTime - startTime);
            }
            averageTime = totalTime / NUM_TRIALS;
            System.out.println("Insertion sort average time: " + averageTime + " ns");
            
            // Quick sort
            totalTime = 0;
            for (int i = 0; i < NUM_TRIALS; i++) {
                int[] copy = array.clone();
                long startTime = System.nanoTime();
                quickSort(copy, 0, copy.length - 1);
                long endTime = System.nanoTime();
                totalTime += (endTime - startTime);
            }
            averageTime = totalTime / NUM_TRIALS;
            System.out.println("Quick sort average time: " + averageTime + " ns");
            
            // Merge sort
            totalTime = 0;
            for (int i = 0; i < NUM_TRIALS; i++) {
                int[] copy = array.clone();
                long startTime = System.nanoTime();
                mergeSort(copy, 0, copy.length - 1);
                long endTime = System.nanoTime();
                totalTime += (endTime - startTime);
            }
            averageTime = totalTime / NUM_TRIALS;
            System.out.println("Merge sort average time: " + averageTime + " ns");
            System.out.println();
        }
    }
    
    private static int[] generateRandomArray(int size) {
        Random random = new Random();
        int[] array = new int[size];
        for (int i = 0; i < size; i++) {
            array[i] = random.nextInt();
        }
        return array;
    }
    
    private static void selectionSort(int[] array) {
          int n = array.length;
        for (int i = 0; i < n-1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (array[j] < array[minIndex]) {
                    minIndex = j;
                }
            }
            int temp = array[minIndex];
            array[minIndex] = array[i];
            array[i] = temp;
        }
    }
    
    private static void insertionSort(int[] array) {
        int n = array.length;
        for (int i = 1; i < n; i++) {
            int key = array[i];
            int j = i - 1;
            while (j >= 0 && array[j] > key) {
                array[j + 1] = array[j];
                j = j - 1;
            }
            array[j + 1] = key;
        }
    }
    
    private static void quickSort(int[] array, int low, int high) {
        if (low < high) {
            int pivotIndex = partition(array, low, high);
            quickSort(array, low, pivotIndex - 1);
            quickSort(array, pivotIndex + 1, high);
        }
    }
    
    private static int partition(int[] array, int low, int high) {
        int pivot = array[high];
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (array[j] <= pivot) {
                i++;
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
        int temp = array[i + 1];
        array[i + 1] = array[high];
        array[high] = temp;
        return i + 1;
    }
    
    private static void mergeSort(int[] array, int low, int high) {
        if (low < high) {
            int middle = (low + high) / 2;
            mergeSort(array, low, middle);
            mergeSort(array, middle + 1, high);
            merge(array, low, middle, high);
        }
    }
    
    private static void merge(int[] array, int low, int mid, int high) {
        int n1 = mid - low + 1;
        int n2 = high - mid;
        int[] left = new int[n1];
        int[] right = new int[n2];
        for (int i = 0; i < n1; i++) {
            left[i] = array[low + i];
        }
        for (int j = 0; j < n2; j++) {
            right[j] = array[mid + 1 + j];
        }
        int i = 0, j = 0, k = low;
        while (i < n1 && j < n2) {
            if (left[i] <= right[j]) {
                array[k] = left[i];
                i++;
            } else {
                array[k] = right[j];
                j++;
            }
            k++;
        }
        while (i < n1) {
            array[k] = left[i];
            i++;
            k++;
        }
        while (j < n2) {
            array[k] = right[j];
            j++;
            k++;
        }
    }
}
