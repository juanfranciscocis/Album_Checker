import 'package:album_checker/screens/home_screen.dart';
import 'package:album_checker/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../services/login_firebase_service.dart';


class CheckAuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<LoginFirebaseService>( context, listen: false );

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

            if ( !snapshot.hasData )
              return Text('');

            if ( snapshot.data == '' ) {
              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: ( _, __ , ___ ) => LoginScreen(),
                    transitionDuration: Duration( seconds: 0)
                )
                );

              });

            } else {

              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: ( _, __ , ___ ) => HomeScreen(),
                    transitionDuration: Duration( seconds: 0)
                )
                );

              });
            }

            return Container();

          },
        ),
      ),
    );
  }
}