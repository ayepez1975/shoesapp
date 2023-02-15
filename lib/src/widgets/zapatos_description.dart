import 'package:flutter/material.dart';

class ZapatosDescription extends StatelessWidget {
  final String title;
  final String description;

  const ZapatosDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: TextStyle(color: Colors.black54, height: 1.5),
          ),
        ]),
      ),
    );
  }
}
