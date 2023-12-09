import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  // String profilePhoto; // we are saving photo url not photo that's why string
  String email;
  String uid;
  User(
      {required this.name,
      // required this.profilePhoto,
      required this.email,
      required this.uid});

  //convert to map
  Map<String, dynamic> tojson() => {
        "name": name,
        // "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  // convert a DocumentSnapshot from Firestore into a User model
  static User fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapShot['email'],
      // profilePhoto: snapShot['profilePhoto'],
      uid:snapShot['uid'],
      name: snapShot['name'],
    );
  }
}
