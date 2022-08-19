// ignore_for_file: unnecessary_const

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
          aspectRatio: 4 / 5,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
                color: kbutton2,
                borderRadius: BorderRadius.circular(20.0),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                        decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: kbutton1,
                                ),
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          iconSize: 20,
                          color: Colors.white,
                          onPressed: onErase,
                        ),
                      ),
                      InkWell(
                         child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children:  [
                              const Center(
                                child: const Text('Donation Information', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            ],
                          ),
                    ),
                    Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.green,
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(5),
                                  onPressed: onLongPress, 
                                  icon: const Icon(Icons.edit, color: Colors.black, size: 20,),),
                              ),
                    ],
                  ),
                ),
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
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                Container(
                  height: 250,
                  width: 425,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // child: Image.network(pets.imageUrl, fit: BoxFit.cover),
                    child: Image.network('assets/images/dogu.jpg',
                        fit: BoxFit.cover),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _sc,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kBackground2,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Text(
                              //   'Organization Name: ',
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.bold,
                              //   )
                              // ),
                              Text(
                                todo.orgName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Description: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                              Text(
                                todo.description,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                )
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // const Text(
                              //   'Location: ',
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.bold,
                              //   )
                              // ),
                              const Icon(Icons.location_on_rounded, color: kbutton1, size: 20,),
                              const SizedBox(width: 10,),
                              Text(
                                todo.location,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                )
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // const Text(
                              //   'Period of Appeal: ',
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.bold,
                              //   )
                              // ),
                              const Icon(Icons.timelapse_outlined, color: Colors.blue, size: 20,),
                              const SizedBox(width: 10,),
                              Text(
                                todo.days,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                )
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // const Text(
                              //   'Target Amount: ',
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.bold,
                              //   )
                                
                              // ),
                              const Icon(Icons.monetization_on, color: Color.fromARGB(255, 247, 197, 48), size: 20,),
                              const SizedBox(width: 10,),
                              Text(
                                todo.targetAmount,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
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
