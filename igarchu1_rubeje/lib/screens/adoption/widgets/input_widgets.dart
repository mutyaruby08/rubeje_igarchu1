// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../adoption_model.dart';

class InputWidget extends StatefulWidget {
  final String? adoptID;
  final String? name;
  final String? color;
  final String? age;
  final String? type;
  final String? size;
  final String? breed;
  final String? gender;
  final String? description;
  final String? persona1;

  const InputWidget(
      {Key? key,
      this.name,
      this.adoptID,
      this.age,
      this.breed,
      this.gender,
      this.color,
      this.type,
      this.size,
      this.description,
      this.persona1})
      : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final TextEditingController _tCon = TextEditingController();
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _colorCon = TextEditingController();
  final TextEditingController _ageCon = TextEditingController();
  final TextEditingController _typeCon = TextEditingController();
  final TextEditingController _sizeCon = TextEditingController();
  final TextEditingController _breedCon = TextEditingController();
  final TextEditingController _genCon = TextEditingController();
  final TextEditingController _descrCon = TextEditingController();
  final TextEditingController _pers1Con = TextEditingController();

  String? get current => widget.adoptID;
  String? get name => widget.name;
  String? get color => widget.color;
  String? get age => widget.age;
  String? get type => widget.type;
  String? get size => widget.size;
  String? get breed => widget.breed;
  String? get gender => widget.gender;
  String? get description => widget.description;
  String? get persona1 => widget.persona1;

  @override
  void initState() {
    if (current != null) _tCon.text = current as String;
    if (name != null) _tCon.text = name as String;
    if (color != null) _tCon.text = color as String;
    if (age != null) _tCon.text = age as String;
    if (type != null) _tCon.text = type as String;
    if (size != null) _tCon.text = size as String;
    if (breed != null) _tCon.text = breed as String;
    if (gender != null) _tCon.text = gender as String;
    if (description != null) _tCon.text = description as String;
    if (persona1 != null) _tCon.text = persona1 as String;

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState?.validate();
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'ADOPTEE FORM',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(height: 5),
              Text(
                current != null ? 'Adopt ID' : 'Adopt ID',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _tCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name != null ? 'Name' : 'Name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                current != null ? 'Color' : 'Color',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _colorCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                age != null ? 'Age' : 'Age',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _ageCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                current != null ? 'Type' : 'Type',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _typeCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                current != null ? 'Size' : 'Size',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _sizeCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                gender != null ? 'Gender' : 'Gender',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _genCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                breed != null ? 'Breed' : 'Breed',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _breedCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                current != null ? 'Description' : 'Description',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _descrCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                current != null ? 'Personality' : 'Personality',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _pers1Con,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.of(context).pop(Adoption(
                            adopteeID: _tCon.text,
                            name: _nameCon.text,
                            color: _colorCon.text,
                            age: _ageCon.text,
                            type: _typeCon.text,
                            size: _sizeCon.text,
                            breed: _breedCon.text,
                            gender: _genCon.text,
                            description: _descrCon.text,
                            persona1: _pers1Con.text,
                          ));
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: (_formKey.currentState?.validate() ?? false)
                        ? kPrimaryColor
                        : Colors.grey),
                child: Text(current != null ? 'Edit' : 'Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
