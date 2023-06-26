import 'dart:convert';

import 'package:app_bartask/filter.dart/filtericon.dart';
import 'package:app_bartask/filter.dart/filterscreen.dart';
import 'package:app_bartask/menubar.dart/menubar.dart';
import 'package:app_bartask/model/countrymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _selectionScreen();
  }
}

class _selectionScreen extends State<SelectionScreen> {
  List fullData = [];
  List searchData = [];
  bool flag = false;
  bool closesearch = false;
  bool changestate = false;
  bool isListEmpty = false;
  final FocusNode _searchFocusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    getLocalJsonData();
  }

  getLocalJson() {
    return rootBundle
        .loadString('assets/countrycodes.json'); // Read your local Data
  }

  Future getLocalJsonData() async {
    final responce = json.decode(await getLocalJson());

    List<dynamic> tempList = [];
    for (var i in responce['countryResult']) {
      tempList.add(i); // Create a list and add data one by one
    }
    fullData = tempList;
  }

  onSearchTextChanged(String text) async {
    searchData.clear();
    // if (textEditingController.text.isEmpty) {
    //   setState(() {
    //     searchData = fullData;
    //   });
    //   print(fullData.length);
    //   // Check textfield is empty or not
    //   // setState(() {});
    // } else {
    //   searchData = fullData
    //       .where((element) =>
    //           element.shoptypename!.toLowerCase().contains(text.toLowerCase()))
    //       .toList();
    //   if (searchData.isEmpty) {
    //     isLISTEmpty = true;
    //   } else {
    //     isLISTEmpty = false;
    //   }
    //   setState(() {});
    // }
    fullData.forEach((data) {
      if (data['name']
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase().toString())) {
        searchData.add(data);
        if (searchData.isEmpty) {
          isListEmpty = true;
        } else {
          isListEmpty =
              false; // If not empty then add search data into search data list
        }
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFFf1f1f1),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurple.shade400]),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  flag = !flag;
                });
              },
              icon: Icon(Icons.search)),
          FilterScreen(id: ""),
          MenuScreen(),
        ],
        title: flag == true
            ? TextFormField(
                focusNode: _searchFocusNode,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter for search",
                  hintStyle: TextStyle(color: Colors.grey.shade200),
                  suffixIcon: textEditingController.text.length > 0
                      ? IconButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            textEditingController.clear();
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ))
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.white38,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.only(top: 25, left: 15),
                  // suffixIcon: Icon(Icons.search),
                  // suffixIconColor: Colors.white,
                ),
                cursorColor: Colors.white,
                controller: textEditingController,
                onChanged: onSearchTextChanged,
              )
            : null,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: searchData.length ==
                    0 // Check SearchData list is empty or not if empty then show full data else show search data
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Image.asset("assets/logo.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text("No Results Found",
                              style: GoogleFonts.kanit(
                                color: Colors.deepPurple,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              )
                              //
                              //     TextStyle(
                              //   color: Colors.deepPurple,
                              //   fontWeight: FontWeight.bold,
                              //   fontFamily: "kanit",
                              //   fontSize: 32,
                              // ),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "we couldn't find what you searched for ",
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            "try searhing again ",
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: ListView.builder(
                      itemCount: searchData.length,
                      itemBuilder: (context, int index) {
                        return Card(
                          margin: EdgeInsets.all(5),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Colors.grey,
                              //       spreadRadius: 2,
                              //       offset: Offset(2, 2))
                              // ],
                            ),
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   "Post",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold, fontSize: 16),
                                // ),
                                Container(
                                  height: 2,
                                ),

                                Text(searchData[index]['name'].toString())
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          )
        ],
      )),
    ));
  }

  // void updateList(String value) {
  //   if (textEditingController.text.isEmpty) {
  //     searchData = fullData;
  //   } else {
  //     searchData = fullData
  //         .where((element) =>
  //             element.shoptypename!.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //     if (searchData.isEmpty) {
  //       isLISTEmpty = true;
  //     } else {
  //       isLISTEmpty = false;
  //     }
  //     update();
  //   }
}
