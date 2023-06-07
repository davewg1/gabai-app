import 'package:flutter/material.dart';
import 'dart:io';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final name = TextFormField(
      autofocus: false,
      //controller: nameController,
      keyboardType: TextInputType.name,
      onSaved: (value){
        //nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );
    final address = TextFormField(
      autofocus: false,
      //controller: addressController,
      onSaved: (value){
        //addressController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
    final birthdate = TextFormField(
      autofocus: false,
      //controller: birthdateController,
      onSaved: (value){
        //birthdateController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Birth Date",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );

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
      body: Center(
        child:SingleChildScrollView(
            child:Container(
            color: Colors.white,
            child: Padding(padding:const EdgeInsets.all(36.0),
                child: Form(
                    child: Column(
                      children: <Widget>[Text("Name"),name,Text("Address"),address,Text("Birth"),birthdate],
                    )
                )
            )
          )
        )
      )

    );
  }
}
