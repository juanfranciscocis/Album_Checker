

import 'package:album_checker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/db_provider.dart';
import '../providers/team_list_provider.dart';

class LoadingScreen extends StatelessWidget{


  LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamListProvider = Provider.of<TeamListProvider>(context);
    teamListProvider.getTeams();



    return Scaffold(
      body: Center(
        child: (teamListProvider.isLoading == true)? HomeScreen() : HomeScreen(),
      ),
    );
    Navigator.pushReplacementNamed(context, '/home');
  }
}