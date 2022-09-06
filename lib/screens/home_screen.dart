import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/team_list_provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final teamListProvider = Provider.of<TeamListProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Team(teamLogo: teamListProvider.teams[0].teamLogo,teamName: teamListProvider.teams[0].teamName,),
                      SizedBox(width: 30),
                      _Team(teamLogo: teamListProvider.teams[0].teamLogo,teamName: teamListProvider.teams[0].teamName,),
                    ]
                  ),

                ]
              ),
            )
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(20, 40, 29, 1),
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_justify_outlined,size: 30,),
            label: 'Home',
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

class _Team extends StatelessWidget {

  final String? teamName;
  final String? teamLogo;


  const _Team({
    Key? key,
    this.teamName,
    this.teamLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('tap');
        //Navigator.of(context).pushNamed('/team');
      },
      child: Card(
        color: Color.fromRGBO(105, 143, 63, 1),
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(105, 143, 63, 1),
          ),
          width: 150,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(teamLogo!),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(teamName!.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20),),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}