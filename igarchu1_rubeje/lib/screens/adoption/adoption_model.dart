import 'package:simple_moment/simple_moment.dart';

class Adoption {
  late String adopteeID;
  late String name;
  late String color;
  late String age;
  late String type;
  late String size;
  late String breed;
  late String gender;
  late String description;
  late String persona1;

  late DateTime created;

  Adoption({
    this.adopteeID = '',
    this.name = '',
    this.color = '',
    this.age = '',
    this.type = '',
    this.size = '',
    this.breed = '',
    this.gender = '',
    this.description = '',
    this.persona1 = '',
    DateTime? created,
  }) {
    created == null ? this.created = DateTime.now() : this.created = created;
  }

  Adoption.fromJson(Map<String, dynamic> json) {
    adopteeID = json['details'] ?? '';
    name = json['name'] ?? '';
    color = json['color'] ?? '';
    age = json['age'] ?? '';
    type = json['type'] ?? '';
    size = json['size'] ?? '';
    breed = json['breed'] ?? '';
    gender = json['gender'] ?? '';
    description = json['description'] ?? '';
    persona1 = json['persona1'] ?? '';
    created = json['created'] ?? DateTime.now();
  }

  String get parsedDate {
    return Moment.fromDateTime(created).format('hh:mm a MMMM dd, yyyy ');
  }

  updateDetails(String newID, 
      String newName,
      String newColor, 
      String newAge,
      String newType,
      String newSize, 
      String newBreed,
      String newGender,
      String newDescription,
      String newPersona1) {
    adopteeID = newID;
    name = newName;
    color = newColor;
    age = newAge;
    type = newType;
    size = newSize;
    breed = newBreed;
    gender = newGender;
    description = newDescription;
    persona1 = newPersona1;
    created = DateTime.now();
  }

  Map<String, dynamic> get json => {
        'details': adopteeID,
        'name': name,
        'color': color,
        'age': age,
        'type' : type,
        'size' : size,
        'breed': breed,
        'gender': gender,
        'description' : description,
        'persona1' : persona1,
        'created': created,
       
       
        
      };

  Map<String, dynamic> toJson() {
    return json;
  }

  log() {
    print(json);
  }
}
