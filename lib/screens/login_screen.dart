import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //screen size
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1),
      body: Stack(
        children: [
          topCircle(size),

          _MainCardWidget(),


          Positioned(
              bottom: 0,
              left: size.width *0.27,


              child:GestureDetector(
                onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      LoginScreen()), (Route<dynamic> route) => false);
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.3,
                  child: Text('New to the app? Register',textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
          ),),
                ),
              ))

        ],
      )
    );
  }

  Positioned topCircle(Size size) {
    return Positioned(
          top: -225,
          child: Container(
              width: size.width,
              height: 410,
              decoration: const BoxDecoration(
                boxShadow : [BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0,4),
                    blurRadius: 4
                )],
                color : Color.fromRGBO(105, 143, 63, 1),
                borderRadius : BorderRadius.all(Radius.elliptical(414, 410)),
              )
          ),
        );
  }
}

class _MainCardWidget extends StatelessWidget {
  const _MainCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.3,
      left: size.width * 0.09,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: const Color.fromRGBO(20, 40, 29, 1),
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.35,
        ),
      ),
    );
  }
}