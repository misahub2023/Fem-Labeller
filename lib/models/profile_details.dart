class ProfileDetails {
  ProfileDetails({
    required this.userEmail,
    required this.name,
    required this.affiliation,
    required this.experienceInThisField,
    required this.numberOfCapsulesRead,
  });
  late String userEmail;
  late String name;
  late String affiliation;
  late String experienceInThisField;
  late String numberOfCapsulesRead;

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    ProfileDetails(
      userEmail: json["email"],
      name: json["name"],
      affiliation: json["affiliation"],
      experienceInThisField: json["experience in this field"],
      numberOfCapsulesRead: json["number of capsules read"],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data["userEmail"] = userEmail;
    data["name"] = name;
    data["affiliation"] = affiliation;
    data["experience in this field"] = experienceInThisField;
    data["number of capsules read"] = numberOfCapsulesRead;

    return data;
  }
}
