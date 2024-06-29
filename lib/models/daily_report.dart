class DailyReport {
  int? id;
  String date;
  String report;
  int childId;

  DailyReport(
      {this.id,
      required this.date,
      required this.report,
      required this.childId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'report': report,
      'childId': childId,
    };
  }

  factory DailyReport.fromMap(Map<String, dynamic> map) {
    return DailyReport(
      id: map['id'],
      date: map['date'],
      report: map['report'],
      childId: map['childId'],
    );
  }
}
