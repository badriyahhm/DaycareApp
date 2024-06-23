import 'package:flutter/material.dart';
import 'package:daycare/screen/dailyreport.dart';
import 'package:daycare/screen/login.dart';

class OrangtuaScreen extends StatefulWidget {
  @override
  _OrangtuaScreenState createState() => _OrangtuaScreenState();
}

class _OrangtuaScreenState extends State<OrangtuaScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Parent Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0XFF909FF9),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profil Anak
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/face.png'),
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Anak',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.thermostat_outlined,
                                  color: Colors.red),
                              SizedBox(width: 8),
                              Text('Temperatur: 36.5°C'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.green),
                              SizedBox(width: 8),
                              Text('Arrival: 08:00 AM'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 25),
                      Icon(Icons.notes, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text('Condition: Healthy and Active'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: [
                Tab(text: 'Meals'),
                Tab(text: 'Toilet'),
                Tab(text: 'Rest'),
                Tab(text: 'Bottle'),
                Tab(text: 'Other'),
                Tab(text: 'Notes for Parents'),
              ],
            ),
            // Daily Report
            Container(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Meals Section
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardItem(
                          imagePath: 'images/breakfast.png',
                          Title: 'Breakfast',
                          text1: '-',
                          text2: 'None',
                        ),
                        CardItem(
                          imagePath: 'images/snack.png',
                          Title: 'Snack',
                          text1: 'Pisang dan susu',
                          text2: 'Lots',
                        ),
                        CardItem(
                          imagePath: 'images/lunch.png',
                          Title: 'Lunch',
                          text1: 'Nasi, bola-bola tahu, dan telur rebus',
                          text2: 'Some',
                        ),
                        CardItem(
                          imagePath: 'images/dinner.png',
                          Title: 'Dinner',
                          text1: 'Nasi dan pempek',
                          text2: 'Lots',
                        ),
                        CardItem(
                          imagePath: 'images/drink.png',
                          Title: 'Fluids',
                          text1: 'Air putih dan susu',
                          text2: 'Lots',
                        ),
                      ],
                    ),
                  ),
                  // Toilet Section
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardItem(
                          imagePath: 'images/diaper.png',
                          Title: 'Diaper',
                          text1: 'pukul 11.37',
                          text2: 'Wet',
                        ),
                        CardItem(
                          imagePath: 'images/diaper.png',
                          Title: 'Diaper',
                          text1: 'pukul 14.08',
                          text2: 'Wet',
                        ),
                      ],
                    ),
                  ),
                  // Rest Section
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardItem(
                          imagePath: 'images/sleep.png',
                          Title: 'Rest',
                          text1: 'start : 12.59',
                          text2: 'end   : 13.57',
                        ),
                      ],
                    ),
                  ),
                  // Bottle Section
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardItem(
                          imagePath: 'images/milk.png',
                          Title: 'Milk',
                          text1: 'pukul 09.48',
                          text2: '1 kotak',
                        ),
                        CardItem(
                          imagePath: 'images/milk.png',
                          Title: 'Milk',
                          text1: 'pukul 12.08',
                          text2: '1 kotak',
                        ),
                      ],
                    ),
                  ),
                  // Other Section
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Shower',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        CardItem(
                          imagePath: 'images/sky.png',
                          Title: 'Morning',
                          text1: 'start : -',
                          text2: ' ',
                        ),
                        CardItem(
                          imagePath: 'images/day.png',
                          Title: 'Afternoon',
                          text1: 'start : 12.08',
                          text2: ' ',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            'Vitamin',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        CardItem(
                          imagePath: 'images/vitamin.png',
                          Title: 'Vitamin',
                          text1: 'start : 12.08',
                          text2: ' ',
                        ),
                      ],
                    ),
                  ),
                  // Notes Section
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Items I Need',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        CheckBoxList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String imagePath;
  final String Title;
  final String text1;
  final String text2;

  const CardItem({
    required this.imagePath,
    required this.Title,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  text1,
                  maxLines: null,
                  softWrap: true,
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF2C55A4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBoxList extends StatefulWidget {
  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  List<String> items = [
    'Diapers',
    'Hand Towel',
    'Cream',
    'Clothes',
    'Towel',
    'Soap & Shampoo',
    'Milk',
    'Toothpaste'
  ];

  Map<String, bool> checkedItems = {};

  @override
  void initState() {
    super.initState();
    for (var item in items) {
      checkedItems[item] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return CheckboxListTile(
          title: Text(item),
          value: checkedItems[item],
          onChanged: (bool? value) {
            setState(() {
              checkedItems[item] = value!;
            });
          },
        );
      }).toList(),
    );
  }
}
