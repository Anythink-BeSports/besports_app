import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Setting'),
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold
        ),
        toolbarHeight: 85,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}