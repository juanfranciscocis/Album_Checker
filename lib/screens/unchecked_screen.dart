import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_navigation_provider.dart';
import '../providers/players_list_provider.dart';

class UncheckedScreen extends StatefulWidget{
  const UncheckedScreen({Key? key}) : super(key: key);

  @override
  State<UncheckedScreen> createState() => _UncheckedScreenState();
}

class _UncheckedScreenState extends State<UncheckedScreen> {
  @override
  Widget build(BuildContext context) {
    final navigatorProvider = Provider.of<NavigationProvider>(context, listen: false);
    final playersListProvider = Provider.of<PlayersListProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1) ,
      body: FutureBuilder(
        future: playersListProvider.getPlayersByUncheked(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: playersListProvider.players.length,
              itemBuilder: (context, index) {
                final playerID = playersListProvider.players[index].teamID;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Color.fromRGBO(20, 40, 29, 1),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: 100,
                      //height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                            title: Text(
                                playerID == 1 ? 'QATAR' : playerID == 2 ? 'ECUADOR' : playerID == 3 ? 'SENEGAL' : playerID == 4 ? 'NETHERLANDS' : playerID == 5 ? 'ENGLAND' : playerID == 6 ? 'IRAN' : playerID == 7 ? 'USA' : playerID == 8 ? 'WHALES' : playerID == 9 ? 'ARGENTINA' : playerID == 10 ? 'SAUDI ARABIA' : playerID == 11 ? 'MEXICO' : playerID == 12 ? 'POLAND' : playerID == 13 ? 'FRANCE' : playerID == 14 ? 'AUSTRALIA' : playerID == 15 ? 'DENMARK' : playerID == 16 ? 'TUNISIA' : playerID == 17 ? 'SPAIN' : playerID == 18 ? 'COSTA RICA' : playerID == 19 ? 'GERMANY' : playerID == 20 ? 'JAPAN' : playerID == 21 ? 'BELGIUM' : playerID == 22 ? 'CANADA' : playerID == 23 ? 'MORROCCO' : playerID == 24 ? 'CROATIA' : playerID == 25 ? 'BRAZIL' : playerID == 26 ? 'SERBIA' : playerID == 27 ? 'SWITZERLAND' : playerID == 28 ? 'CAMERROON' : playerID == 29 ? 'PORTUGAL' : playerID == 30 ? 'GHANA' : playerID == 31 ? 'URUGUAY' : playerID == 32 ? 'KOREA' : 'FIFA MUSEUM',
                                style: TextStyle(color: Colors.white, fontSize: 20)),
                            subtitle: Text(playersListProvider.players[index].playerPosition.toString(),style: TextStyle(color: Colors.white, fontSize: 15),),
                            trailing: CupertinoSwitch(
                              value: playersListProvider.players[index].playerChecked == 'true'? true: false,
                              onChanged: (bool value) {
                                playersListProvider.players[index].playerChecked = value.toString();
                                playersListProvider.updatePlayer(playersListProvider.players[index]);
                                print(playersListProvider.players[index].playerChecked);
                                setState(() {

                                });
                              },
                            )
                        ),
                      ),
                    ),
                  ),
                );
              },
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