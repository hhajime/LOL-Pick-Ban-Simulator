/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/getx/getx.dart';
import 'package:get/get.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('savedData');

final upController = Get.put(UpdateController());

class Database {
  static String? userUid;

  static Future<void> addItem({
    required String blueBan1,
    required String blueBan2,
    required String blueBan3,
    required String blueBan4,
    required String blueBan5,
    required String bluePlayer1,
    required String bluePlayer1Name,
    required String bluePlayer2,
    required String bluePlayer2Name,
    required String bluePlayer3,
    required String bluePlayer3Name,
    required String bluePlayer4,
    required String bluePlayer4Name,
    required String bluePlayer5,
    required String bluePlayer5Name,
    required String blueTeamName,
    required String redBan1,
    required String redBan2,
    required String redBan3,
    required String redBan4,
    required String redBan5,
    required String redPlayer1,
    required String redPlayer1Name,
    required String redPlayer2,
    required String redPlayer2Name,
    required String redPlayer3,
    required String redPlayer3Name,
    required String redPlayer4,
    required String redPlayer4Name,
    required String redPlayer5,
    required String redPlayer5Name,
    required String redTeamName,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('savedData').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "blueBan1": upController.blueBan[0],
      "blueBan2": upController.blueBan[1],
      "blueBan3": upController.blueBan[2],
      "blueBan4": upController.blueBan[3],
      "blueBan5": upController.blueBan[4],
      "bluePlayer1": upController.bluPlayer[0],
      "bluePlayer1Name": upController.bluPlayerName[0],
      "bluePlayer2": upController.bluPlayer[1],
      "bluePlayer2Name": upController.bluPlayerName[1],
      "bluePlayer3": upController.bluPlayer[2],
      "bluePlayer3Name": upController.bluPlayerName[2],
      "bluePlayer4": upController.bluPlayer[3],
      "bluePlayer4Name": upController.bluPlayerName[3],
      "bluePlayer5": upController.bluPlayer[4],
      "bluePlayer5Name": upController.bluPlayerName[4],
      "blueTeamName": upController.blueTeamName.toString(),
      "redBan1": upController.redBan[0],
      "redBan2": upController.redBan[1],
      "redBan3": upController.redBan[2],
      "redBan4": upController.redBan[3],
      "redBan5": upController.redBan[4],
      "redPlayer1": upController.redPlayer[0],
      "redPlayer1Name": upController.redPlayerName[0],
      "redPlayer2": upController.redPlayer[1],
      "redPlayer2Name": upController.redPlayerName[1],
      "redPlayer3": upController.redPlayer[2],
      "redPlayer3Name": upController.redPlayerName[2],
      "redPlayer4": upController.redPlayer[3],
      "redPlayer4Name": upController.redPlayerName[3],
      "redPlayer5": upController.redPlayer[4],
      "redPlayer5Name": upController.redPlayerName[4],
      "redTeamName": upController.redTeamName.toString(),
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes addData added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('savedData');

    return notesItemCollection.snapshots();
  }

  static Future<void> updateItem({
    required String blueBan1,
    required String blueBan2,
    required String blueBan3,
    required String blueBan4,
    required String blueBan5,
    required String bluePlayer1,
    required String bluePlayer1Name,
    required String bluePlayer2,
    required String bluePlayer2Name,
    required String bluePlayer3,
    required String bluePlayer3Name,
    required String bluePlayer4,
    required String bluePlayer4Name,
    required String bluePlayer5,
    required String bluePlayer5Name,
    required String blueTeamName,
    required String redBan1,
    required String redBan2,
    required String redBan3,
    required String redBan4,
    required String redBan5,
    required String redPlayer1,
    required String redPlayer1Name,
    required String redPlayer2,
    required String redPlayer2Name,
    required String redPlayer3,
    required String redPlayer3Name,
    required String redPlayer4,
    required String redPlayer4Name,
    required String redPlayer5,
    required String redPlayer5Name,
    required String redTeamName,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('savedData').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "blueBan1": upController.blueBan[0],
      "blueBan2": upController.blueBan[1],
      "blueBan3": upController.blueBan[2],
      "blueBan4": upController.blueBan[3],
      "blueBan5": upController.blueBan[4],
      "bluePlayer1": upController.bluPlayer[0],
      "bluePlayer1Name": upController.bluPlayerName[0],
      "bluePlayer2": upController.bluPlayer[1],
      "bluePlayer2Name": upController.bluPlayerName[1],
      "bluePlayer3": upController.bluPlayer[2],
      "bluePlayer3Name": upController.bluPlayerName[2],
      "bluePlayer4": upController.bluPlayer[3],
      "bluePlayer4Name": upController.bluPlayerName[3],
      "bluePlayer5": upController.bluPlayer[4],
      "bluePlayer5Name": upController.bluPlayerName[4],
      "blueTeamName": upController.blueTeamName,
      "redBan1": upController.redBan[0],
      "redBan2": upController.redBan[1],
      "redBan3": upController.redBan[2],
      "redBan4": upController.redBan[3],
      "redBan5": upController.redBan[4],
      "redPlayer1": upController.redPlayer[0],
      "redPlayer1Name": upController.redPlayerName[0],
      "redPlayer2": upController.redPlayer[1],
      "redPlayer2Name": upController.redPlayerName[1],
      "redPlayer3": upController.redPlayer[2],
      "redPlayer3Name": upController.redPlayerName[2],
      "redPlayer4": upController.redPlayer[3],
      "redPlayer4Name": upController.redPlayerName[3],
      "redPlayer5": upController.redPlayer[4],
      "redPlayer5Name": upController.redPlayerName[4],
      "redTeamName": upController.redTeamName,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('savedData').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
*/