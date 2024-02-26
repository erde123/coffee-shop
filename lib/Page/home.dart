// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/Page/menu/menu_page.dart';
import 'package:flutter_coffee_application/Page/profile/profile_page.dart';
import 'package:flutter_coffee_application/component/promo_body.dart';
import 'package:flutter_coffee_application/provider/data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int _selectedIndex = 0;
  final datad = false;
  var screens = [HomePage(), ListProduk(type: "pick",), ProfilePage()];

  var listBottomNavigation = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Color.fromARGB(255, 236, 236, 236)),
    BottomNavigationBarItem(
        icon: Icon(Icons.shop),
        label: 'Menu',
        backgroundColor: Color.fromARGB(255, 236, 236, 236)),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Akun',
        backgroundColor: Color.fromARGB(255, 236, 236, 236)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     appName,
      //     style: TextStyle(fontWeight: FontWeight.bold, color: cWhite),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: cPrimary,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: listBottomNavigation,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
      body: screens[_selectedIndex],
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final listPromo = ref.watch(promoProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 185,
                  child: Stack(
                    children: [
                      Container(
                        height: 145,
                        color: Colors.green[800],
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    now.hour >= 5 && now.hour < 11
                                        ? 'Selamat Pagi,'
                                        : now.hour >= 11 && now.hour < 15
                                            ? 'Selamat Siang,'
                                            : now.hour >= 15 && now.hour < 19
                                                ? 'Selamat Sore,'
                                                : 'Selamat Malam,',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'RYAN DAVID',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.green[900],
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(36),
                                  onTap: () {},
                                  child: Center(
                                    child: Badge.count(
                                      isLabelVisible: true,
                                      count: 100,
                                      child: Icon(
                                        Icons.notifications_rounded,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ),
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
                              horizontal: 16, vertical: 12),
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.adjust_sharp,
                                    size: 35,
                                    color: Colors.green[900],
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "94 Poin",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[900],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tukarkan poinmu dengan hadiah menarik",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 17,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FlutterCarousel.builder(
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 6),
                    initialPage: 0,
                    showIndicator: true,
                    enableInfiniteScroll: true,
                    slideIndicator: CircularSlideIndicator(
                      indicatorRadius: 3.5,
                      itemSpacing: 15,
                      currentIndicatorColor: Colors.black,
                      indicatorBackgroundColor: Colors.grey,
                    ),
                    autoPlayCurve: Curves.easeInOut,
                    viewportFraction: 1.0,
                  ),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset('assets/image/image1.jpg'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'Pesan Sekarang',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.green[900]!,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListProduk(type: "pick",)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Pick Up",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Ambil di store tanpa antri",
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.green[200],
                                            radius: 23,
                                            child: Icon(
                                              Icons.shopping_bag,
                                              size: 30,
                                              color: Colors.green[900],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.pink[600]!,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListProduk(type: "deliv",)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink[900],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Pesanan diantar ke lokasimu",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 23,
                                          backgroundColor: Colors.pink[100],
                                          child: Icon(
                                            Icons.motorcycle,
                                            size: 30,
                                            color: Colors.pink[900],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  thickness: 10,
                  color: Colors.grey[200],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'Yang Menarik di Fore',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: listPromo.when(
                    data: (_data) {
                      if (_data.isEmpty) {
                        return SizedBox(
                          height: 180,
                          child: Center(
                            child: Text(
                              "Tidak ada Promo",
                            ),
                          ),
                        );
                      }
                      return PromoBody(list: _data);
                    },
                    error: (error, e) => Text(e.toString()),
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  thickness: 10,
                  color: Colors.grey[200],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'Butuh Bantuan?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/image/whatsapp.png"),
                          radius: 25,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fore Customer Service (chat only)",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "0812-0000-0000",
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  thickness: 10,
                  color: Colors.grey[200],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
