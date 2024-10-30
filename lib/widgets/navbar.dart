import "package:perpustakaan/const.dart";
import "package:flutter/material.dart";

// ignore: must_be_immutable
class Navbar extends StatefulWidget {
  int activePage;
  Navbar(this.activePage);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void getLink(index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/f');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/n');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/land');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: appBackgroundColor,
        elevation: 5,
        iconSize: 32,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: buttonColor,
        unselectedItemColor: Colors.black45,
        currentIndex: widget.activePage,
        onTap: getLink,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white.withOpacity(0.05),
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white.withOpacity(0.05),
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white.withOpacity(0.05),
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white.withOpacity(0.05),
            icon: Icon(Icons.person),
            label: '',
          ),
        ]);
  }
}
