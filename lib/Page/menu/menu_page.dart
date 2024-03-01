// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/component/Menu/category_button.dart';
import 'package:flutter_coffee_application/component/Menu/menu_body.dart';
import 'package:flutter_coffee_application/component/Menu/menu_top.dart';
import 'package:flutter_coffee_application/component/Menu/recom_body.dart';
import 'package:flutter_coffee_application/provider/data_provider.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';s

class ListProduk extends ConsumerStatefulWidget {
  final String type;
  const ListProduk({Key? key, required this.type}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListProdukState();
}

class _ListProdukState extends ConsumerState<ListProduk> {
  final ScrollController _controller = ScrollController();
  bool changeTop = false;

  void initState() {
    super.initState();
    _controller.addListener(() {
      // print(_controller.offset);
      setState(() {
        changeTop = _controller.offset != 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = ref.watch(categoryProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: changeTop ? Size.fromHeight(100) : Size.fromHeight(50),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 20),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: changeTop ? 1000 : 100),
                    opacity: changeTop ? 1 : 0,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.type == "deliv"
                                ? "Delivery dari Store"
                                : "Pick up di store",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Pakuwon City Mall, Surabaya",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                    color: primaryLight),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                crossFadeState: changeTop
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                sizeCurve: Curves.easeOut,
                firstChild: MenuTop(
                  type: widget.type,
                ),
                secondChild: Center(
                  child: SizedBox(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              category.when(
                data: (catData) {
                  return Container(
                    height: 40,
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
                      controller: _controller,
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
                                              fontSize: 15, color: primary),
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
