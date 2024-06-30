class ResultScreenData {
  final String subjectName;
  final int totalMarks;
  final int obtainedMarks;
  final String grade;

  ResultScreenData(
      this.subjectName, this.totalMarks, this.obtainedMarks, this.grade);
}

List<ResultScreenData> result = [
  ResultScreenData("English", 180, 98, "A"),
  ResultScreenData("Computer Science", 100, 50, "B"),
  ResultScreenData("Physics", 100, 25, "D"),
  ResultScreenData("Chemistry", 100, 80, "B"),
  ResultScreenData("PHP", 100, 88, "A"),
  ResultScreenData("Python", 100, 35, "D"),
  ResultScreenData("Java", 100, 35, "D"),
  ResultScreenData("JavaScript", 100, 80, "A"),
  ResultScreenData("API Integration", 100, 60, "C"),
  ResultScreenData("JavaSript FrameWorks", 100, 50, "C"),
  ResultScreenData("C and C++", 100, 30, "D"),
];
