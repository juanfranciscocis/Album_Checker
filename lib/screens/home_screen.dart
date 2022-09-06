import 'package:album_checker/providers/team_list_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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