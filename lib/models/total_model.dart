class TotalModel {
  int? total;

  TotalModel({
    required this.total,
  });

  TotalModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
    };
  }
}
