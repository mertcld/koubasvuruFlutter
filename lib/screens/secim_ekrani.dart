import 'dart:ui';

import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/cap_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/login_ekrani.dart';
import 'package:basvurukayit/screens/yatay_gecis_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/yaz_okulu_basvuru_ekrani.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SecimEkrani extends StatefulWidget {
  const SecimEkrani({Key? key}) : super(key: key);

  @override
  _SecimEkraniState createState() => _SecimEkraniState();
}

class _SecimEkraniState extends State<SecimEkrani> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child:
                    Image.asset("assets/images/logo.png", fit: BoxFit.contain),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Giriş Bilgileri",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Kullanıcı Ad-Soyad ${loggedInUser.userName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("Kullanıcı E-mail :  ${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: Text('ÇAP Başvuru ekranı'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CapBasvuru()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              ElevatedButton(
                child: Text('Yatay Geçiş Başvuru ekranı'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YatayGecisBasvuru()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              ElevatedButton(
                child: Text('Yaz Okulu Başvuru ekranı'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YazOkuluBasvuru()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              ElevatedButton(
                child: Text('DGS Başvuru ekranı'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CapBasvuru()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              ActionChip(
                  label: Text("Çıkış Yap"),
                  onPressed: () {
                    cikisYap(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> cikisYap(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginEkrani()));
  }
}
