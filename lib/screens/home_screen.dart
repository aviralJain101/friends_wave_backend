import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friends_wave/screens/profile_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../components/search_bar.dart';
import 'settings_screen.dart';
import 'chat_screen.dart';

enum MenuItem { item1, item2, item3, item4, item5 }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;

    Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  
@override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FRIENDS WAVE'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
            PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value == MenuItem.item5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()),
                  );
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: MenuItem.item1,
                  child: ListTile(
                    title: Text('New group'),
                  ),
                ),
                const PopupMenuItem(
                  value: MenuItem.item2,
                  child: ListTile(
                    title: Text('New broadcast'),
                  ),
                ),
                const PopupMenuItem(
                  value: MenuItem.item3,
                  child: ListTile(
                    title: Text('Whatsapp web'),
                  ),
                ),
                const PopupMenuItem(
                  value: MenuItem.item4,
                  child: ListTile(
                    title: Text('Starred messages'),
                  ),
                ),
                const PopupMenuItem(
                  value: MenuItem.item5,
                  child: ListTile(
                    title: Text('Settings'),
                  ),
                )
              ],
            ),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'MATCH',
              ),
              Tab(
                text: 'PROFILE',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatScreen(),
            ChatScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}