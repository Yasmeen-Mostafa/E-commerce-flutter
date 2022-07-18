import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/data/fetchData.dart';
import 'package:flutter_application_1/domain/api.dart';

class Details extends StatefulWidget {
  String id;
  Details(this.id);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Future<ApiFormat> item;
  @override
  void initState() {
    super.initState();
    this.item = DataFromApi().fetchItem(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: item,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApiFormat _data = snapshot.data as ApiFormat;
            return Scaffold(
              appBar: AppBar(
                title: Text(_data.title),
                centerTitle: true,
              ),
              body: Column(children: [
                Row(children: [Expanded(child: Image.network(_data.picture))]),
                SizedBox(height: 30),
                Text(
                  _data.content,
                  style: TextStyle(fontSize: 18),
                )
              ]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
