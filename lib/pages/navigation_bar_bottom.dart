import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradeuz/common/router/route_name.dart';


class BottomBarPage extends StatefulWidget {
  final Widget child;
  const BottomBarPage({super.key, required this.child,});
  static const id = "bottom_bar";
  
  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}


class _BottomBarPageState extends State<BottomBarPage> {


  int selectedIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 16,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
          if(index == 1 ){
           context.go(AppRouteName.loginPage);
        }else{
            context.go(AppRouteName.homePage);
           }},

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Kirish", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
