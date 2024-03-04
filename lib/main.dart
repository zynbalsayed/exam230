import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  List<String> _carouselImages = [
    'assets/banner1.jpg',
    'assets/banner2.jpg',
    'assets/banner3.png',
  ];

  List<String> _listItems = [
    'Banana',
    'Apple',
    'Cherry',
    'Peach',
    'Pineapple',
    'Pear',
    'Watermelon',
    'Strawberry',
    'Orange',
    'Lemon',
    'Tomato',
  ];

  List<String> _listImages = [
    'assets/image1.JPG',
    'assets/image2.JPG',
    'assets/image3.JPG',
    'assets/image4.JPG',
    'assets/image5.JPG',
    'assets/image7.JPG',
    'assets/image8.JPG',
    'assets/image9.JPG',
    'assets/image10.JPG',
    'assets/image11.JPG',
    'assets/image12.JPG',
  ];

  String _searchText = '';

  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _listItems;
  }

  void _filterList(String searchText) {
    setState(() {
      _searchText = searchText;
      _filteredItems = _listItems
          .where((item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: _carouselImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => _filterList(value),
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    _listImages[index],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(_filteredItems[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}