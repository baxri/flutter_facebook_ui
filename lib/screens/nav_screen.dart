import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOffOutline,
    Icons.menu
  ];

  int selectedIndex = 0;

  void onTabChange(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screens.length,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: _CustomTabBar(
            index: selectedIndex,
            onTabChange: onTabChange,
            icons: icons,
          ),
        ),
      ),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  final int index;
  final Function onTabChange;
  final List<IconData> icons;

  const _CustomTabBar({Key key, this.index, this.onTabChange, this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTabChange,
        indicator: BoxDecoration(
            border: Border(
                top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
                i,
                Tab(
                  child: Icon(
                    e,
                    color: i == index ? Palette.facebookBlue : Colors.black45,
                    size: 26.0,
                  ),
                )))
            .values
            .toList());
  }
}
