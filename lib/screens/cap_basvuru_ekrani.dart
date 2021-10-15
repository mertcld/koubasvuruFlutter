import 'dart:ui';

import 'package:basvurukayit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CapBasvuru extends StatefulWidget {
  const CapBasvuru({Key? key}) : super(key: key);

  @override
  _CapBasvuruState createState() => _CapBasvuruState();
}

class _CapBasvuruState extends State<CapBasvuru> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  // final checkBoxList = [
  //   CheckBoxModal(title: 'KURUM İÇİ YATAY GEÇİŞ'),
  //   CheckBoxModal(title: 'KURUMLAR ARASI YATAY GEÇİŞ'),
  //   CheckBoxModal(title: 'MER. YER. PUANIYLA YATAY GEÇİŞ '),
  //   CheckBoxModal(title: 'YURT DIŞI YATAY GEÇİŞ BAŞVURUSU')
  // ];

  final checkBoxOgrenim = [
    CheckBoxModal(title: '1.Öğretim'),
    CheckBoxModal(title: '2.Öğretim')
  ];
  final checkBoxYariyil = [
    CheckBoxModal(title: '3. Yarıyıl'),
    CheckBoxModal(title: '4. Yarıyıl'),
    CheckBoxModal(title: '5. Yarıyıl'),
    CheckBoxModal(title: '6. Yarıyıl'),
  ];
  final checkBoxSinif = [
    CheckBoxModal(title: '2.Sınıf'),
    CheckBoxModal(title: '3. Sınıf'),
  ];
  // final checkBoxDisiplin = [
  //   CheckBoxModal(title: 'VAR'),
  //   CheckBoxModal(title: 'YOK')
  // ];
  final checkBoxBasvuruOnay = [
    CheckBoxModal(title: 'İncelendi'),
    CheckBoxModal(title: 'Onaylandı'),
    CheckBoxModal(title: 'Kabul edildi'),
    CheckBoxModal(title: 'Reddedildi'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 150.0,
                width: 120.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  'KOCAELİ ÜNİVERSİTESİ\nÇAP BAŞVURU FORMU',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.green,
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
              Text(
                '1- Başvuru Yapan Öğrencinin : ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Adı-Soyadı'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kayıt Olduğu Fakülte'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Öğrenci No'),
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Kayıt olduğu lisans programı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxOgrenim
                      .map((item) => ListTile(
                            onTap: () => onItemClicked(item),
                            leading: Checkbox(
                              value: item.value,
                              onChanged: (value) => onItemClicked(item),
                            ),
                            title: Text(item.title),
                          ))
                      .toList()
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kayıt Olduğu Lisans Programı Adı'),
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Kayıt Olduğu Programın Yarıyılı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxYariyil
                      .map((item) => ListTile(
                            onTap: () => onItemClicked(item),
                            leading: Checkbox(
                              value: item.value,
                              onChanged: (value) => onItemClicked(item),
                            ),
                            title: Text(item.title),
                          ))
                      .toList()
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'Kayıt Olduğu Programdaki Not Ortalaması (AGNO)'),
                ),
              ),
              Text(
                '2-Başvuru Bilgileri',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Başvuru Yapacağı Fakülte'),
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Başvuru yapacağı lisans programı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxOgrenim
                      .map((item) => ListTile(
                            onTap: () => onItemClicked(item),
                            leading: Checkbox(
                              value: item.value,
                              onChanged: (value) => onItemClicked(item),
                            ),
                            title: Text(item.title),
                          ))
                      .toList()
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Başvuru Yapacağı Lisans Programı Adı'),
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Başvuru Yapacağı Lisans Programı Sınıfı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxSinif
                      .map((item) => ListTile(
                            onTap: () => onItemClicked(item),
                            leading: Checkbox(
                              value: item.value,
                              onChanged: (value) => onItemClicked(item),
                            ),
                            title: Text(item.title),
                          ))
                      .toList()
                ],
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Başvuru Kabul Durumu',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxBasvuruOnay
                      .map((item) => ListTile(
                            onTap: () => onItemClicked(item),
                            leading: Checkbox(
                              value: item.value,
                              onChanged: (value) => onItemClicked(item),
                            ),
                            title: Text(item.title),
                          ))
                      .toList()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onItemClicked(CheckBoxModal item) {
    final newVal = !item.value;
    setState(() {
      item.value = newVal;
    });
  }
}

class CheckBoxModal {
  String title;
  bool value;
  CheckBoxModal({required this.title, this.value = false});
}