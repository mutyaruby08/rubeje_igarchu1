import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/adoption/adoption_model.dart';


class PetController with ChangeNotifier {

  final Box todoCache = Hive.box('pets');
  late String currentUser;
  List<Adoption> data = [];

  PetController(this.currentUser) {
    List result = todoCache.get(currentUser, defaultValue: []);
    print(result);
    for (var entry in result) {
      print(entry);
      data.add(Adoption.fromJson(Map<String, dynamic>.from(entry)));

    }
    notifyListeners();
  }


  addTodo(Adoption todo) { 
    data.add(todo);
    saveDataToCache();
  }

  removeTodo(Adoption toBeDeleted) {
    data.remove(toBeDeleted);
    saveDataToCache();
  }

  updateTodo(Adoption todo, String newID,String newName, String newColor, String newAge, String newType, String newSize,String newBreed, String newGender, String newDescription, String newPersona1 ) {
    todo.updateDetails(newID, newName, newColor,  newAge,  newType,  newSize, newBreed, newGender,  newDescription, newPersona1);

    saveDataToCache();
  }

  saveDataToCache() {
    List<Map<String, dynamic>> dataToStore = [];
    for (Adoption todo in data) {
      dataToStore.add(todo.toJson());
    }
    print(dataToStore);
    todoCache.put(currentUser, dataToStore);
    notifyListeners();
  }

}