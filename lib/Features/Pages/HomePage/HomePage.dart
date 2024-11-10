// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Presentation/GalleryScreen.dart';
import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Presentation/RepoScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _Screens = [const PhotoGalleryPage(), const RepoScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: _Screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(label: 'Gallery', icon: Icon(Icons.image)),
            BottomNavigationBarItem(
                label: 'Git Repo', icon: Icon(FontAwesomeIcons.github))
          ]),
    );
  }
}
