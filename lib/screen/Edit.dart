import 'package:flutter/material.dart';
import 'package:ontapprovider_listviewbuilder/model/sinhvien.dart';
import 'package:ontapprovider_listviewbuilder/provider/sinhvien.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget {
  SinhVien? sv;
  String _title = "Edit";
  int _mode = 0;
  Edit({SinhVien? svTmp, int mode = 0}) {
    _mode = mode;

    if (mode == 0) {
      _title = "Thêm";
    } else if (mode == 1) {
      _title = "Sửa";
    }
    if (svTmp != null) {
      sv = svTmp;
    }
  }

  @override
  State<Edit> createState() => _Edit();
}

class _Edit extends State<Edit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerMaSinhVien = TextEditingController();
  final TextEditingController _controllerTen = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();

  String? _validateMaSinhVien(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mã sinh viên.';
    }
    // Thêm các điều kiện validate khác nếu cần
    return null;
  }

  String? _validateTen(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập họ tên.';
    }
    // Thêm các điều kiện validate khác nếu cần
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập địa chỉ.';
    }
    // Thêm các điều kiện validate khác nếu cần
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _controllerMaSinhVien.text =
        widget.sv == null ? "" : widget.sv!.msv.toString();
    _controllerTen.text = widget.sv == null ? "" : widget.sv!.name.toString();
    _controllerAddress.text =
        widget.sv == null ? "" : widget.sv!.address.toString();

    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget._title),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              readOnly: widget._mode == 0 ? false : true,
              controller: _controllerMaSinhVien,
              decoration: InputDecoration(
                labelText: 'Ma Sinh Vien',
              ),
              validator: _validateMaSinhVien,
            ),
            TextFormField(
              controller: _controllerTen,
              decoration: InputDecoration(
                labelText: 'Ho Ten',
              ),
              validator: _validateTen,
            ),
            TextFormField(
              controller: _controllerAddress,
              decoration: InputDecoration(
                labelText: 'Dia chi',
              ),
              validator: _validateAddress,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (widget._mode == 0) {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> kq = context.read<PSinhViens>().Them(
                          _controllerMaSinhVien.text,
                          _controllerTen.text,
                          _controllerAddress.text);

                      if (kq["issuccess"]) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Thông tin sinh viên đã được thêm thành công!'),
                            duration:
                                Duration(seconds: 2), // Thời gian hiển thị
                          ),
                        );

                        Navigator.pop(context);
                      } else if (widget._mode == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Thêm thất bại do ${kq["message"]}! '),
                            duration:
                                Duration(seconds: 2), // Thời gian hiển thị
                          ),
                        );
                      }
                    }
                  } else {
                    context.read<PSinhViens>().Sua(_controllerMaSinhVien.text,
                        _controllerTen.text, _controllerAddress.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Thông tin sinh viên đã được sửa thành công!'),
                        duration: Duration(seconds: 2), // Thời gian hiển thị
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text("Lưu"))
          ],
        ),
      ),
    );
  }
}
