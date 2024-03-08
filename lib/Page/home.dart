// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_coffee_application/Page/menu/menu_page.dart';
import 'package:flutter_coffee_application/Page/profile/profile_page.dart';
import 'package:flutter_coffee_application/Page/scan.dart';
import 'package:flutter_coffee_application/component/Home/promo_body.dart';
import 'package:flutter_coffee_application/resource/provider/auth/auth_provider.dart';
import 'package:flutter_coffee_application/resource/provider/data_provider.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_coffee_application/style/typhography.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  // final users = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;
  final datad = false;

  var screens = [
    HomePage(),
    HomePage(),
    QRCode(),
    HomePage(),
    ProfilePage(),
  ];

  var screensNotLogin = [
    HomePage(),
    HomePage(),
    HomePage(),
    ProfilePage(),
  ];

  var listBottomNavigation = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.discount),
        label: 'Voucher',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.qr_code_2_rounded),
        label: 'QR',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.file_copy),
        label: 'Pesanan',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), label: 'Akun', backgroundColor: Colors.white),
  ];

  var listBottomNavigationNotLogin = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.discount),
        label: 'Voucher',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.file_copy),
        label: 'Pesanan',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), label: 'Akun', backgroundColor: Colors.white),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: grey1,
        items: ref.watch(isLogin)
            ? listBottomNavigation
            : listBottomNavigationNotLogin,
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
      body: ref.watch(isLogin)
          ? screens[_selectedIndex]
          : screensNotLogin[_selectedIndex],
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
  final List<String> imageList = [
    // 'https://scontent.cdninstagram.com/v/t51.2885-15/430900967_386066304180273_3960130638635763083_n.webp?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEzNTAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=gIc8QfCeVsAAX958XZ-&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzMxNDcyOTQ2NzMwMTU3MDc3MA%3D%3D.2-ccb7-5&oh=00_AfCQ8uLMq-UeUezEwYMiu6I8awGP_YC0SOO0c5fH9NJaog&oe=65E7688D&_nc_sid=10d13b',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
    'assets/image/image4.jpg',
    'assets/image/image5.jpg',
    'assets/image/image4.jpg',
    'assets/image/image3.jpg',
  ];
  int _currentSlide = 0;

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
                        color: primary,
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/image/logo.png',
                                      scale: 3.5,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        now.hour >= 5 && now.hour < 11
                                            ? 'Selamat Pagi,'
                                            : now.hour >= 11 && now.hour < 15
                                                ? 'Selamat Siang,'
                                                : now.hour >= 15 &&
                                                        now.hour < 19
                                                    ? 'Selamat Sore,'
                                                    : 'Selamat Malam,',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Ryan David',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
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
                      Visibility(
                        visible: ref.watch(isLogin),
                        child: Positioned(
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.adjust_sharp,
                                          size: 35,
                                          color: primary,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "94 Poin",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: primary,
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
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 140,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage("assets/image/coin.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.width * (9 / 16),
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 6),
                    initialPage: _currentSlide,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                  ),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            // Image.network(
                            //   imageList[itemIndex],
                            //   fit: BoxFit.fill,
                            // ),
                            Image.asset(
                          imageList[itemIndex],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    imageList.length,
                    (index) => Container(
                      width: index == _currentSlide ? 10 : 4,
                      height: 4,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color:
                            index == _currentSlide ? Colors.black : Colors.grey,
                        borderRadius: index == _currentSlide
                            ? BorderRadius.circular(2)
                            : BorderRadius.circular(30),
                      ),
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
                              color: primary,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListProduk(
                                        type: "pick",
                                      )),
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
                                      fontWeight: FontWeight.bold,
                                      color: primary,
                                    ),
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
                                            backgroundColor: primaryPastel,
                                            radius: 23,
                                            child: Icon(
                                              Icons.shopping_bag,
                                              size: 30,
                                              color: primary,
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
                              color: secondary,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListProduk(
                                        type: "deliv",
                                      )),
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
                                      color: secondary,
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
                                          backgroundColor: secondaryPastel,
                                          child: Icon(
                                            Icons.motorcycle,
                                            size: 30,
                                            color: secondary,
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
                ListTile(
                  leading: Icon(
                    Icons.abc,
                    size: 17,
                  ),
                  subtitle:
                      Text("Fore Coffee sudah tersertifikasi halal oleh MUI"),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 17,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.abc,
                    size: 17,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Dirjen Perlindungan Konsumen dan Tata Tertib Niaga."),
                      Text("Kementrian Perdagangan Republik Indonesia"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Whatsapp Dirjen PKTN: 0853-1111-1010",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
