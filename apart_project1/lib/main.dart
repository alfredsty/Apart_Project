import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Tabbar/FirstTab.dart';
import 'Tabbar/SecondTab.dart';
import 'Tabbar/ThirdTab.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final BannerAd myBanner = BannerAd(
    // Test 광고 ID, 광고 승인받은 후 생성한 광고 unit ID 로 바꾸기
    adUnitId: Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111' // Android ad unit ID
        : 'ca-app-pub-3940256099942544/2934735716', // iOS ad unit ID
    size: AdSize.largeBanner,
    request: AdRequest(),
    listener: BannerAdListener(
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
      },
    ),
  );

  @override
  void initState() {
    super.initState();
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              SizedBox(width: 3),
              Text(
                'xxx 아파트 xx 단지',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: 35,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 30,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.qrcode,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.only(right: 10),
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bell,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        body: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Builder(
            builder: (context) {
              DefaultTabController.of(context)?.addListener(
                () {
                  setState(() {});
                },
              );
              return Scaffold(
                body: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120,
                          color: Colors.black,
                          child: TabBarView(
                            children: [FirstTab(), SecondTab(), ThirdTab()],
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 88),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  child: TabPageSelector(
                                    color: DefaultTabController.of(context)
                                                ?.index ==
                                            1
                                        ? Colors.grey
                                        : Colors.grey,
                                    selectedColor:
                                        DefaultTabController.of(context)
                                                    ?.index ==
                                                1
                                            ? Colors.orange
                                            : Colors.orange,
                                    indicatorSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: myBanner.size.width.toDouble(),
                      height: myBanner.size.height.toDouble(),
                      child: AdWidget(ad: myBanner),
                    ),
                    Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 398,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => {},
          currentIndex: 0,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 28,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fmd_good_outlined),
              label: '내 근처',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined),
              label: '아파트 생활',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '홈',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: '채팅',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: '나의 정보',
            ),
          ],
        ),
      ),
    );
  }
}
