import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:daycare/screen/login.dart';
import 'package:daycare/models/dataanak.dart';

class DailyReportScreen extends StatefulWidget {
  final DataAnak dataAnak;

  const DailyReportScreen({required this.dataAnak, super.key});

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
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        controller.text = picked.format(context);
      });
    }
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
          'Daily Report',
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
            const SizedBox(height: 20),
            buildSectionTitle('Meals', Icons.restaurant),
            buildMealsSection(),
            const SizedBox(height: 20),
            buildSectionTitle('Toilet', Icons.clean_hands),
            buildToiletSection(),
            buildSectionTitle('Rest', Icons.bedtime),
            buildRestSection(),
            const SizedBox(height: 20),
            buildSectionTitle('Bottle', Icons.local_cafe),
            buildBottleSection(),
            const SizedBox(height: 20),
            buildSectionTitle('Other', Icons.toys),
            buildOtherSection(),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            buildSectionTitle('Notes for My Parents', Icons.inventory),
            buildNotesForParentsSection(),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Daily report submitted successfully')),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFFC7275)),
                child: const Text(
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
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0XFFFFE2DF),
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
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0XFFFFE2DF),
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
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0XFFFFE2DF),
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
        const SizedBox(
          width: 10,
        ),
        Icon(
          icon,
          color: const Color(0XFF4938C0),
          size: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
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
        color: const Color(0XFFFFE2DF),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 2, child: buildTextField(label, TextEditingController())),
          const SizedBox(width: 10),
          Expanded(
              flex: 1,
              child: buildDropdown('Quantity', ['None', 'Some', 'Lots'])),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0XFFFFE2DF),
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
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0XFFFFD1CD),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          buildTimePicker('Time', TextEditingController(), context),
          Row(
            children: [
              Expanded(
                  flex: 2, child: buildDropdown('Type', ['Diaper', 'Potty'])),
              const SizedBox(width: 10),
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text('Shower',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        buildTimePicker('Morning', TextEditingController(), context),
        buildTimePicker('Afternoon', TextEditingController(), context),
        const SizedBox(height: 10),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text('Vitamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text('Item I Need',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        buildMultiChoiceItems(),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: buildTextField('Other', otherItemController)),
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
