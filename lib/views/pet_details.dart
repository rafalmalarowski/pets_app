import 'package:flutter/material.dart';

class PetDetails extends StatelessWidget {
  final Map petInfo;
  const PetDetails({Key? key, required this.petInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    petInfo['name'],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text('breed: ${petInfo['breed'] ?? 'no'}')
                ])));
  }
}
