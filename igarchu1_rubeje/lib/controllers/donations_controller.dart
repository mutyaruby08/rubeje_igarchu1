import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/donation/donation_models.dart';

class DonationController with ChangeNotifier {

  final Box todoCache = Hive.box('pets');
  late String currentUser;
  List<Donation> data = [];

  DonationController(this.currentUser) {
    List result = todoCache.get(currentUser, defaultValue: []);
    print(result);
    for (var entry in result) {
      print(entry);
      data.add(Donation.fromJson(Map<String, dynamic>.from(entry)));

    }
    notifyListeners();
  }


  addTodo(Donation todo) { 
    data.add(todo);
    saveDataToCache();
  }

  removeTodo(Donation toBeDeleted) {
    data.remove(toBeDeleted);
    saveDataToCache();
  }

  updateTodo(Donation todo, String newID,String newOrgName, String newDescription, String newDays, String newLocation, String newTargetAmount ) {
    todo.updateDetails(newID, newOrgName, newDescription, newDays, newLocation, newTargetAmount);

    saveDataToCache();
  }

  saveDataToCache() {
    List<Map<String, dynamic>> dataToStore = [];
    for (Donation todo in data) {
      dataToStore.add(todo.toJson());
    }
    print(dataToStore);
    todoCache.put(currentUser, dataToStore);
    notifyListeners();
  }

}