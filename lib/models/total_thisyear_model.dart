class TotalThisyearModel {
  int? total_report;
  String? month;

  TotalThisyearModel({
    this.total_report,
    this.month,
  });

  TotalThisyearModel.fromJson(Map<String, dynamic> json) {
    total_report = json['total_report'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    return {
      'total_report': total_report,
      'month': month,
    };
  }
}
