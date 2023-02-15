import 'dart:io';

void main(List<String> arguments) {
  List<int> intList = [];
  NhapMang(5, intList);
  print("Mang truoc khi sap xep: ");
  XuatMang(intList);
  var max = FindMax(intList);
  print("GTLN trong mang la: $max");

  print("Mang sau khi sap xep: ");
  InsertionSort(intList);
  XuatMang(intList);
}

//const la hang so trong luc bien dich. Final la hang so va se nhan duoc trong luc chay chuong trinh run time

//tinh giai thua
int Fatorial(int n) {
  if (n == 1) {
    return 1;
  }
  return n * Fatorial(n - 1);
}

num sum(int a, int b) => a + b;

List<int> NhapMang(int n, List<int> intList) {
  var number;
  for (var i = 0; i < n; i++) {
    print("Nhap gia tri: ");

    number = int.parse(stdin.readLineSync()!);
    intList.add(number);
  }
  return intList;
}

void XuatMang(List<int> intList) {
  for (var i = 0; i < intList.length; i++) {
    print(intList[i].toString());
  }
}

//sap xep cac gia tri trong mang
void BubbleSort(List<int> list) {
  for (var i = 0; i < list.length - 1; i++) {
    for (var j = i + 1; j < list.length; j++) {
      if (list[i] < list[j]) {
        var m = list[i];
        list[i] = list[j];
        list[j] = m;
      }
    }
  }
}

void InsertionSort(List<int> list) {
  var x, pos;
  for (var i = 1; i < list.length; i++) {
    x = list[i];
    pos = i;
    while (pos > 0 && x < list[pos - 1]) {
      list[pos] = list[pos - 1];
      pos--;
    }
    list[pos] = x;
  }
}

void SelectionSort(List<int> list) {
  var min; // vi tri phan tu nho nhat trong day
  for (var i = 0; i < list.length - 1; i++) {
    min = i;
    for (var j = i + 1; j < list.length; j++) {
      if (list[j] < list[min]) {
        min = j;
      }
    }
    if (min != i) {
      var m = list[i];
      list[i] = list[min];
      list[min] = m;
    }
  }
}

//tim gia tri lon nhat trong mang
int FindMax(List<int> list) {
  var max = list[0];
  for (var i = 0; i < list.length; i++) {
    if (max <= list[i]) {
      max = list[i];
    }
  }
  return max;
}

//a
