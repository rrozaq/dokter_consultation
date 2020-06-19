import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  var _name;
  var _posisi;
  var _imageUrl;
  var _status;
  var _nohp;
  var _description;
  var _wa;
  var _alamat;

  DoctorCard(this._name, this._posisi, this._imageUrl, this._status, this._nohp, this._description, this._wa, this._alamat);

  @override
  Widget build(BuildContext context) {
    

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(_name, _posisi, _imageUrl, _nohp, _description, _wa, _alamat),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: fungsikolor(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(_imageUrl),
            title: Text(
              _name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _posisi,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }



  fungsikolor(){
    if(_status == 'aktif'){
      return kBlueColor.withOpacity(0.1);
    }else{
      return kOrangeColor.withOpacity(0.1);
    }
  } 
}