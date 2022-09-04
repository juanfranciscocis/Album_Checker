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

          Positioned(child: Text('WELCOME', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),), top: 100, left: 110,),


          _MainCardWidget(),


          newToAppText(size, context)

        ],
      )
    );
  }

  Positioned newToAppText(Size size, BuildContext context) {
    return Positioned(
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
            ));
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
              ),
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
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
            _Email(),
              const SizedBox(
                height: 40,
              ),
            _Password(),

              const SizedBox(
                height: 40,
              ),
              
              MaterialButton(
                child: Container(
                    width: 161,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius : BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color : Color.fromRGBO(105, 143, 63, 1),
                    ),
                  child: Icon(Icons.arrow_forward, color: Colors.white, size: 30,),
                ),
                  onPressed: (){
                    print('Login');
                }
              )








            ]
          )
        )
      ),
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      height: 48,
      decoration: BoxDecoration(
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        color : Color.fromRGBO(105, 143, 63, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter your email',
            icon : Icon(Icons.email, color: Colors.white,),
          ),
          //TODO: ADD CONTROLLER
        ),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      height: 48,
      decoration: BoxDecoration(
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        color : Color.fromRGBO(105, 143, 63, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter your password',
            icon : Icon(Icons.lock, color: Colors.white,),
          ),
          //TODO: ADD CONTROLLER
        ),
      ),
    );
  }
}

