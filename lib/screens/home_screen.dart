import 'package:doctor_consultation_app/components/category_card.dart';
import 'package:doctor_consultation_app/components/doctor_card.dart';
import 'package:doctor_consultation_app/models/dokter_model.dart';
import 'package:doctor_consultation_app/screens/detail_screen.dart';
import 'package:doctor_consultation_app/components/search_bar.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/providers/dokter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DokterProvider>(context, listen: false).getDokter();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/menu.svg'),
                    SvgPicture.asset('assets/icons/profile.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Selamat Datang Didik',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Temukan Dokter Keinginan Anda.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Kategori',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildCategoryList(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Dokter tersedia',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildDoctorList(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Ahli\nGigi',
            'assets/icons/dental_surgeon.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Ahli\nJantung',
            'assets/icons/heart_surgeon.png',
            kYellowColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Ahli\nMata',
            'assets/icons/eye_specialist.png',
            kOrangeColor,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Consumer<DokterProvider>(
        builder: (context, data, _) {
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: data.dataDokter.length,
            itemBuilder: (context, i) {
              return Container(
                child: Column(
                  children: <Widget>[
                    DoctorCard(
                      data.dataDokter[i].nama,
                      data.dataDokter[i].posisi,
                      data.dataDokter[i].gambar,
                      data.dataDokter[i].status,
                      data.dataDokter[i].nohp,
                      data.dataDokter[i].deskripsi,
                      data.dataDokter[i].wa,
                      data.dataDokter[i].alamat,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


//   buildDoctorList1() {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 30,
//       ),
//       child: Column(
//         children: <Widget>[
//           DoctorCard(
//             'Dr. Taufiq',
//             'Dokter Umum',
//             'assets/images/doctor2.png',
//             kBlueColor,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           DoctorCard(
//             'Dr. Ha',
//             'Dokter Umum',
//             'assets/images/doctor1.png',
//             kYellowColor,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           DoctorCard(
//             'Dr. Mif',
//             'Spesialis Mata',
//             'assets/images/doctor1.png',
//             kOrangeColor,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
