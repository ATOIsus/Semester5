abstract class Search {
  bool search(List<int> arr, int searchValue);
}

class LinearSearch extends Search {
  @override
  bool search(List<int> arr, int searchValue) {
    for (var i in arr) {
      if (i == searchValue) {
        return true;
      }
    }

    return false;
  }
}

class binarySearch extends Search {
  @override
  bool search(List<int> arr, int searchValue) {
    int min = 0;
    int max = arr.length - 1;
    int mid = ((max + min) / 2).floor();

    while (mid >= min) {
      if (searchValue == arr[mid]) {
        return true;
      } else if (searchValue > arr[mid]) {
        min = mid;
        mid = ((mid + max) / 2).floor();
      } else {
        max = mid;
        mid = ((min + mid) / 2).floor();
      }
    }

    return false;
  }
}

void main() {
  // Same class but different objects.
  Search linSearch = LinearSearch();
  Search binSearch = binarySearch();

  print(linSearch.search([2,4,5,12,8,1,123,45], 8));  
  print(binSearch.search([1,2,3,4,45,56,67,88,91,123], 88));

}
