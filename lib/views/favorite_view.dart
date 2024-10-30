import 'package:perpustakaan/const.dart';
import 'package:perpustakaan/widgets/navbar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
        title: const Text('Favorite'),
      ),
      body: Container(
        color: appBackgroundColor,
        child: Container(
          color: appBackgroundColor,
          child: Center(
            child: Icon(
              Icons.favorite,
              color: Color(0xFFffb43b),
              size: 100,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(1),
    );
  }
}
