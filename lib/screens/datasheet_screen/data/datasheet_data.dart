class DataSheet{
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  DataSheet(this.date, this.monthName, this.subjectName, this.dayName, this.time);
}

List<DataSheet> datasheet = [
    DataSheet(11, "JAN", "Computer Science", "Monday", "09:AM"),
    DataSheet(12, "FEB", "Chemistry", "Wednesday", "09:30 AM"),
    DataSheet(13, "FEB", "Chemistry", "Wednesday", "09:30 AM"),
    DataSheet(14, "MARCH", "Biology", "Tuesday", "10:AM"),
    DataSheet(15, "APRIL", "Physics", "Thursday", "11:00 AM"),
    DataSheet(16, "APRIL", "Physics", "Thursday", "11:00 AM"),

];