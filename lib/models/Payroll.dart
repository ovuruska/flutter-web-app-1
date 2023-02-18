
/*

	employee_name = models.CharField(max_length=128)
	start = models.DateTimeField()
	end = models.DateTimeField()
	tips = models.DecimalField(max_digits=10, decimal_places=2)
	service_cost = models.DecimalField(max_digits=10, decimal_places=2)
	product_cost = models.DecimalField(max_digits=10, decimal_places=2)
	working_hours = models.IntegerField()

 */
class PayrollModel{

  String employeeName;
  DateTime start;
  DateTime end;
  double tips;
  double serviceCost;
  double productCost;
  int workingHours;

  PayrollModel({
    required this.employeeName,
    required this.start,
    required this.end,
    required this.tips,
    required this.serviceCost,
    required this.productCost,
    required this.workingHours,
  });

  factory PayrollModel.fromJson(Map<String, dynamic> json) => PayrollModel(
    employeeName: json["employee_name"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    tips: json["tips"],
    serviceCost: json["service_cost"],
    productCost: json["product_cost"],
    workingHours: json["working_hours"],
  );

  Map<String, dynamic> toJson() => {
    "employee_name": employeeName,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
    "tips": tips,
    "service_cost": serviceCost,
    "product_cost": productCost,
    "working_hours": workingHours,
  };

}