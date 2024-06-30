import 'package:floor/floor.dart';

@Entity(tableName: "utilisateur")
class Utilisateur {
  
  @PrimaryKey(autoGenerate: true)
  int? id;
  String nom;
  String prenom;

  Utilisateur({this.id, required this.nom, required this.prenom});



}
