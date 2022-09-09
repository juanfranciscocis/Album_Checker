import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_navigation_provider.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatorProvider = Provider.of<NavigationProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1) ,
      body: Center(
        child: Text('ProfileScreen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigatorProvider.currentPage,
        onTap: (index){
          navigatorProvider.currentPage = index;
          Navigator.pushReplacementNamed(context, navigatorProvider.page);
        },
        backgroundColor: Color.fromRGBO(20, 40, 29, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_justify_outlined,size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle,size: 30,),
            label: 'Unchecked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,size: 30),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color.fromRGBO(105, 143, 63, 1),
      ),
    );
  }
}