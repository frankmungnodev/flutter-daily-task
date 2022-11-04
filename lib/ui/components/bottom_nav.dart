import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;
  final void Function(int position) onClickItem;

  const BottomNav({
    Key? key,
    required this.currentIndex,
    required this.onClickItem,
  }) : super(key: key);

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onClickItem,
      currentIndex: widget.currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          activeIcon: Icon(CupertinoIcons.house_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chart_pie),
          activeIcon: Icon(CupertinoIcons.chart_pie_fill),
          label: 'Statics',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.gear_alt),
          activeIcon: Icon(CupertinoIcons.gear_alt_fill),
          label: 'Settings',
        )
      ],
    );
  }
}
