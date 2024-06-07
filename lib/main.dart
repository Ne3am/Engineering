// نور  زهير حسن

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// نورا حسين القريمه
List postdata = [];
bool loading = false;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // مايا خسن معلا
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.code),
                  Text(
                    "Software",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  // ولاء ابراهيم نزهة
                  Text(
                    "Engineering",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
            // نعم وديع ديب
            body: ListView(children: [
              Container(
                  child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: " to show post and title .."),
                  // فاطمة ابراهيم العجي
                  TextSpan(
                      text: "click button",
                      style: TextStyle(color: Colors.blueGrey)),
                ])),
              )),
              Container(
                height: 10,
              ),
              // رنا علي اسعد
              MaterialButton(
                onPressed: () async {
                  loading = true;
                  setState(() {});
                  var responce = await get(
                      Uri.parse("https://jsonplaceholder.typicode.com/posts"));
                  var responsebody = jsonDecode(responce.body);
                  postdata.addAll(responsebody);

                  loading = false;
                  setState(() {});
                },
                // دعاء غازي معروف
                height: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                color: const Color.fromARGB(255, 3, 47, 112),
                textColor: Colors.grey,
                child: const Text("show  post"),
              ),

              //  نيفين سمير العمشة
              if (loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              // هند علي حمد
              ...List.generate(
                  postdata.length,
                  (index) => Card(
                        shadowColor: const Color(DateTime.january),
                        child: ListTile(
                          leading: const Icon(Icons.title),
                          iconColor: Colors.blue,
                          title: Text(
                            "${postdata[index]["title"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, wordSpacing: 2.0),
                          ),
                          subtitle: Text(
                            "  ${postdata[index]["body"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w200, wordSpacing: 1.0),
                          ),
                          trailing: Text('$index'),
                        ),
                      )),
            ])));
  }
}
