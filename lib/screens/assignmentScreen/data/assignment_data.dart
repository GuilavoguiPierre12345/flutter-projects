class AssignmentData{
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate, this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData("Biology", "Red Blood Cells", "26 Nov 2023", "30 Nov 2023", "Submitted"),
  AssignmentData("Physics", "bohr theory", "03 Oct 2023", "10 Oct 2023", "Pending"),
  AssignmentData("Chemistry", "Organic Chemistry", "12 Oct 2023", "20 Oct 2023", "Pending"),
  AssignmentData("Mathematics", "Algebra", "21 Oct 2023", "02 Dec 2023", "Pending"),
];