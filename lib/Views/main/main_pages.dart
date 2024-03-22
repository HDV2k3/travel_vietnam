import 'package:chandoiqua/Views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0x1A000000),
              width: 0.5,
            ),
          ),
        ),
        child: _buildBottomNavigationBar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  Color deepSeaBlue = const Color(0xFF0A56A0);
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: deepSeaBlue,
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        selectedItemColor: deepSeaBlue, // Change the selected icon color
        // unselectedItemColor: Colors.white, // Change the unselected icon color
        selectedLabelStyle:
            TextStyle(color: deepSeaBlue), // Change the selected label color
        // unselectedLabelStyle:
        //     TextStyle(color: Colors.white), // Change the unselected label color
        items: [
          _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
          _buildBottomNavigationBarItem(Icons.search, 'Search', 1),
          _buildBottomNavigationBarItem(Icons.favorite, 'Favorite', 2),
          _buildBottomNavigationBarItem(Icons.post_add, 'Stories', 3),
          _buildBottomNavigationBarItem(Icons.person, 'Profile', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: InkWell(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _selectedTabIndex == index ? deepSeaBlue : Colors.transparent,
          ),
          child: Icon(
            icon,
            color: _selectedTabIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
      label: label,
    );
  }

  Widget _buildBody() {
    switch (_selectedTabIndex) {
      case 0:
        return const HomeScreen();

      default:
        return const SizedBox();
    }
  }
}
