import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final String image;
  final String name;
  final String username;
  final String email;
  final String address;
  final String phone;
  final String website;
  final String companyName;
  final String companyPhrase;

  UserView({
    this.image,
    this.name,
    this.address,
    this.companyName,
    this.companyPhrase,
    this.email,
    this.phone,
    this.username,
    this.website,
  });
  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        new TextStyle(fontWeight: FontWeight.bold, color: Colors.blue);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Name : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Text(name),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "User Name : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Text(username),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Email Address : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Text(email),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Address : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Text(address),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Phone : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Text(phone),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Website : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Text(website),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Company Name : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Text(companyName),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Company Phrase : ",
                    style: style,
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Text(companyPhrase)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
