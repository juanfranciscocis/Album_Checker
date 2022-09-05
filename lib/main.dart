import 'package:album_checker/providers/providers.dart';
import 'package:album_checker/screens/screens.dart';
import 'package:album_checker/services/login_firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/login_firebase_model.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}




class AppState extends StatelessWidget{
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (_) => LoginFirebaseService()),
      ChangeNotifierProvider(create: (_) => LoginFormProvider()),
    ], child: const MyApp());
  }
}



class MyApp extends StatelessWidget{
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => RegisterScreen(),
        '/home': (BuildContext context) => HomeScreen(),

      },
    );
  }




}