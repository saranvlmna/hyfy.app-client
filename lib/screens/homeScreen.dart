// ignore: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/chatsPage.dart';
import '../pages/matchesPage.dart';
import '../pages/newFeedsPage.dart';
import '../pages/profilePage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('');

  final pages = const [
    NewFeedsPage(),
    MatchesPage(),
    ChatsPage(),
    ProfilePage()
  ];
  void onNavigationItemSelected(index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 70,
          title: ValueListenableBuilder(
              valueListenable: title,
              builder: (BuildContext context, String value, _) {
                return Text(value);
              }),
          leading: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'hYfY',
                style: TextStyle(
                    color: const Color.fromRGBO(152, 153, 165, 1),
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Ysabeau'),
              )),
        ),
        body: ValueListenableBuilder(
            valueListenable: pageIndex,
            builder: (BuildContext context, int value, _) {
              return pages[value];
            }),
        bottomNavigationBar: bottomNavigationBar(
          onItemSelected: onNavigationItemSelected,
        ));
  }
}

// ignore: camel_case_types
class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);
  final ValueChanged<int> onItemSelected;

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

// ignore: camel_case_types
class _bottomNavigationBarState extends State<bottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelectted(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigaionBarItem(
                index: 0,
                icon: CupertinoIcons.cube_fill,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelectted),
            NavigaionBarItem(
                index: 1,
                icon: CupertinoIcons.heart_fill,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelectted),
            NavigaionBarItem(
                index: 2,
                icon: CupertinoIcons.chat_bubble_fill,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelectted),
            NavigaionBarItem(
                index: 3,
                icon: CupertinoIcons.person_fill,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelectted),
          ],
        ));
  }
}

class NavigaionBarItem extends StatelessWidget {
  const NavigaionBarItem(
      {Key? key,
      required this.icon,
      required this.index,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);

  final int index;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        height: 75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Color.fromARGB(255, 239, 157, 157) : null,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
