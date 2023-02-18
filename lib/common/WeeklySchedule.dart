class WeeklyScheduleDataStructure {
  List<int> dates = [];

  WeeklyScheduleDataStructure(Map<DateTime,int> values) {
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 24; j++) {

        dates.add(-1);
      }
    }
    values.forEach((key, value) {
      var index = _index(key);
      dates[index] = value;
    });
  }

  Map<DateTime,int> toMap(){
    Map<DateTime,int> map = {};
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 24; j++) {
        var index = _index(DateTime(2021, 1, 1 + i, j));
        map[DateTime(2021, 1, 1 + i, j)] = dates[index];
      }
    }
    return map;
  }

  int _index(DateTime date) {
    var day = date.weekday;
    var hour = date.hour;
    var index = (day-1) * 24 + hour;
    return index;
  }

  getDate(DateTime date) {
    var index = _index(date);
    return dates[index];
  }

  setDate(DateTime date, int mode) {
    var index = _index(date);
    dates[index] = mode;
  }

  toJson(){
    return dates;
  }

  fromJson(List<int> json){
    dates = json;
  }

  copy(){
    return WeeklyScheduleDataStructure(toMap());
  }
}
