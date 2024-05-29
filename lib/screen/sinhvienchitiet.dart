import 'package:flutter/material.dart';
import 'package:ontapprovider_listviewbuilder/model/sinhvien.dart';
import 'package:ontapprovider_listviewbuilder/provider/sinhvien.dart';
import 'package:ontapprovider_listviewbuilder/screen/Edit.dart';
import 'package:provider/provider.dart';

class SinhVienDetail extends StatelessWidget {
  final SinhVien? sv;

  SinhVienDetail(this.sv);

  @override
  Widget build(BuildContext context) {
    // Lắng nghe các thay đổi từ provider
    return Consumer<PSinhViens>(
      // builder là một hàm xây dựng được gọi bất cứ khi nào pSinhViens thay đổi.
      builder: (context, pSinhViens, child) {
        // Lấy thông tin sinh viên mới nhất từ danh sách
        SinhVien? updatedSv = pSinhViens.listSinhVien.firstWhere(
          (sinhVien) => sinhVien.msv == sv!.msv,
          orElse: () => sv!,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text("Chi tiết sinh viên"),
            backgroundColor: Colors.red,
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Edit(
                        svTmp: sv,
                        mode: 1,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(updatedSv.msv),
                SizedBox(height: 20),
                Text(updatedSv.name),
                SizedBox(height: 20),
                Text(updatedSv.address),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
