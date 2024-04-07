import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final String description;
  final String price;
  const DetailPage(
      {super.key,
      required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.network(image),
          Text('Location ID: $id'),
          Text('Description: $description'),
          Text('Price: $price'),
        ],
      ),
    );
  }
}
