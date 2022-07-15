import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/pages/bookmark_list_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/repository/providers/page_provider.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    HomePageView(),
    BookmarkListPage(),
    Column(children: [
      const SizedBox(height: 120),
      flexibleText(
          text: 'Search',
          fontFamily: 'Lato',
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
          fontWeight: FontWeight.bold,
          fontSize: 40,
          textColor: kPrimaryColor),
      const SizedBox(height: 30),
      SearchWidget(),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);

    return Scaffold(
      backgroundColor: kDarkColor,
      body: Center(
        child: _children[provider.getCurrentIndex],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: kDarkColor,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kDarkGreyFontColor,
          onTap: provider.onTabTapped,
          currentIndex: provider.getCurrentIndex,
          elevation: 0.0,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/home.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/love.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/search.png')),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
