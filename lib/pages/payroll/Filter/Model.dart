class PayrollFilterInputModel {
  DateTime? startDate ;
  DateTime? endDate = DateTime.now();
  String? branchName;

  setStartDate(DateTime? value) {
    startDate = value;
    return this;
  }
  setEndDate(DateTime? value) {
    endDate = value;
    return this;
  }

  setBranchName(String? value) {
    branchName = value;
    return this;
  }

}