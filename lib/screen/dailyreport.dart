import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:daycare/screen/login.dart';
import 'package:daycare/models/dataanak.dart';

class DailyReportScreen extends StatefulWidget {
  final DataAnak dataAnak;

  DailyReportScreen({required this.dataAnak});

  @override
  _DailyReportScreenState createState() => _DailyReportScreenState();
}

class _DailyReportScreenState extends State<DailyReportScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController arrivalController = TextEditingController();
  final TextEditingController bodyTemperatureController =
      TextEditingController();
  final TextEditingController conditionsController = TextEditingController();
  final TextEditingController otherItemController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
        controller.text = picked.format(context);
      });
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
        title: Text(
          'Daily Report',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0XFF909FF9),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/mascots.png',
              fit: BoxFit.fitWidth,
            ),
            buildTextField('Name', nameController),
            buildDatePicker('Date', dateController, context),
            buildTimePicker('Arrival', arrivalController, context),
            buildTextField('Body Temperature', bodyTemperatureController),
            buildTextField('Conditions', conditionsController),
            SizedBox(height: 20),
            buildSectionTitle('Meals', Icons.restaurant),
            buildMealsSection(),
            SizedBox(height: 20),
            buildSectionTitle('Toilet', Icons.clean_hands),
            buildToiletSection(),
            buildSectionTitle('Rest', Icons.bedtime),
            buildRestSection(),
            SizedBox(height: 20),
            buildSectionTitle('Bottle', Icons.local_cafe),
            buildBottleSection(),
            SizedBox(height: 20),
            buildSectionTitle('Other', Icons.toys),
            buildOtherSection(),
            SizedBox(height: 20),
            SizedBox(height: 20),
            buildSectionTitle('Notes for My Parents', Icons.inventory),
            buildNotesForParentsSection(),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Daily report submitted successfully')),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFFFC7275)),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0XFFFFE2DF),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label, border: InputBorder.none),
      ),
    );
  }

  Widget buildDatePicker(
      String label, TextEditingController controller, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0XFFFFE2DF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextField(
            controller: controller,
            decoration:
                InputDecoration(labelText: label, border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget buildTimePicker(
      String label, TextEditingController controller, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0XFFFFE2DF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () => _selectTime(context, controller),
        child: AbsorbPointer(
          child: TextField(
            controller: controller,
            decoration:
                InputDecoration(labelText: label, border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Icon(
          icon,
          color: Color(0XFF4938C0),
          size: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0XFF4938C0)),
        ),
      ],
    );
  }

  Widget buildMealsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildMealItem('Breakfast'),
        buildMealItem('Snack'),
        buildMealItem('Lunch'),
        buildMealItem('Dinner'),
        buildMealItem('Fluids'),
        buildMealItem('Other'),
        buildTextField('Comments', TextEditingController()),
      ],
    );
  }

  Widget buildMealItem(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFE2DF),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 2, child: buildTextField(label, TextEditingController())),
          SizedBox(width: 10),
          Expanded(
              flex: 1,
              child: buildDropdown('Quantity', ['None', 'Some', 'Lots'])),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0XFFFFE2DF),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label, border: InputBorder.none),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {},
      ),
    );
  }

  Widget buildToiletSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildToiletItem(),
        buildToiletItem(),
      ],
    );
  }

  Widget buildToiletItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0XFFFFD1CD),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          buildTimePicker('Time', TextEditingController(), context),
          Row(
            children: [
              Expanded(
                  flex: 2, child: buildDropdown('Type', ['Diaper', 'Potty'])),
              SizedBox(width: 10),
              Expanded(
                  flex: 2,
                  child: buildDropdown('Dry/Wet/BM', ['Dry', 'Wet', 'BM'])),
            ],
          ),
          buildTextField('Notes', TextEditingController()),
        ],
      ),
    );
  }

  Widget buildBottleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTimePicker('Time', TextEditingController(), context),
        buildTextField('Ml', TextEditingController()),
        buildDropdown('Bottle Type', ['Breast', 'Formula', 'Milk']),
      ],
    );
  }

  Widget buildOtherSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text('Shower',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
        buildTimePicker('Morning', TextEditingController(), context),
        buildTimePicker('Afternoon', TextEditingController(), context),
        SizedBox(height: 10),
        Container(
          child: Text('Vitamin',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
        buildTextField('Vitamin', TextEditingController()),
      ],
    );
  }

  Widget buildRestSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTimePicker('Start Time', TextEditingController(), context),
        buildTimePicker('End Time', TextEditingController(), context),
      ],
    );
  }

  Widget buildNotesForParentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text('Item I Need',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
        buildMultiChoiceItems(),
        Container(
          child: buildTextField('Other', otherItemController),
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
      ],
    );
  }

  Widget buildMultiChoiceItems() {
    return Column(
      children: [
        buildCheckboxListTile('Diapers'),
        buildCheckboxListTile('Hand Towel'),
        buildCheckboxListTile('Cream'),
        buildCheckboxListTile('Clothes'),
        buildCheckboxListTile('Towel'),
        buildCheckboxListTile('Soap & Shampoo'),
        buildCheckboxListTile('Milk'),
        buildCheckboxListTile('Toothpaste'),
      ],
    );
  }

  Widget buildCheckboxListTile(String title) {
    return CheckboxListTile(
      title: Text(title),
      value: false,
      onChanged: (bool? value) {},
    );
  }
}
