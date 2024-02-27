// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/component/category_button.dart';
import 'package:flutter_coffee_application/component/menu_body.dart';
import 'package:flutter_coffee_application/component/recom_body.dart';
import 'package:flutter_coffee_application/provider/data_provider.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';s

class ListProduk extends ConsumerStatefulWidget {
  final String type;
  const ListProduk({Key? key, required this.type}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListProdukState();
}

class _ListProdukState extends ConsumerState<ListProduk> {
  @override
  Widget build(BuildContext context) {
    final category = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          Icon(Icons.search),
        ],
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.type == "pick"
                  ? Container(
                      height: 170,
                      child: Stack(
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  0.1,
                                  0.6,
                                  0.9,
                                ],
                                colors: [
                                  Colors.white,
                                  primarySplash,
                                  primaryAlt,
                                ],
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: primaryAlt,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Icon(
                                        Icons.shopping_bag_rounded,
                                        color: primary,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Pick Up",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text("Ambil ke store tanpa antri"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: primarySplash,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.house_rounded,
                                        color: primary,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Dash(
                                    direction: Axis.vertical,
                                    length: 50,
                                    dashLength: 3,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pakuwon City Mall, Surabaya",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "1,17 km",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CircleAvatar(
                                            radius: 5,
                                            backgroundColor: primary,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Terdekat",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: primaryAlt),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 250,
                      child: Stack(
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  0.1,
                                  0.6,
                                  0.9,
                                ],
                                colors: [
                                  Colors.white,
                                  secondarySplash,
                                  secondaryAlt,
                                ],
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: secondarySplash,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Icon(
                                        Icons.motorcycle,
                                        color: secondary,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text("Segera diantar ke lokasimu"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: MediaQuery.of(context).size.width,
                              height: 160,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: secondarySplash,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.house_rounded,
                                            color: secondary,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      Dash(
                                        direction: Axis.vertical,
                                        length: 40,
                                        dashLength: 3,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: primarySplash,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.location_on,
                                            color: primary,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pakuwon City Mall, Surabaya",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "1,17 km",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 5,
                                                      backgroundColor:
                                                          primary,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Terdekat",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: primaryAlt),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                                Icons.arrow_forward_ios_rounded)
                                          ],
                                        ),
                                        Divider(),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Rumah",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "Surabaya, Lidah Wetan, Lakarsantri, Surabaya, East Java 60213",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "wisata bukit mas 2 I9 no 12",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons
                                                  .arrow_forward_ios_rounded)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              category.when(
                data: (catData) {
                  return Container(
                    height: 40, // Adjust height according to your needs
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: catData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              right: 10, left: index == 0 ? 16 : 0),
                          child: ButtonCategory(
                              tap: false,
                              index: index,
                              onPressed: () => {},
                              title: catData[index].name),
                        );
                      },
                    ),
                  );
                },
                error: (error, e) => Text(e.toString()),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
              ),
              Expanded(
                child: category.when(
                  data: (data) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data[i].name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  data[i].name.toLowerCase() != "recommended"
                                      ? Text(
                                          "4 Items",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        )
                                      : Text(
                                          "Lihat Semua",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: primary),
                                        ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Divider(),
                            ),
                            data[i].name.toLowerCase() == "recommended"
                                ? ref.watch(menuProvider(data[i].name)).when(
                                      data: (_data) {
                                        if (_data.isEmpty) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 120,
                                            child: Center(
                                              child: Text(
                                                "Tidak ada menu yang tersedia",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return Container(
                                          height: 150,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _data.length,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  RecomBody(
                                                    list: _data[index],
                                                  ),
                                                  index == _data.length - 1
                                                      ? SizedBox(
                                                          width: 16,
                                                        )
                                                      : SizedBox()
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      error: (error, e) => Text(e.toString()),
                                      loading: () => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                : ref.watch(menuProvider(data[i].name)).when(
                                      data: (_data) {
                                        if (_data.isEmpty) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 120,
                                            child: Center(
                                              child: Text(
                                                "Tidak ada menu yang tersedia",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: _data.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                MenuBody(
                                                  list: _data[index],
                                                ),
                                                index == _data.length - 1
                                                    ? SizedBox(
                                                        height: 16,
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16,
                                                        ),
                                                        child: Divider(),
                                                      ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      error: (error, e) => Text(e.toString()),
                                      loading: () => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                          ],
                        );
                      },
                    );
                  },
                  error: (error, e) => Text(e.toString()),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
