
import 'package:flutter/material.dart';
import 'Nextpage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
void main()=>runApp(Myapp());

class Myapp extends StatefulWidget{
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username;
  String phone;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter",
        style: TextStyle(
          color:Colors.white,
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView( child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text){
                username = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter User Name",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              onChanged: (number){
                phone = number;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Phone Number",
              ),
              keyboardType: TextInputType.number,
            ),
           SizedBox(
             height: 20.0,
           ),

            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.amber,
              padding: EdgeInsets.all(15.0),
              elevation: 10,
              child: Text(
                "Generate",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => info(username,phone,_image)),
                );
              },
              splashColor: Colors.white,
            ),
            SizedBox(
              height:20,
            ),

          ],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getImage();
        },
        icon: Icon(Icons.photo_camera,
        color: Colors.white,),
        label: Text("Photo",
        style: TextStyle(
          color: Colors.white,
        ),),
        tooltip: "Add Photo",
        splashColor: Colors.white,
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white30,
        child: Container(
          height: 45,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

