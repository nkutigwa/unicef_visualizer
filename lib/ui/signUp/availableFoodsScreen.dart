import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_screen/helpers/colors.dart';
import 'package:flutter_login_screen/model/food.dart';

import '../../constants.dart';

class AvailableFoodsScreen extends StatefulWidget {
  @override
  _AvailableFoodsScreenState createState() => _AvailableFoodsScreenState();
}

class _AvailableFoodsScreenState extends State<AvailableFoodsScreen> {
  FoodBrain searchFood = FoodBrain();
  List<String> foods = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).nextFocus(),
//                      onSaved: (String val) {
//                        email = val;
//                      },
                      onTap: () async {
                        final Food result = await showSearch(
                          context: context,
                          delegate: FoodSearch(),
                        );
                        setState(() {
                          foods.add(result.name);
                        });
                        foods.add(result.name);
                      },
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          fillColor: Colors.white,
                          hintText: 'Search Food',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: Color(COLOR_PRIMARY), width: 2.0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))))),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width * 0.8,
            child: foods != null
                ? GridView.builder(
                    itemCount: foods.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return FoodWidget(
                        food: foods[index],
                        onPressed: () {
                          setState(() {
                            foods.remove(foods[index]);
                          });
                        },
                      );
                    },
                  )
                : Container(),
//                ? ListView.builder(
//                    shrinkWrap: true,
//                    itemBuilder: (context, index) => FoodWidget(
//                      food: foods[index],
//                      onPressed: () {
//                        setState(() {
//                          foods.remove(foods[index]);
//                        });
//                      },
//                    ),
////                  ListTile(
////                title: Text((snapshot.data[index] as Food).name),
////                onTap: () {
////                  close(context, snapshot.data[index] as Food);
////                },
////              ),
//                    itemCount: foods.length,
//                  )
//                : Container(),
          ),
        ],
      ),
    );
  }
}

class FoodWidget extends StatelessWidget {
  final String food;
  final Function onPressed;

  FoodWidget({this.food, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        title: Text(food, style: Theme.of(context).textTheme.bodyText2),
        trailing: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class FoodSearch extends SearchDelegate<Food> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
          Navigator.pop(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  bool isReplay = false;
  List filteredList;
  List newList;
  List listOfIndex;

  bool filterSearch(String value, String criteria) {
    return value
        .toString()
        .toLowerCase()
        .trim()
        .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
  }

  Future<List<Food>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    if (search == "empty") return [];
    if (search == "error") throw Error();
    if (search.length > 20) throw Error();

    //Initial List of Foods
    filteredList = Food.foods;
    newList = [];
    listOfIndex = [];
    print(filteredList);

    //Filtering Occurs
    try {
      for (int i = 0; i < filteredList.length; i++) {
        if ((filterSearch(filteredList[i], search) == true)) {
          newList.add(filteredList[i]);
          listOfIndex.add(i);
        }
      }
    } catch (e) {
      print(e);
    }
    print(newList);
    return List.generate(newList.length, (int index) {
      return Food(
        newList[index].toString(),
      );
    });
//    newList = [];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == "" ? null : search(query),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Enter food name'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text((snapshot.data[index] as Food).name),
                    onTap: () {
                      close(context, snapshot.data[index] as Food);
                    },
                  ),
                  itemCount: snapshot.data.length,
                )
              : Container(child: Text('Loading...')),
    );
  }
}
