import 'package:flutter/material.dart';
import 'package:daycare/screen/dailyreport.dart';
import 'package:daycare/screen/login.dart';

class OrangtuaScreen extends StatefulWidget {
  const OrangtuaScreen({super.key});

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
            const Padding(
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
              tabs: const [
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
                        buildCardItem(
                          'images/breakfast.png',
                          'Breakfast',
                          '-',
                          'None',
                        ),
                        buildCardItem(
                          'images/snack.png',
                          'Snack',
                          'Pisang dan susu',
                          'Lots',
                        ),
                        buildCardItem(
                          'images/lunch.png',
                          'Lunch',
                          'Nasi, bola-bola tahu, dan telur rebus',
                          'Some',
                        ),
                        buildCardItem(
                          'images/dinner.png',
                          'Dinner',
                          'Nasi dan pempek',
                          'Lots',
                        ),
                        buildCardItem(
                          'images/drink.png',
                          'Fluids',
                          'Air putih dan susu',
                          'Lots',
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
                        buildCardItem(
                          'images/diaper.png',
                          'Diaper',
                          'pukul 11.37',
                          'Wet',
                        ),
                        buildCardItem(
                          'images/diaper.png',
                          'Diaper',
                          'pukul 14.08',
                          'Wet',
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
                        buildCardItem(
                          'images/sleep.png',
                          'Rest',
                          'start : 12.59',
                          'end   : 13.57',
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
                        buildCardItem(
                          'images/milk.png',
                          'Milk',
                          'pukul 09.48',
                          '1 kotak',
                        ),
                        buildCardItem(
                          'images/milk.png',
                          'Milk',
                          'pukul 12.08',
                          '1 kotak',
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
                        buildSectionTitle('Shower'),
                        buildCardItem(
                          'images/sky.png',
                          'Morning',
                          'start : -',
                          '',
                        ),
                        buildCardItem(
                          'images/day.png',
                          'Afternoon',
                          'start : 12.08',
                          '',
                        ),
                        SizedBox(height: 10),
                        buildSectionTitle('Vitamin'),
                        buildCardItem(
                          'images/vitamin.png',
                          'Vitamin',
                          'start : 12.08',
                          '',
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
                        buildSectionTitle('Items I Need'),
                        buildCheckBoxList(),
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

  Widget buildCardItem(
      String imagePath, String title, String text1, String text2) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  text1,
                  maxLines: null,
                  softWrap: true,
                ),
                Text(
                  text2,
                  style: const TextStyle(
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

  Widget buildSectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildCheckBoxList() {
    List<String> items = [
      'Diapers',
      'Hand Towel',
      'Cream',
      'Clothes',
      'Towel',
      'Soap & Shampoo',
      'Milk',
      'Toothpaste',
    ];

    Map<String, bool> checkedItems = {};
    for (var item in items) {
      checkedItems[item] = false;
    }

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
