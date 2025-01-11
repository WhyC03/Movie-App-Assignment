import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/search_screen.dart';

class ActualScreen extends StatefulWidget {
  static const String routeName = '/actual-screen';
  const ActualScreen({super.key});

  @override
  State<ActualScreen> createState() => _ActualScreenState();
}

class _ActualScreenState extends State<ActualScreen> {
  int _page = 0;

  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    const Center(child: Text('Downloads Page \n To be made later')),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _page,
          children: pages,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _page = 0;
                      });
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.blue.shade300,
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.home_outlined,
                              color: _page == 0 ? Colors.black : Colors.grey),
                          SizedBox(height: 5),
                          Text(
                            "Home",
                            style: TextStyle(
                                color: _page == 0 ? Colors.black : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _page = 1;
                      });
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.green.shade300,
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.search_outlined,
                              color: _page == 1 ? Colors.black : Colors.grey),
                          SizedBox(height: 5),
                          Text(
                            "Search",
                            style: TextStyle(
                                color: _page == 1 ? Colors.black : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _page = 2;
                      });
                    },
                    child: Container(
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.green.shade300,
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.download_rounded,
                              color: _page == 2 ? Colors.black : Colors.grey),
                          SizedBox(height: 5),
                          Text(
                            "Downloads",
                            style: TextStyle(
                                color: _page == 2 ? Colors.black : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //     onTap: updatePage,
        //     currentIndex: _page,
        //     iconSize: 28,
        //     items: [
        //       BottomNavigationBarItem(
        //         icon: Container(
        //           width: bottomBarWidth,
        //           child: const Icon(Icons.home_outlined),
        //         ),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Container(
        //           width: bottomBarWidth,
        //           child: const Icon(Icons.search),
        //         ),
        //         label: 'Search',
        //       ),
        //     ]),
      ),
    );
  }
}
