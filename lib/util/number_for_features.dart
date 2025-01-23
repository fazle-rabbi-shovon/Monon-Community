class NumberUtil {
  static const int leaveApplyApprove = 101;
  static const int leaveApplyReject = 102;

  static const int lateApplyApprove = 111;
  static const int lateApplyReject = 112;

  static const int manualEntryApplyApprove = 121;
  static const int manualEntryApplyReject = 122;

  static const int missingPunchApplyApprove = 131;
  static const int missingPunchApplyReject = 132;

  static const int fieldVisitApplyApprove = 141;
  static const int fieldVisitApplyReject = 142;

  static const int nameLocalChange = 1001;
  static const int emailLocalChange = 1002;
  static const int officeIdLocalChange = 1003;
  static const int departmentLocalChange = 1004;
  static const int subDepartmentLocalChange = 1025;
  static const int designationLocalChange = 1005;
  static const int firstApproverLocalChange = 1006;
  static const int secondApproverLocalChange = 1007;
  static const int leavePolicyLocalChange = 1008;
  static const int shiftGroupLocalChange = 1009;
  static const int phoneNumberLocalChange = 1010;
  static const int primaryDisplayLocalChange = 1011;
  static const int secondaryDisplayLocalChange = 1012;

  static const int defaultDepartmentHierarchy = 30;
  static const int defaultDesignationHierarchy = 30;

  static const int fingerprintResponse = 1010;
  static const int RFIDResponse = 1011;

  static const int departmentAdd = 1012;
  static const int departmentDelete = 1013;
  static const int departmentEdit = 1014;

  static const int designationAdd = 1015;
  static const int designationDelete = 1016;
  static const int designationEdit = 1017;

  static const int deviceAdd = 1018;
  static const int deviceDelete = 1019;
  static const int deviceEdit = 1020;

  static const String mobilePunchEnabledCompany = '9006';
  static const String locationtrackingEnabledCompany = '9007';

  static const double oneOpacity = 1.0;
  static const double pointThreeOpacity = 0.3;

  static late double deviceHeight;
}
