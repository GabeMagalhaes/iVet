import 'package:cloud_firestore/cloud_firestore.dart';

class Pet{

  final String uid;
  final String userID;
  final String userName;
  final String name;
  final String species;
  final String breed;
  final String genre;
  final Timestamp birthDate;

  Pet(
    {
      required this.uid,
      required this.userID,
      required this.userName,
      required this.name,
      required this.species,
      required this.breed,
      required this.genre,
      required this.birthDate
      }
  );
}