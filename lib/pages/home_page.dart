import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/constant.dart';

import '../models/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Profile profile;

  @override
  void initState() {
    profile = Profile.fromJson(jsonProfile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hello, ${profile.displayName}",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: [
                    _itemMenu(context, "Menu 1"),
                    _itemMenu(context, "Menu 2"),
                    _itemMenu(context, "Menu 3"),
                    _itemMenu(context, "Menu 1"),
                    _itemMenu(context, "Menu 2"),
                    _itemMenu(context, "Menu 3"),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Artikel",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 20.0,
                        color: Colors.red,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 20.0,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Card(
                  child: Image.network(
                    "https://gardaanimalia.com/media/uploads/2022/02/alap-alap-kawah-768x432.webp",
                    height: 100.0,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    5,
                    (index) => _itemArtikel(context, "Artikel $index",
                        "Arikel ini merupakan artikel $index"),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  _itemMenu(BuildContext context, String title) {
    return SizedBox(
      width: double.infinity,
      height: 100.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title),
        ),
      ),
    );
  }

  _itemArtikel(BuildContext context, String title, String desc) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: (Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              Text(desc, style: TextStyle(fontSize: 13.0)),
            ],
          ),
        )),
      ),
    );
  }
}
