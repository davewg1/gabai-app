import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.diversity_1_rounded,
                size: 40,
              ),
            ),
            Text('Gabai',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
          ],
        ),
        shape: const Border(
          bottom: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}