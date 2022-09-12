import 'dart:async';

import 'package:album_checker/providers/team_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_navigation_provider.dart';

class HomeScreen extends StatefulWidget{

const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late InterstitialAd _interstitialAd;

  @override
  void initState() {
    super.initState();
    // Load ads.
    _initAd();
  }

  void _initAd(){
    print('init ad');
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3104071700346749/2972082735',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: (error){
            print('Ad failed to load: $error');
          }
      ),
    );

  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    print('Ad loaded.');
  }

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 10), () {
      print('SHOWING AD');
      _interstitialAd.show();
    });



    final navigatorProvider = Provider.of<NavigationProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1) ,
      body: FutureBuilder(
        future: TeamListProvider().getTeams(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return Center(
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return _Team(teamID: snapshot.data[index].id,teamLogo: snapshot.data[index].teamLogo,teamName: snapshot.data[index].teamName,);
                  }),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
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



class _Team extends StatelessWidget {


  final int? teamID;
  final String? teamName;
  final String? teamLogo;




  const _Team({
    Key? key,
    this.teamName,
    this.teamLogo,
    this.teamID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/players',arguments: teamID);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: Color.fromRGBO(20, 40, 29, 1),
          elevation: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(20, 40, 29, 1),
            ),
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
                    height: 150,
                  ),
                ),
                SizedBox(height: 20),
                Text(teamName!.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20),),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

