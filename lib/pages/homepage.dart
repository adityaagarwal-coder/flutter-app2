import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:flutter_application_3/widgets/drawer.dart';
import 'package:flutter_application_3/widgets/itemwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedata = jsonDecode(catalogjson);
    var productsdata = decodedata["products"];
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromdata(item))
        .cast<Item>()
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? ListView.builder(
              itemCount: CatalogModel.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: CatalogModel.items[index]);
              },
            )
          : Center(child: CircularProgressIndicator()),
      drawer: MyDrawer(),
    );
  }
}
