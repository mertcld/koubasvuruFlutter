import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DgsBasvuru extends StatefulWidget {
  const DgsBasvuru({Key? key}) : super(key: key);

  @override
  _DgsBasvuruState createState() => _DgsBasvuruState();
}

class _DgsBasvuruState extends State<DgsBasvuru> {
  final checkBoxList = [
    CheckBoxModal(title: 'deeme İÇİ YATAY GEÇİŞ'),
    CheckBoxModal(title: 'KURUMLAR ARASI YATAY GEÇİŞ'),
    CheckBoxModal(title: 'MER. YER. PUANIYLA YATAY GEÇİŞ '),
    CheckBoxModal(title: 'YURT DIŞI YATAY GEÇİŞ BAŞVURUSU')
  ];

  final checkBoxOgrenim = [
    CheckBoxModal(title: '1.Öğretim'),
    CheckBoxModal(title: '2.Öğretim')
  ];
  final checkBoxNotSistemi = [
    CheckBoxModal(title: '4\u0027lü'),
    CheckBoxModal(title: '5\u0027li'),
    CheckBoxModal(title: '10\u0027lu'),
    CheckBoxModal(title: '100\u0027lü'),

  ];
  final checkBoxCinsiyet = [
    CheckBoxModal(title: 'Kız'),
    CheckBoxModal(title: 'Erkek')
  ];
  final checkBoxSinif = [
    CheckBoxModal(title: '1'),
    CheckBoxModal(title: '2'),
    CheckBoxModal(title: '3'),
    CheckBoxModal(title: '4'),
    CheckBoxModal(title: '5 ve üzeri'),
  ];
  final checkBoxDisiplin = [
    CheckBoxModal(title: 'VAR'),
    CheckBoxModal(title: 'YOK')
  ];
  final checkBoxBasvuruOnay = [
    CheckBoxModal(title: 'BAŞVURUSU UYGUNDUR'),
    CheckBoxModal(title: 'BAŞVURUSU UYGUN DEĞİLDİR')
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
                  '       KOCAELİ ÜNİVERSİTESİ\n DGS BAŞVURU FORMU',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ),
              /*ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    '1-Başvuru Türü',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxList
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
              Divider(
                color: Colors.black,
              ),*/
              Text(
                '1-Kişisel Bilgiler',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      border: OutlineInputBorder(), labelText: 'TC NO'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Doğum Tarihi'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'E-Posta'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'GSM'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Adres'),
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
                        'Cinsiyet',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxCinsiyet
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
              Divider(
                color: Colors.black,
              ),
              Text(
                '2-Öğrenimine ilişkin bilgiler\n Ön Lisans Eğitim Bilgisi',
                
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Üniversite Adı:'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ön Lisans Programı'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kayıtlı Olunan Bölüm/Program'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mezuniyet Tarihi'), // daha sonra date time input değiştir 
                ),
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Diploma Notu'), // daha sonra date time input değiştir 
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
                        '3- Not Sistemi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Divider(
                    color: Colors.black,
                  ),
                  ...checkBoxNotSistemi
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
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   physics: AlwaysScrollableScrollPhysics(),
                // children: [
                //   Padding(
                //       padding: const EdgeInsets.only(left: 5),
                //       child: Text(
                //         'Sınıfı',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //         ),
                //         textAlign: TextAlign.start,
                //       )),
                //   Divider(
                //     color: Colors.black,
                //   ),
                //   ...checkBoxSinif
                //       .map((item) => ListTile(
                //             onTap: () => onItemClicked(item),
                //             leading: Checkbox(
                //               value: item.value,
                //               onChanged: (value) => onItemClicked(item),
                //             ),
                //             title: Text(item.title),
                //           ))
                //       .toList()
                // ],
              //),
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   physics: AlwaysScrollableScrollPhysics(),
              //   children: [
              //     Padding(
              //         padding: const EdgeInsets.only(left: 5),
              //         child: Text(
              //           'Disiplin Cezası',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //           ),
              //           textAlign: TextAlign.start,
              //         )),
              //     Divider(
              //       color: Colors.black,
              //     ),
              //     ...checkBoxDisiplin
              //         .map((item) => ListTile(
              //               onTap: () => onItemClicked(item),
              //               leading: Checkbox(
              //                 value: item.value,
              //                 onChanged: (value) => onItemClicked(item),
              //               ),
              //               title: Text(item.title),
              //             ))
              //         .toList()
              //   ],
              // ),
              // Divider(
              //   color: Colors.black,
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'GENEL NOT ORTALAMASI'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'ÖĞRENCİ NUMARASI'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'KAYITLI ÜNİVERSİTEYE YERLEŞME YILI'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'YERLEŞİLEN PUAN TÜRÜ VE PUANI'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'YABANCI DİL PUANI VE TÜRÜ'),
              //   ),
              // ),
              // Divider(
              //   color: Colors.black,
              // ),
              Text(
                '4-ADAYIN BAŞVURDUĞU LİSANS PROGRAMINA İLİŞKİN BİLGİLER',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'FAKÜLTE / YÜKSEKOKUL/MYO.  ADI'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'BÖLÜM/PROGRAM ADI'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'BAŞVURULAN PROGRAMIN YERLEŞİLEN YILA AİT PUANI'),
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
                        'Öğrenim Türü',
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
              Divider(
                color: Colors.black,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Beyan ettiğim bilgilerin veya belgelerin gerçeğe aykırı olması veya daha önce yatay geçiş yapmış olmam halinde hakkımda cezai işlemlerin yürütüleceğini ve kaydım yapılmış olsa dahi silineceğini bildiğimi kabul ediyorum.'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        ' Tarih : ../.../...                                           Ad-Soyad İmza',
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                'BU BÖLÜM ÜNİVERSİTE YETKİLİ BİRİMLERİNCE DOLDURULACAKTIR',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
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
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Varsa açıklamalar : .....................................'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        ' Tarih : ..../.../.....                           ',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          ' Başvuruyu alan görevlinin                                 Ad-Soyad İmza')
                    ],
                  ),
                ),
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
