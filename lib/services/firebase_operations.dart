import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../AppRoutes.dart';

abstract class DatabaseOperationsFirebase {
  final db = FirebaseFirestore.instance;
}

class UserOperationsFirebase extends DatabaseOperationsFirebase {
  Future<String> signOutUser() async {
    String message = "";

    try {
      await FirebaseAuth.instance.signOut();
      message =
          "Você foi deslogado, se conecte novamente para acessar sua conta!";
    } catch (e) {
      message =
          "Não foi possível deslogar da conta, tente novamente mais tarde";
    }

    return message;
  }

  Future<Map<String, dynamic>> createUser(
      String emailAddress, String password) async {
    String message = "";
    bool registered = false;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      message = "Usuário criado";
      registered = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = "Senha muito fraca!";
      } else if (e.code == 'email-already-in-use') {
        message = "Uma conta ja está utilizando esse e-mail!";
      }
    } catch (e) {
      message = '$e';
    }
    return {"registered": registered, "message": message};
  }

  Future<Map<String, dynamic>> loginUser(
      String emailAddress, String password) async {
    String message = "";
    bool registered = false;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      message = "Seja bem vindo!!!";
      registered = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        message = "Senha ou usuário incorreto!";
      } else if (e.code == "invalid-credential") {
        message = "Credênciais inválidas";
      }
    }
    return {"registered": registered, "message": message};
  }
}

class AudioOperations extends DatabaseOperationsFirebase {
  Future<void> removeNote(String id_note) async {
    db.collection("anotacoes").doc('$id_note').delete();
  }

  Future<bool> addAnotacao(String noteTitle, String noteText) async {
    String id_user = '${FirebaseAuth.instance.currentUser!.uid}';

    final note = <String, dynamic>{
      "id_user": "$id_user",
      "title": "$noteTitle",
      "text": "$noteText",
    };

    await db.collection("anotacoes").add(note).then((DocumentReference doc) {
      return true;
    });
    return false;
  }

  Future<bool> editAnotacao(
      String id_note, String noteTitle, String noteText) async {
    db.collection("anotacoes").doc(id_note).update({
      "title": "$noteTitle",
      "text": "$noteText",
    });

    return true;
  }

  Future<List<dynamic>> getNotes() async {
    List<Object> listNotes = [];
    String id_user = '${FirebaseAuth.instance.currentUser!.uid}';

    await db
        .collection("anotacoes")
        .where("id_user", isEqualTo: id_user)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        Map<String, dynamic> dict_notes = doc.data();
        dict_notes['id'] = doc.id;
        listNotes.add(dict_notes);
      }
    }).catchError((e) {
      print('Got error: $e');
    });

    return listNotes;
  }

  Future<Map<String, dynamic>?> returnDataNote(String id_note) async {
    try {
      DocumentSnapshot currentDoc = await FirebaseFirestore.instance
          .collection("anotacoes")
          .doc(id_note)
          .get();

      return currentDoc.exists
          ? currentDoc.data() as Map<String, dynamic>?
          : null;
    } catch (e) {
      print('Erro ao obter documento: $e');
      return null;
    }
  }
}
