import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../adoption_model.dart';

class AdoptionCard extends StatelessWidget {
  final Adoption todo;

  final Function()? onErase;
  final Function()? onLongPress;
  final EdgeInsets? margin;
  final ScrollController _sc = ScrollController();

  AdoptionCard(
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
      child: AspectRatio(
        aspectRatio: 5 / 5,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
          decoration: BoxDecoration(
              color: kPrimaryLightColor,
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
                    child: Row(
                      children: const [
                        SizedBox(width: 7),
                        Text(
                          'Pet Information',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kBackground2,
                        ),
                        onPressed: onLongPress,
                        child: Text('Edit Pet Information',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold))),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close),
                    iconSize: 20,
                    onPressed: onErase,
                  ),
                ],
              ),
              Container(
                height: 250,
                width: 425,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // child: Image.network(pets.imageUrl, fit: BoxFit.cover),
                  child: Image.network('assets/images/Brody.jpg',
                      fit: BoxFit.cover),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _sc,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Adoptee ID: ',
                          ),
                          Text(
                            todo.adopteeID,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Name: ',
                          ),
                          Text(
                            todo.name,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Age: ',
                          ),
                          Text(
                            todo.age,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Color: ',
                          ),
                          Text(
                            todo.color,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Type: ',
                          ),
                          Text(
                            todo.type,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Size: ',
                          ),
                          Text(
                            todo.size,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Gender: ',
                          ),
                          Text(
                            todo.gender,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Breed: ',
                          ),
                          Text(
                            todo.breed,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Main Personality: ',
                          ),
                          Text(
                            todo.persona1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Description: ',
                          ),
                          Text(
                            todo.description,
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
    );
  }
}
