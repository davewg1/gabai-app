import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            Text('Account',
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
