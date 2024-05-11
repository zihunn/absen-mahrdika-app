int findFirstGreater(List<int> array, int threshold) {
  for (int index = 0; index < array.length; index++) {
    int value = array[index];
    if (value > threshold) {
      return index;
    }
    print('Checking element $value at index $index');
  }
  return -1;
}

void main() {
  List<int> data = [5, 3, 1, 8, 7, 2];
  int threshold = 6;
  int result = findFirstGreater(data, threshold);
  if (result != -1) {
    print('The first element greater than $threshold is at index $result.');
  } else {
    print('No element greater than the threshold was found.');
  }
}
