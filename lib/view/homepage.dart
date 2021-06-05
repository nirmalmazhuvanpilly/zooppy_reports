import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts_coding_test/provider/data_provider.dart';
import 'package:webandcrafts_coding_test/view/search.dart';
import 'package:webandcrafts_coding_test/view/user_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebandCrafts"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              })
        ],
      ),
      body: UserDetails(),
    );
  }
}

class UserDetails extends StatelessWidget {
  final TextStyle style =
      new TextStyle(fontWeight: FontWeight.bold, color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    final providerValue = Provider.of<DataProvider>(context, listen: false);
    return FutureBuilder(
      future: providerValue.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<DataProvider>(
            builder: (_, value, __) => ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: value.dataModel.dataModel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserView(
                          image: value.dataModel.dataModel
                                      .elementAt(index)
                                      .profileImage !=
                                  null
                              ? value.dataModel.dataModel
                                  .elementAt(index)
                                  .profileImage
                              : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png",
                          name: value.dataModel.dataModel
                                      .elementAt(index)
                                      .name !=
                                  null
                              ? value.dataModel.dataModel.elementAt(index).name
                              : "No Value",
                          username: value.dataModel.dataModel
                                      .elementAt(index)
                                      .username !=
                                  null
                              ? value.dataModel.dataModel
                                  .elementAt(index)
                                  .username
                              : "No Value",
                          email: value.dataModel.dataModel
                                      .elementAt(index)
                                      .email !=
                                  null
                              ? value.dataModel.dataModel.elementAt(index).email
                              : "No Value",
                          address: value.dataModel.dataModel
                                      .elementAt(index)
                                      .address
                                      .city !=
                                  null
                              ? value.dataModel.dataModel
                                  .elementAt(index)
                                  .address
                                  .city
                              : "No Value",
                          phone: value.dataModel.dataModel
                                      .elementAt(index)
                                      .phone !=
                                  null
                              ? value.dataModel.dataModel.elementAt(index).phone
                              : "No Value",
                          website: value.dataModel.dataModel
                                      .elementAt(index)
                                      .website !=
                                  null
                              ? value.dataModel.dataModel
                                  .elementAt(index)
                                  .website
                              : "No Value",
                          companyName: value.dataModel.dataModel
                                      .elementAt(index)
                                      .company !=
                                  null
                              ? value.dataModel.dataModel
                                  .elementAt(index)
                                  .company
                                  .name
                              : "No Company",
                          companyPhrase: value.dataModel.dataModel
                                      .elementAt(index)
                                      .company !=
                                  null
                              ? value.dataModel.dataModel
                                  .elementAt(index)
                                  .company
                                  .catchPhrase
                              : "No Company",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(value.dataModel.dataModel
                                              .elementAt(index)
                                              .profileImage !=
                                          null
                                      ? value.dataModel.dataModel
                                          .elementAt(index)
                                          .profileImage
                                      : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  value.dataModel.dataModel
                                      .elementAt(index)
                                      .name,
                                  style: style,
                                ),
                                Text(value.dataModel.dataModel
                                            .elementAt(index)
                                            .company ==
                                        null
                                    ? "No Company"
                                    : value.dataModel.dataModel
                                        .elementAt(index)
                                        .company
                                        .name)
                              ],
                            )
                          ],
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
