import 'package:chesk/bottom_tabs/bottom_nav_items.dart';
import 'package:chesk/ui/main/downloading/downloading_page.dart';
import 'package:chesk/ui/main/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about/about_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {

  @override
  Widget build(BuildContext mainContext) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned(
            child: CupertinoTabScaffold(
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(builder: (context){
                  switch(index){
                    case 0:
                      return DownloadingPage(title: widget.title, mainContext: mainContext);
                    case 1:
                      return SettingsPage(title: widget.title);
                    case 2:
                      return AboutPage(title: widget.title);
                    default:
                      return CupertinoPageScaffold(child: Center(child: Text('что-то пошло не так'),),);
                  }
                },
                );
              },
              tabBar: CupertinoTabBar(
                onTap: (index){

                },
                items: tabItems
                    .map((item) => BottomNavigationBarItem(
                    icon: item.icon!, label: item.title ?? ''))
                    .toList(),
              ),
            ),

          )
        ]

      ),
    );
  }
  @override
  initState(){
    super.initState();
  }
}
