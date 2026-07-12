import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizzle/api/meals_api_client.dart';

import 'models/categories_response.dart';

void main() {
  runApp(CounterWidget());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),

        body: Center(),
        // body: GridView.builder(
        //   padding: EdgeInsets.all(20),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 1,
        //     mainAxisSpacing: 20,
        //     crossAxisSpacing: 20,
        //
        //   ),
        //   itemBuilder: (context, index) => buildCard(index),
        //   itemCount: 5000,
        // ),
        // body: ListView.builder(
        //   itemCount: 5000,
        //   itemBuilder: (context, index) =>
        //       Row(children: [buildCard(index), buildCard(index)]),
        // ),
        // body: ListView(
        //   children: [
        //     for (int i = 0; i < 5000; i++)
        //       Row(children: [buildCard(i), buildCard(i)]),
        //   ],
        // ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       for (int i = 0; i < 5000; i++)
        //         Row(children: [buildCard(i), buildCard(i)]),
        //     ],
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          child: const Icon(Icons.navigation),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //     items: [
        //       BottomNavigationBarItem(
        //            icon: Icon(Icons.home),
        //         label: ""
        //       ),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.home),
        //         label: ""
        //       )
        //     ]
        // ),
      ),
    );
  }

  Widget buildCard(int index) {
    print("index : $index");
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.asset("assets/images/image.jpg", fit: BoxFit.cover),
        ),
        IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return CounterWidgetState();
  }
}

class CounterWidgetState extends State<CounterWidget> {
  MealsApiClient apiClient = MealsApiClient(Dio());
  List<Categories> categories = [];

  Future<void> getCategories() async {
    try {
      var response = await apiClient.getCategories();
      setState(() {
        categories = response.categories ?? [];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),

        body: ListView.builder(
          itemBuilder: (context, index) =>
              Image.network(categories[index].strCategoryThumb ?? ""),
          itemCount: categories.length,
        ),
      ),
    );
  }
}
