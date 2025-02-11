
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:test_logo/pages/Industry_Homefield_Search.dart';

import '../comtroller/auth/auth_controller.dart';

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  final authcontroller = Get.put(AuthController());
  List<String> searchTerms = [
    "Semi-asort",
    "Full-asort",
    "Galaxy Planner",
    "Manual Marker",
    "Sarin-operator",
    "Rekert",
    "Vajan",
    "Data entery",
    "Boil",
    "Manager",
    "Taliya",
    "Russian",
    "Table",
    "Taliya pel",
    "Blocking-chapka",
    "Mathala",
    "Diy-Fixening",
    "Dori",
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: InkWell(child: Text(result),onTap: (){
    authcontroller.searchresult.value = result;


            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Industry_Homefield_Search(),
                ));          },),
        );
      },
    );
  }
}
