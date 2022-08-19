import 'dart:html';

import 'package:simple_moment/simple_moment.dart';

class Donation {
  late String donationID;
  late String orgName;
  late String description;
  late String days;
  late String location;
  late String targetAmount;
  late DateTime created;

  Donation({
    this.donationID = '',
    this.orgName = '',
    this.description = '',
    this.days = '',
    this.location = '',
    this.targetAmount = '',
    DateTime? created,
  }) {
    created == null ? this.created = DateTime.now() : this.created = created;
  }

  Donation.fromJson(Map<String, dynamic> json) {
    donationID  = json['details'] ?? '';
    orgName = json['orgName'] ?? '';
    description = json['description'] ?? '';
    days = json['days'] ?? '';
    location = json['location'] ?? '';
    targetAmount = json['targetAmount'] ?? '';
    created = json['created'] ?? DateTime.now();
  }

  String get parsedDate {
    return Moment.fromDateTime(created).format('hh:mm a MMMM dd, yyyy ');
  }

  updateDetails(
      String newID, 
      String newOrgName,
      String newDescription,
      String newDays,
      String newLocation,
      String newTargetAmount,
      ) {
    donationID= newID;
    orgName = newOrgName;
    description = newDescription;
    days = newDays;
    location = newLocation;
    targetAmount = newTargetAmount;
    created = DateTime.now();
  }

  Map<String, dynamic> get json => {
        'details': donationID,
        'orgName': orgName,
        'description' : description,
        'days' : days,
        'location' : location,
        'targetAmount' : targetAmount,
        'created': created,

      };

  Map<String, dynamic> toJson() {
    return json;
  }

  log() {
    print(json);
  }
}
