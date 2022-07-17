import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/fetchData.dart';
import 'package:flutter_application_1/domain/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<ApiFormat>> data;
  @override
  void initState() {
    super.initState();
    this.data = DataFromApi().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // DataFromApi().fetchData(); //create object from class datafromapi
    return Scaffold(
      appBar: AppBar(title: Text('Title')),
      body: FutureBuilder(
          future: this.data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ApiFormat> _data = snapshot.data as List<ApiFormat>;
              //   print(_data);
              return ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    print("e $context, $data");
                    return Card(
                      child: Row(children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.network(_data[index].picture)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(_data[index].title)
                      ]),
                    );
                  });
            }
            if (snapshot.hasError) {}
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
