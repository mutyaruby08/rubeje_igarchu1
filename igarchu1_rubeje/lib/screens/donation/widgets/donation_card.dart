import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../donation_models.dart';

class DonationCard extends StatelessWidget {
  final Donation todo;

  final Function()? onErase;
  final Function()? onLongPress;
  final EdgeInsets? margin;
  final ScrollController _sc = ScrollController();

  DonationCard(
      {required this.todo,
      this.onErase,
      this.onLongPress,
      this.margin,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GestureDetector(
        onLongPress: onLongPress,
        child: AspectRatio(
          aspectRatio: 13 / 7,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
            decoration: BoxDecoration(
                color: kbutton2,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Center(
                        child: Row(
                          children: const [
                            Icon(CupertinoIcons.doc, color: Colors.white,),
                            SizedBox(width: 10),
                            Text('Donation Information', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close),
                      iconSize: 20,
                      onPressed: onErase,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _sc,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Donation ID: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Text(
                              todo.donationID,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Organization Name: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Text(
                              todo.orgName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Description: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Text(
                              todo.description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Location: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Text(
                              todo.location,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Period of Appeal: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Text(
                              todo.days,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Target Amount: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )
                              
                            ),
                            Text(
                              todo.targetAmount,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
