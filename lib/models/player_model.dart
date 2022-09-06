

class PlayerModel {
  int? id;
  int? playerPosition;
  String? playerName;
  String? playerChecked;
  int? teamID;

  PlayerModel({
    this.id,
    this.playerPosition,
    this.playerName,
    this.playerChecked,
    this.teamID,
  });


  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
    id: json["id"],
    playerPosition: json["player_position"],
    playerName: json["player_name"],
    playerChecked: json["player_checked"],
    teamID: json["team_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "player_position": playerPosition,
    "player_name": playerName,
    "player_checked": playerChecked,
    "team_id": teamID,
  };

  bool asignCheckValue(){
    if (playerChecked == 'TRUE'){
      return true;
    }else{
      return false;
    }
  }



}