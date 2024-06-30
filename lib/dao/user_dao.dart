import 'package:floor/floor.dart';
import 'package:projet_application/entity/user_entity.dart';

@dao
abstract class UtilisateurDAO {
  @Query("SELECT * FROM utilisateur ORDER BY id DESC")
  Future<List<Utilisateur>> findAllUser();

  @Query("SELECT * FROM utilisateur WHERE id=:id")
  Future<Utilisateur?> findUser(int id);

  @Query("DELETE FROM utilisateur WHERE id=:id")
  Future<void> deleteUser(int id);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(Utilisateur user);

  @insert
  Future<void> insertUtilisateur(Utilisateur user);

  



}
