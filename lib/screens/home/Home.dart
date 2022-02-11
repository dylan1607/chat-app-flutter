import 'package:chat/components/bodyHome.dart';
import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.person_add_alt_1),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      // Animation when clicking on the bottom navigation bar
      type: BottomNavigationBarType.fixed,
      // set current index when click on tab
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      // List items in bottom navigation bar
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Contact",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: "Call",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('Chat'),
      actions: [IconButton(icon: Icon(Icons.create_sharp), onPressed: () {})],
    );
  }
}
