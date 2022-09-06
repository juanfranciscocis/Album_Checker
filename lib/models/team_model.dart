


class TeamModel {
  int? id;
  String? teamName;
  String? teamLogo;

  TeamModel({
      this.id,
      this.teamName,
      this.teamLogo
  });


  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
      id: json["id"],
      teamName: json["team_name"],
      teamLogo: json["team_logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_name": teamName,
    "team_logo": teamLogo,
  };


}