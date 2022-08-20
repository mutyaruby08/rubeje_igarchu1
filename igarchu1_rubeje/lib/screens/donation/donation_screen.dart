import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/donations_controller.dart';
import 'donation_models.dart';
import 'widgets/donation_card.dart';
import 'widgets/donation_input.dart';

class DonationScreen extends StatefulWidget {
  final AuthController auth;
  const DonationScreen(this.auth, {Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  late final DonationController _todoController;
  final ScrollController _sc = ScrollController();
  AuthController get _auth => widget.auth;
  int currentIndex = 1;
  final screens = [];

  @override
  void initState() {
    _todoController = DonationController(_auth.currentUser!.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _auth.logout();
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
        title: const Text(
          'Pet Donation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kbutton2,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        backgroundColor: kbutton1,
        child: const Icon(Icons.add),
        onPressed: () {
          showAddDialog(context);
        },
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _todoController,
          builder: (context, Widget? w) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: Scrollbar(
                      controller: _sc,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(12.0),
                        controller: _sc,
                        child: Column(
                          children: [
                            for (Donation todo in _todoController.data)
                              DonationCard(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                todo: todo,
                                onErase: () {
                                  _todoController.removeTodo(todo);
                                },
                                onLongPress: () {
                                  _todoController.updateTodo(
                                      todo,
                                      todo.donationID,
                                      todo.orgName,
                                      todo.description,
                                      todo.days,
                                      todo.location,
                                      todo.targetAmount);
                                  showEditDialog(context, todo);
                                },
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: kbutton1,
        backgroundColor: Colors.white,
        iconSize: 30,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            label: 'Health',
            icon: Icon(
              Icons.monitor_heart_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Donate',
            icon: Icon(
              Icons.volunteer_activism_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(
              Icons.chat_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_outline_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  showAddDialog(BuildContext context) async {
    Donation? result = await showDialog<Donation>(
        context: context,
        builder: (dContext) {
          return const Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: DonationInputWidget(),
          );
        });
    if (result != null) {
      _todoController.addTodo(result);
    }
  }

  showEditDialog(BuildContext context, Donation todo) async {
    Donation? result = await showDialog<Donation>(
        context: context,
        builder: (dContext) {
          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: DonationInputWidget(
              donateID: todo.donationID,
              orgName: todo.orgName,
              description: todo.description,
              days: todo.days,
              location: todo.location,
              targetAmount: todo.targetAmount,
            ),
          );
        });
    if (result != null) {
      _todoController.updateTodo(
        todo,
        result.donationID,
        result.orgName,
        result.description,
        result.days,
        result.location,
        result.targetAmount,
      );
    }
  }
}
