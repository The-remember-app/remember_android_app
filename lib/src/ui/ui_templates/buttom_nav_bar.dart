import 'package:flutter/material.dart';
// import 'flutterViz_bottom_navigationBar_model.dart';




class MainBottomNavigationBar extends StatefulWidget {



  MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() => _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  List<BottomNavigationBarItem> flutterVizBottomNavigationBarItems =
  [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.remove), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.remove), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.remove), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
  ];

  @override
  Widget build(BuildContext context) {
    // flutterVizBottomNavigationBarItems[0].icon
    return BottomNavigationBar(
        items: flutterVizBottomNavigationBarItems
            .map((BottomNavigationBarItem item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            label: item.label,
          );
        }).toList(),
        backgroundColor: Color(0xffffffff),
        currentIndex: 0,
        elevation: 8,
        iconSize: 24,
        selectedItemColor: Color(0xff3a57e8),
        unselectedItemColor: Color(0xff9e9e9e),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) async {

          if (value == 0){
            await Navigator.pushNamed(
                  context,
                  '/root_folder',
                  arguments: Map<String, dynamic>(),
                );
          } else if (value == 4){

            await Navigator.pushNamed(
                  context,
                  '/my_account',
                  arguments: Map<String, dynamic>(),
                );
          }

          print(value);

        },
      );
  }
}