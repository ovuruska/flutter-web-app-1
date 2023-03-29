


class BranchWorkingHour {
  final DateTime? start;
  final DateTime? end;
  final DateTime date;

  BranchWorkingHour({
    this.start,
    this.end,
    required this.date,
  });

  factory BranchWorkingHour.fromJson(Map<String, dynamic> json){
    var date = DateTime.parse(json['date']);
    var start = null;
    var end = null;
    if(json["start"] != null){
      var startDecoded = DateTime.parse(json['start']);
      start = DateTime(date.year, date.month, date.day, startDecoded.hour, startDecoded.minute);

    }
    if(json["end"] != null){
      var endDecoded = DateTime.parse(json['end']);
      end = DateTime(date.year, date.month, date.day, endDecoded.hour, endDecoded.minute);
    }
    return BranchWorkingHour(
      start: start,
      end: end,
      date: DateTime.parse(json['date']),
    );
  }


  Map<String, dynamic> toJson() => {
    'start': start?.toIso8601String(),
    'end': end?.toIso8601String(),
    'date': date.toIso8601String(),
  };
}



