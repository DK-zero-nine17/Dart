import 'dart:io';

void main(List<String> args) {
  ThuVien thuVien = ThuVien();
  thuVien.ChucNang();
}

class DocGia {
  var tenDG;
  var sothanghieuluc;

  DocGia() {
    tenDG = sothanghieuluc = 0;
  }
  DocGia.Constructor(this.tenDG, this.sothanghieuluc);

  String get getname => this.tenDG;

  void Input() {
    print('Nhap ten doc gia: ');
    tenDG = stdin.readLineSync();
    print('Nhap so thang hieu luc:  ');
    sothanghieuluc = int.parse(stdin.readLineSync()!);
  }

  void Output() {
    print('Ten Doc Gia: $tenDG, So thang hieu luc: $sothanghieuluc');
  }
}

class DocGiaChild extends DocGia {
  var MaHS;

  DocGiaChild() {
    MaHS = 0;
  }
  DocGiaChild.Constructor(this.MaHS);

  void Input() {
    super.Input();
    print('Nhap MaHS: ');
    MaHS = stdin.readLineSync();
  }

  void Output() {
    super.Output();
    print('MaHS: $MaHS');
  }
}

class DocGiaAdults extends DocGia {
  var CCCD;

  DocGiaAdults() {
    CCCD = 0;
  }
  DocGiaAdults.Constructor(this.CCCD);

  void Input() {
    super.Input();
    print('Nhap CCCD: ');
    CCCD = stdin.readLineSync();
  }

  void Output() {
    super.Output();
    print('CCCD: $CCCD');
  }
}

class ThuVien {
  List<DocGia> list = [];
  var check = true;
  void ChucNang() {
    while (check) {
      print('========== THU VIEN ==========');
      print('1. Them Doc Gia Tre Em.');
      print('2. Them Doc Gia Nguoi Lon.');
      print('3. Xem Danh Sach Cac Doc Gia.');
      print('4. Tim Kiem Doc Gia.');
      print('5. Xoa Doc Gia.');

      print('0. Thoat.');
      print('==========    END   ==========');
      var luachon;
      print('Nhap su lua chon cua ban: ');
      luachon = int.parse(stdin.readLineSync()!);
      DocGia dg;
      switch (luachon) {
        case 1:
          print('Nhap Thong Tin Nguoi Doc Child: ');
          dg = new DocGiaChild();
          dg.Input();
          list.add(dg);
          break;
        case 2:
          print('Nhap Thong Tin Nguoi Doc Adults: ');
          dg = new DocGiaAdults();
          dg.Input();
          list.add(dg);
          break;

        case 3:
          for (var i = 0; i < list.length; i++) {
            print('Nguoi doc thu ${i + 1}  :');
            list[i].Output();
          }
          break;

        case 4:
          print('Nhap Ten Doc Gia Can Tim:');
          var m = stdin.readLineSync();
          for (var i = 0; i < list.length; i++) {
            if (m == list[i].getname) {
              list[i].Output();
            }
          }
          break;
        case 5:
          print('Nhap Ten Doc Gia Can Xoa:');
          var m = stdin.readLineSync();
          for (var i = 0; i < list.length; i++) {
            if (m == list[i].getname) {
              list.remove(m);
            }
          }
          break;
        case 0:
          check = false;
          break;
        default:
          print('Khong hop le. Vui long chon lai!');
          break;
      }
    }
  }
}
