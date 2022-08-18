import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../donation_models.dart';

class DonationInputWidget extends StatefulWidget {
  final String? donateID;
  final String? orgName;
  final String? description;
  final  String? days;
  final  String? location;
  final  String? targetAmount;

  const DonationInputWidget(
      {Key? key, this. donateID, this.orgName, this.description, this.days, this.location, this.targetAmount})
      : super(key: key);

  @override
  State<DonationInputWidget> createState() => _DonationInputWidgetState();
}

class _DonationInputWidgetState extends State<DonationInputWidget> {
  final TextEditingController _tCon = TextEditingController();
  final TextEditingController _orgNameCon = TextEditingController();
  final TextEditingController _descriptCon = TextEditingController();
  final TextEditingController _daysCon = TextEditingController();
  final TextEditingController _locateCon = TextEditingController();
  final TextEditingController _targetCon = TextEditingController();

  String? get current => widget.donateID;
  String? get orgName => widget.orgName;
  String? get description => widget.description;
  String? get days => widget.days;
  String? get location => widget.location;
  String? get targetAmount => widget.targetAmount;

  @override
  void initState() {
    if (current != null) _tCon.text = current as String;
    if (orgName != null) _tCon.text = orgName as String;
    if (description != null) _tCon.text = description as String;
    if (days != null) _tCon.text = days as String;
    if (location != null) _tCon.text = location as String;
    if (targetAmount != null) _tCon.text = targetAmount as String;

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState?.validate();
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DONATION FORM',
              style: const TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 15),
              Text(
                current != null ? 'Donation ID' : 'Donation ID',
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
                height: 8,
              ),
              Text(
                orgName != null ? 'Organization Name' : 'Organization Name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _orgNameCon,
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
              
              Text(
                current != null ? 'Description' : 'Description',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _descriptCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                current != null ? 'Period of Appeal' : 'Period of Appeal',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _daysCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                current != null ? 'Location' : 'Location',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _locateCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                current != null ? 'Target Amount' : 'Target Amount',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _targetCon,
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
                          Navigator.of(context).pop(Donation(
                              donationID: _tCon.text,
                              orgName: _orgNameCon.text,
                              description: _descriptCon.text,
                              days: _daysCon.text,
                              location: _locateCon.text,
                              targetAmount: _targetCon.text,

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
