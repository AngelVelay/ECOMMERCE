import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile.controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter TabBar Example - Customized "),
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0)),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(25.0)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Consumos',
                      ),
                      Tab(
                        text: 'Cupones',
                      ),
                      Tab(
                        text: 'Descuentos',
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    Center(
                      child: _consumeInfo(context),
                    ),
                    Center(
                      child: Text("Status Pages"),
                    ),
                    Center(
                      child: Text('Calls Page'),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }

  static Widget _consumeInfo(BuildContext context) {
    return Column(children: [
      // List Header
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Mis Compras', style: TextStyle(fontSize: 22)),
          GestureDetector(
            onTap: () {
              Get.toNamed("/consume");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Ver Todos', style: TextStyle(fontSize: 14)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 10),
      const Divider(thickness: 2),
    ]);
  }
}
