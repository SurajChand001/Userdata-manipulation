import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class info extends StatefulWidget {
  String username;
  String phone;
  File _image;
  info(this.username,this.phone,this._image);
  @override
  _infoState createState() => _infoState(username,phone,_image);
}

// ignore: camel_case_types
class _infoState extends State<info> {
  String username;
  String phone;
  File _image;
  _infoState(this.username,this.phone,this._image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Information",
        style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text("Name : $username",
                style: TextStyle(
                  fontSize: 20,
                ),),
              ),
              Container(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Phone No. : $phone",
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
              ),
              Container(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
              )
            ],
          )
        ],
      ),
      ),
    );
  }
}
