import 'package:flutter/material.dart';
import 'package:pets_app/views/pet_details.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> petsList = [
    {'name': 'Atos', 'breed': 'York Shire'},
    {'name': 'Panko', 'breed': 'Shiba'},
    {'name': 'Cleo', 'breed': 'Pomeranian'},
    {'name': 'Max'}
  ];

  List<Map<String, dynamic>> foundPets = [];
  @override
  initState() {
    foundPets = petsList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = petsList;
    } else {
      results = petsList
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundPets = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text('You have ${foundPets.length} pets'),
                ],
              ),
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: foundPets.isNotEmpty
                  ? ListView.builder(
                      itemCount: foundPets.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(foundPets[index]),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Icon(Icons.handshake),
                          title: Text(foundPets[index]['name']),
                          subtitle: Text(foundPets[index]['breed'].toString()),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PetDetails(
                                  petInfo: petsList[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
