// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 230,
                  color: Colors.grey[100],
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          "Akun Saya",
                          style:
                              TextStyle(color: Colors.green[900], fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.blue[50],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 0.2,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    0, 0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Text(
                            "Member sejak: 03 September 2023",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green[900]!,
                          width: 2.0,
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.red[100],
                    backgroundImage: AssetImage("assets/image/comet.jpg"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green[900]!,
                        width: 2.0,
                      ),
                      color: Colors.white
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.green[900],
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: TextEditingController(text: "RYAN DAVID"),
                        decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 24, minWidth: 24),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green[900]!,
                                  width: 2.0,
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green[900],
                                size: 14,
                              ),
                            ),
                          ),
                          labelText: 'Username',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: TextEditingController(text: "ryandavidtandean@gmail.com"),
                        decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 24, minWidth: 24),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green[900]!,
                                  width: 2.0,
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green[900],
                                size: 14,
                              ),
                            ),
                          ),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: TextEditingController(text: "26 sep 2003"),
                        decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 24, minWidth: 24),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green[900]!,
                                  width: 2.0,
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green[900],
                                size: 14,
                              ),
                            ),
                          ),
                          labelText: 'Tanggal Lahir',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: TextEditingController(text: "PRIA"),
                        decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 24, minWidth: 24),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green[900]!,
                                  width: 2.0,
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green[900],
                                size: 14,
                              ),
                            ),
                          ),
                          labelText: 'Jenis Kelamin',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        readOnly: true,
                        controller: TextEditingController(text: "+6281234534699"),
                        decoration: InputDecoration(
                          labelText: 'Masukkan Nomor Ponsel',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'HUBUNGKAN AKUN',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal[900]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/image/whatsapp.png"),
                    radius: 20,
                  ),
                  title: Text("Google"),
                  trailing: Switch(
                    // This bool value toggles the switch.
                    value: true,
                    activeColor: Colors.green[700],
                    onChanged: (bool value) {},
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  height: 60,
                  color: Colors.grey[200],
                  child: Text(
                    "LAINNYA",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                      Text(
                        "HAPUS AKUN",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  color: Colors.green[900],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "SIMPAN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
