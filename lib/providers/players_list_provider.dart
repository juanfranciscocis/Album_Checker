


import 'package:album_checker/models/player_model.dart';
import 'package:album_checker/providers/db_provider.dart';
import 'package:flutter/material.dart';

import '../models/team_model.dart';

class PlayersListProvider extends ChangeNotifier {
  List<PlayerModel> players = [];
  bool isLoading = false;







  getPlayersByTeamID(int index) async {
    isLoading = true;


    this.players = await DBProvider.db.getPlayersById(index);

    this.players = [...players];

    print(players[0].playerName);


    isLoading = false;

    notifyListeners();

    return players;
  }

  getPlayersByUncheked() async {
    isLoading = true;


    this.players = await DBProvider.db.getPlayersByUnChecked('false');

    this.players = [...players];

    print(players[0].playerName);


    isLoading = false;

    notifyListeners();

    return players;
  }




  Future<void> updatePlayer(PlayerModel player) async {
    await DBProvider.db.updatePlayer(player);
    notifyListeners();
  }





}