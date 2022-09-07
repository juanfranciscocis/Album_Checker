import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players_list_provider.dart';

class PlayersScreen extends StatefulWidget{
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  @override
  Widget build(BuildContext context) {
    final teamID = ModalRoute.of(context)!.settings.arguments as int;
    final playersListProvider = Provider.of<PlayersListProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 209, 121, 1) ,

      appBar: AppBar(
        title: Text('Players'),
        backgroundColor: Color.fromRGBO(20, 40, 29, 1),
        elevation: 10,
      ),

      body: FutureBuilder(
        future: playersListProvider.getPlayersByTeamID(teamID),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: playersListProvider.players.length,
              itemBuilder: (context, index) {
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
                          subtitle: Text(playersListProvider.players[index].playerName!,style: TextStyle(color: Colors.white, fontSize: 10)),
                          title: Text(playersListProvider.players[index].playerPosition.toString(),style: TextStyle(color: Colors.white, fontSize: 30),),
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
    );
  }
}