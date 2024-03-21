import 'package:chandoiqua/Views/home/body.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
      ),
      body: const CustomBody(),
    );
  }
}
