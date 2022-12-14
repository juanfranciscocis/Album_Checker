import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../helpers/ad_helper.dart';
import '../providers/bottom_navigation_provider.dart';
import '../providers/login_form_provider.dart';
import '../services/login_firebase_service.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      adUnitId: AdHelper.interstitialAdID,
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
    final loginFirebaseService = Provider.of<LoginFirebaseService>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1) ,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150,),
            Center(
              child: Container(
                width: double.infinity,
                //height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    color: Color.fromRGBO(105, 143, 63, 1),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200.0, left: 50.0, right: 50.0, bottom: 200.0),
                      child: MaterialButton(
                        height: 70,
                        color: Color.fromRGBO(20, 40, 29, 1),
                        onPressed: (){
                          loginFirebaseService.logout();
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: Text('LOGOUT', style: TextStyle(color: Colors.white,fontSize: 30),),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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