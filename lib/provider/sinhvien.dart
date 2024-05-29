import 'package:flutter/material.dart';
import 'package:ontapprovider_listviewbuilder/model/sinhvien.dart';

class PSinhViens extends ChangeNotifier {
  List<SinhVien> listSinhVien = [
    SinhVien(msv: "2121050220", name: "Nguyen Tien Dung", address: "Hai Phong"),
    SinhVien(
        msv: "2121050221", name: "Nguyen Tien Dung1", address: "Hai Phong2"),
  ];

  List<SinhVien> get getList => listSinhVien;

  SinhVien? GetDetail(String ma) {
    for (SinhVien sinhvien in listSinhVien) {
      if (sinhvien.msv == ma) {
        return sinhvien;
      }
    }
    return null;
  }

  void SetThongTin(String ma) {
    for (SinhVien sinhvien in listSinhVien) {
      if (sinhvien.msv == ma) {
        sinhvien.name += "!";
      }
    }

    notifyListeners();
  }

  void Xoa(String ma) {
    for (SinhVien sinhvien in listSinhVien) {
      if (sinhvien.msv == ma) {
        listSinhVien.remove(sinhvien);
        notifyListeners();
        break;
      }
    }
  }

  void Sua(String ma, String name, String address) {
    for (SinhVien sinhvien in listSinhVien) {
      if (sinhvien.msv == ma) {
        sinhvien.name = name;
        sinhvien.address = address;
        notifyListeners();
        break;
      }
    }
  }

  Map<String, dynamic> Them(String ma, String name, String address) {
    bool isLoopMSV = false;

    // Kiểm tra xem có sinh viên nào có cùng mã sinh viên không
    for (SinhVien sinhVien in listSinhVien) {
      if (sinhVien.msv == ma) {
        isLoopMSV = true;
        break;
      }
    }

    // Nếu có sinh viên có cùng mã sinh viên, trả về kết quả không thành công
    if (isLoopMSV) {
      return {'issuccess': false, 'message': 'Mã sinh viên đã tồn tại.'};
    } else {
      // Nếu không có sinh viên có cùng mã sinh viên, thêm mới sinh viên và trả về kết quả thành công
      listSinhVien.add(SinhVien(msv: ma, name: name, address: address));
      notifyListeners();
      return {'issuccess': true, 'message': 'Thêm sinh viên thành công.'};
    }
  }
}
