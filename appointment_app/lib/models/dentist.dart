import 'dart:convert';

class Dentist {
  int dId;
  String firstName;
  String lastName;
  int userID;
  
  Dentist({
    required this.dId,
    required this.firstName,
    required this.lastName,
    required this.userID,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'dId': dId,
      'firstName': firstName,
      'lastName': lastName,
      'userID': userID,
    };
  }

  factory Dentist.fromMap(Map<String, dynamic> map) {
    return Dentist(
      dId: map['dId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      userID: map['userID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Dentist.fromJson(String source) => Dentist.fromMap(json.decode(source));
}
