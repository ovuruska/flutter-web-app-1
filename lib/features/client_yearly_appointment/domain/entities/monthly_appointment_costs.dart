

class MonthlyAppointmentCosts {
  final double tip;
  final double weWash;
  final double fullGrooming;
  final double products;

  MonthlyAppointmentCosts({
    required this.tip,
    required this.weWash,
    required this.fullGrooming,
    required this.products,
});

  factory MonthlyAppointmentCosts.fromJson(Map<String, dynamic> json) {
    if(json["tip"] is String){
      json["tip"] = double.parse(json["tip"]);
    }
    if(json["we_wash"] is String){
      json["we_wash"] = double.parse(json["we_wash"]);
    }
    if(json["full_grooming"] is String){
      json["full_grooming"] = double.parse(json["full_grooming"]);
    }
    if(json["products"] is String){
      json["products"] = double.parse(json["products"]);
    }

    return MonthlyAppointmentCosts(
      tip: json['tip'] as double,
      weWash: json['we_wash'] as double,
      fullGrooming: json['full_grooming'] as double,
      products: json['products'] as double,
    );
  }
}
