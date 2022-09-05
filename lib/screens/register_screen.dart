import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //screen size
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Column(
            children: [

              //SizedBox(height: size.height * 0.1),

              Stack(
                children: [
                  topCircle(size),
                  Padding(
                    padding: const EdgeInsets.all(75),
                    child: Center(child: Column(
                      children: [
                        Text('REGISTER AN ACCOUNT AT THE ALBUM CHECKER APP', textAlign: TextAlign.justify,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                        SizedBox(height: size.height * 0.05),
                        Text('⚽',style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),),
                      ],
                    )),
                  ),
                ],
              ),






              SizedBox(height: size.height * 0.1),


              _MainCardWidget(),


              newToAppText(size, context)

            ],
          ),
        ),
      )
    );
  }

  Widget newToAppText(Size size, BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            LoginScreen()), (Route<dynamic> route) => false);
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height * 0.3,
        child: Text('All ready have an account? Login',textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.bold,
        fontSize: 15,
        ),),
      ),
    );
  }

  Widget topCircle(Size size) {
    return Container(
        width: size.width,
        height: 400,
        decoration: const BoxDecoration(
          boxShadow : [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0,4),
              blurRadius: 4
          )],
          color : Color.fromRGBO(105, 143, 63, 1),
          borderRadius : BorderRadius.only(bottomLeft: Radius.elliptical(414, 410), bottomRight: Radius.elliptical(414, 410)),
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
    return Card(
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromRGBO(20, 40, 29, 1),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              const SizedBox(
                height: 40,
              ),
            _Name(),
              const SizedBox(
                height: 40,
              ),
            _Age(),
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
          ),
        )
      )
    );
  }
}

class _Age extends StatelessWidget {
  const _Age({
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
            hintText: 'Enter your age',
            icon : Icon(Icons.numbers, color: Colors.white,),
          ),
          //TODO: ADD CONTROLLER
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
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
          hintText: 'Enter your full name',
          icon : Icon(Icons.person, color: Colors.white,),
        ),
        //TODO: ADD CONTROLLER
      ),
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

