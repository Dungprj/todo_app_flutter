import 'package:flutter/material.dart';
import 'package:ontapprovider_listviewbuilder/provider/mysetting.dart';
import 'package:ontapprovider_listviewbuilder/provider/sinhvien.dart';
import 'package:provider/provider.dart';

import 'Edit.dart';
import 'sinhvienchitiet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Quan ly sinh vien"),
          actions: [
            Switch(
              value: context.watch<PMysettings>().isDark,
              onChanged: (newValue) {
                context.read<PMysettings>().SetBrightness(newValue);
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Edit(
                        svTmp: null,
                        mode: 0,
                      );
                    });
              },
            ),
          ],
        ),
        body: Center(
            child: Consumer<PSinhViens>(builder: (context, Psinhvien, child) {
          return ListView.builder(
              itemCount: Psinhvien.getList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(Psinhvien.listSinhVien[index].msv),
                    subtitle: Text(Psinhvien.listSinhVien[index].name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Psinhvien.Xoa(Psinhvien.listSinhVien[index].msv);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Thông tin sinh viên đã được Xóa thành công!'),
                            duration:
                                Duration(seconds: 2), // Thời gian hiển thị
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SinhVienDetail(
                                    Psinhvien.GetDetail(
                                        Psinhvien.listSinhVien[index].msv),
                                  )));
                    },
                  ),
                );
              });
        })),
      ),
    );
  }
}
