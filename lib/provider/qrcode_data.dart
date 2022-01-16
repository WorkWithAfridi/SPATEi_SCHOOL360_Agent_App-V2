class QRCodeDataProvider {
  late String _studentId;
  late String _schoolId;
  late String _receipt_no;
  late String _studentName;

  String get studentName => _studentName;

  set studentName(String value) {
    _studentName = value;
  }

  set studentId(String value) {
    _studentId = value;
  }

  QRCodeDataProvider();


  String get studentId => _studentId;

  String get receipt_no => _receipt_no;

  String get schoolId => _schoolId;

  set schoolId(String value) {
    _schoolId = value;
  }

  set receipt_no(String value) {
    _receipt_no = value;
  }
}
