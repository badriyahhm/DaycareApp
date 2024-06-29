import 'package:sqflite/sqflite.dart';

class DailyReport {
  int? id;
  String name;
  String date;
  String arrival;
  String bodyTemperature;
  String conditions;
  String mealsComments;
  String toiletTime1;
  String toiletType1;
  String toiletDryWetBM1;
  String toiletNotes1;
  String toiletTime2;
  String toiletType2;
  String toiletDryWetBM2;
  String toiletNotes2;
  String bottleTime;
  String bottleMl;
  String bottleType;
  String showerMorning;
  String showerAfternoon;
  String vitamin;
  String restStartTime;
  String restEndTime;
  String itemsNeeded;
  String otherItems;
  String createdAt;

  DailyReport({
    this.id,
    required this.name,
    required this.date,
    required this.arrival,
    required this.bodyTemperature,
    required this.conditions,
    required this.mealsComments,
    required this.toiletTime1,
    required this.toiletType1,
    required this.toiletDryWetBM1,
    required this.toiletNotes1,
    required this.toiletTime2,
    required this.toiletType2,
    required this.toiletDryWetBM2,
    required this.toiletNotes2,
    required this.bottleTime,
    required this.bottleMl,
    required this.bottleType,
    required this.showerMorning,
    required this.showerAfternoon,
    required this.vitamin,
    required this.restStartTime,
    required this.restEndTime,
    required this.itemsNeeded,
    required this.otherItems,
    required this.createdAt,
  });

  // Convert DailyReport to Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'arrival': arrival,
      'bodyTemperature': bodyTemperature,
      'conditions': conditions,
      'mealsComments': mealsComments,
      'toiletTime1': toiletTime1,
      'toiletType1': toiletType1,
      'toiletDryWetBM1': toiletDryWetBM1,
      'toiletNotes1': toiletNotes1,
      'toiletTime2': toiletTime2,
      'toiletType2': toiletType2,
      'toiletDryWetBM2': toiletDryWetBM2,
      'toiletNotes2': toiletNotes2,
      'bottleTime': bottleTime,
      'bottleMl': bottleMl,
      'bottleType': bottleType,
      'showerMorning': showerMorning,
      'showerAfternoon': showerAfternoon,
      'vitamin': vitamin,
      'restStartTime': restStartTime,
      'restEndTime': restEndTime,
      'itemsNeeded': itemsNeeded,
      'otherItems': otherItems,
      'createdAt': createdAt,
    };
  }

  // Convert Map object to DailyReport
  factory DailyReport.fromMap(Map<String, dynamic> map) {
    return DailyReport(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      arrival: map['arrival'],
      bodyTemperature: map['bodyTemperature'],
      conditions: map['conditions'],
      mealsComments: map['mealsComments'],
      toiletTime1: map['toiletTime1'],
      toiletType1: map['toiletType1'],
      toiletDryWetBM1: map['toiletDryWetBM1'],
      toiletNotes1: map['toiletNotes1'],
      toiletTime2: map['toiletTime2'],
      toiletType2: map['toiletType2'],
      toiletDryWetBM2: map['toiletDryWetBM2'],
      toiletNotes2: map['toiletNotes2'],
      bottleTime: map['bottleTime'],
      bottleMl: map['bottleMl'],
      bottleType: map['bottleType'],
      showerMorning: map['showerMorning'],
      showerAfternoon: map['showerAfternoon'],
      vitamin: map['vitamin'],
      restStartTime: map['restStartTime'],
      restEndTime: map['restEndTime'],
      itemsNeeded: map['itemsNeeded'],
      otherItems: map['otherItems'],
      createdAt: map['createdAt'],
    );
  }
}
