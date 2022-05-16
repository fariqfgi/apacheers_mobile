class ReportModel {
  int? id;
  String? ip;
  String? description;
  String? vulnerability;
  String? datetime;
  String? method;
  String? url;
  String? payload;

  ReportModel({
    this.id,
    this.ip,
    this.description,
    this.vulnerability,
    this.datetime,
    this.method,
    this.url,
    this.payload,
  });

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ip = json['ip'];
    description = json['description'];
    vulnerability = json['vulnerability'];
    datetime = json['datetime'];
    method = json['method'];
    url = json['url'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ip': ip,
      'description': description,
      'vulnerability': vulnerability,
      'datetime': datetime,
      'method': method,
      'url': url,
      'payload': payload,
    };
  }
}
