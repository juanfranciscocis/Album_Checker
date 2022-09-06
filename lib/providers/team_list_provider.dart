

import 'package:album_checker/providers/db_provider.dart';
import 'package:flutter/material.dart';

import '../models/team_model.dart';

class TeamListProvider extends ChangeNotifier {
  List<TeamModel> teams = [TeamModel(teamName: '  ')];
  bool isLoading = false;



  getTeams() async {
    isLoading = true;


    this.teams = await DBProvider.db.getAllTeams();

    this.teams = [...teams];


    isLoading = false;

    notifyListeners();

    return teams;
  }





}