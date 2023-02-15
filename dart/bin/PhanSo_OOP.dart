import 'dart:io';

void main(List<String> args) {
  PhanSo ps = PhanSo();
  PhanSo ps1 = PhanSo();
  PhanSo ps2 = PhanSo();

  print('Nhap Phan So 1: ');
  ps1.Input();
  print('Nhap Phan So 2: ');
  ps2.Input();

  print(' Phan So 1: ');
  ps1.Output();
  print('Phan So 2: ');
  ps2.Output();
  print('Tich hai phan so: ');
  //ps = ps1.Tich(ps2);
  ps = ps1 * ps2;
  ps.Output();
  print('Phan So sau khi rut gon: ');
  ps = ps.RutGon();
  ps.Output();
  print(ps.getTu);
  if (ps1 < ps2) {
    print('phan so 1 nho hon. ');
  } else {
    print('phan so 2 nho hon.');
  }
}

class PhanSo {
  var Tu;
  var Mau;

  PhanSo() {
    this.Tu = 0;
    this.Mau = 1;
  }

  PhanSo.Constructor(this.Tu, this.Mau);

  num get getTu => this.Tu;
  void set setTu(num a) => this.Tu = a;
  num get getMau => this.Mau;
  void set setMau(num a) => this.Mau = a;

  void Input() {
    print('Nhap Tu So: ');
    this.Tu = int.parse(stdin.readLineSync()!);
    do {
      print('Nhap Mau So: ');
      this.Mau = int.parse(stdin.readLineSync()!);
      if (Mau == 0) {
        print('Mau so khong hop le. Xin vui long nhap lai!');
      }
    } while (Mau == 0);
  }

  void Output() {
    if (this.Tu == 0) {
      print('Phan So x = 0');
    } else if (this.Mau == 1) {
      print('Phan So x = $Tu');
    } else {
      print('Phan So x = $Tu / $Mau');
    }
  }

  int UCLN(int a, int b) {
    while (a != b) {
      if (a > b) {
        a = a - b;
      } else {
        b = b - a;
      }
    }

    return a;
  }

  PhanSo RutGon() {
    int i = UCLN(this.Tu, this.Mau);
    return PhanSo.Constructor(Tu / i, Mau / i);
  }

  bool operator <(PhanSo a) =>
      (this.Tu / this.Mau) < (a.Tu / a.Mau) ? true : false;

  PhanSo Tong(PhanSo a) =>
      PhanSo.Constructor(this.Tu * a.Mau + this.Mau * a.Tu, this.Mau * a.Mau);

  PhanSo operator +(PhanSo a) =>
      PhanSo.Constructor(this.Tu * a.Mau + this.Mau * a.Tu, this.Mau * a.Mau);

  PhanSo Hieu(PhanSo a) =>
      PhanSo.Constructor(this.Tu * a.Mau - this.Mau * a.Tu, this.Mau * a.Mau);

  PhanSo operator -(PhanSo a) =>
      PhanSo.Constructor(this.Tu * a.Mau - this.Mau * a.Tu, this.Mau * a.Mau);

  PhanSo Tich(PhanSo a) => PhanSo.Constructor(this.Tu * a.Tu, this.Mau * a.Mau);

  PhanSo operator *(PhanSo a) =>
      PhanSo.Constructor(this.Tu * a.Tu, this.Mau * a.Mau);

  PhanSo Thuong(PhanSo a) =>
      PhanSo.Constructor(this.Tu * a.Mau, this.Mau * a.Tu);

  PhanSo operator /(PhanSo a) =>
      PhanSo.Constructor(this.Tu * a.Mau, this.Mau * a.Tu);
}
