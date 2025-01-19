class StringsUtil {
  static const String APP_NAME = 'BRICKBOX HRMS';
  static const String INOVACE = 'INOVACE';
  static const String ADD_COMMENT_OR_REASON =
      'ADD COMMENT OR REASON';
  static const String NO_REASON_MENTIONED =
      'No reason mentioned';
  static const String DESCRIBE_REASON =
      'Please describe the reason.';
  static const String APPLY = 'APPLY';
  static const String OK = 'Ok';

  static const String PENDING = 'PENDING';
  static const String APPROVED = 'APPROVED';
  static const String REJECTED = 'REJECTED';
  static const String CANCELLED = 'CANCELLED';

  //PAGE TITLES
  static const String DASHBOARD_TITLE =
      'Dashboard';
  static const String PENDING_TITLE =
      'Pending Approval';
  static const String PROFILE_TITLE = 'Profile';
  static const String ALL_EMPLOYEES_TITLE =
      'All Employees';
  static const String ATTENDANCE_REPORT_TITLE =
      'Attendance Report';
  static const String ALLOCATE_TITLE = 'Allocate';
  static const String ALLOCATED_DEVICES_TITLE =
      'Allocated Devices';
  static const String TAKE_FINGERPRINT_TITLE =
      'Take Fingerprint';
  static const String MOBILE_PUMCH_TITLE =
      'Mobile Punch';

  static const String STATUS_BTN = 'GET STATUS';
  static const String START_BTN = 'START';
  static const String STOP_BTN = 'STOP';

  static const String STATUS_RUNNING =
      'STATUS: Running upto';
  static const String STATUS_NOT_RUNNING =
      'STATUS: Not Running';

  //EXIT APP
  static const String EXIT_APP_TITLE =
      'Are you sure?';
  static const String EXIT_APP_MSG =
      'Do you want to exit an App';
  static const String YES_TITLE = 'Yes';
  static const String NO_TITLE = 'No';

  //RESULT DIALOG
  static const String SUCCESS_TITLE = 'Success';
  static const String FAILED_TITLE = 'Failed';

  //NAV ITEMS
  static const String NAV_DASHBOARD_TITLE =
      'Dashboard';
  static const String NAV_REPORT_TITLE = 'Report';
  static const String NAV_PENDING_TITLE =
      'Pendings';
  static const String NAV_PROFILE_TITLE =
      'Profile';
  static const String NAV_ALL_EMPLOYEES_TITLE =
      'All Employees';
  static const String NAV_EMPLOYEES_TITLE =
      'Employees';
  static const String NAV_ABOUT_US_TITLE =
      'About Us';
  static const String NAV_LOGOUT_TITLE =
      'Log Out';
  static const String NAV_MORE_TITLE = 'More';
  static const String NAV_HOTKEYS_TITLE =
      'Hotkeys';

  //HOTKEYS
  static const String HOTKEYS_MOBILE_PUNCH_TITLE =
      'Mobile Punch';
  static const String HOTKEYS_MANUAL_ENTRY_TITLE =
      'Manual Entry';
  static const String HOTKEYS_APPLY_LATE_TITLE =
      'Apply Late';
  static const String HOTKEYS_APPLY_LEAVE_TITLE =
      'Apply Leave';
  static const String
      HOTKEYS_TAKE_FINGERPRINT_TITLE =
      'Take Fingerprint';
  static const String HOTKEYS_ALLOCATE_TITLE =
      'Allocate';
  static const String HOTKEYS_SITE_MANAGEMENT =
      'Site Management';

  //LAYOUT TITLES
  static const String
      ADMIN_DASHBOARD_STATS_LAYOUT_TITLE =
      'ATTENDANCE STATS';
  static const String
      ADMIN_DASHBOARD_FEEDS_LAYOUT_TITLE =
      'ATTENDANCE FEED';
  static const String
      USER_DASHBOARD_ATT_LAYOUT_TITLE =
      'LAST 4 DAYS ATTENDANCE';
  static const String THIS_MONTH_TITLE =
      'THIS MONTH';

  //ATTENDANCE FEED
  static const String FEED_MANUAl_ENTRY =
      'by Manual Entry';
  static const String FEED_FINGERPRINT =
      'by Fingerprint';
  static const String FEED_RFID = 'by RFID';
  static const String FEED_FACE =
      'by Face Device';

  static String feedAttType(int value) {
    switch (value) {
      case 1:
        return 'by Fingerprint';
      case 2:
        return 'by RFID';
      case 3:
        return 'by Manual Punch';
      case 4:
        return 'by Missing Punch';
      case 5:
        return 'by Field Visit';
      case 6:
        return 'by App Punch';
      case 7:
        return 'by Face Device';
      default:
        return '';
    }
  }

  static const String FEED_TEMP = 'Temp.';
  static String feedMask(bool hasMask) =>
      (hasMask) ? 'Wearing Mask' : 'No Mask';

  //LOGIN
  static const String CHECKING = 'Checking...';
  static const String LOGGING_IN =
      'Logging In...';
  static const String LOGGED_IN =
      'Logged In Successfully';
  static const String IN_HRM_TITLE = 'In HRM';
  static const String USER_SIGN_IN_TITLE =
      'USER SIGN IN';
  static const String EMAIL_HINT =
      'Enter your Email or Employee ID';
  static const String EMAIL_TITLE =
      'Email or Employee ID : ';
  static const String PASSWORD_HINT =
      'Enter your password';
  static const String PASSWORD_TITLE =
      'Password : ';
  static const String LOGIN_TITLE = 'LOGIN';
  static const String NO_EMAIL_ADDRESS =
      'No Email address';
  static const String NO_PASSWORD =
      'No Password provided';
  static const String PLEASE_ENTER_YOUR_EMAIL =
      'Please enter your Email';

  //ATTENDANCE STATS
  static const String PRESENT = 'Present';
  static const String LATE = 'Late';
  static const String ABSENT = 'Absent';
  static const String LEAVE = 'Leave';
  static const String ON_TIME = 'On Time';
  static const String TOTAL_HOUR = 'Total Hour';

  //PROFILE
  static const String DEPARTMENT_TITLE =
      'DEPARTMENT';
  static const String DESIGNATION_TITLE =
      'DESIGNATION';
  static const String FIRST_APPROVER_TITLE =
      'FIRST APPROVER';
  static const String SECOND_APPROVER_TITLE =
      'SECOND APPROVER';
  static const String ID_TITLE = 'ID';
  static const String RFID_TITLE = 'RFID';
  static const String SHIFT_GROUP_TITLE =
      'SHIFT GROUP';
  static const String LEAVE_POLICY_TITLE =
      'LEAVE POLICY';
  static const String MOBILE_TITLE = 'MOBILE';
  static const String EMERGENCY_TITLE =
      'EMERGENCY';

  //EMPLOYEE LIST
  static const String EMPLOYEE_SEARCH_HINT =
      'Search name, designation, department etc.';

  static const String NOT_APPLIED = 'N/A';
  static const String TODAY = 'Today';
  static const String SELECT_DEVICE_TITLE =
      'Select Device';
  static const String SELECT_EXCHANGE_DATE =
      'Select Date';

  static const String ALERT_TITLE = 'Instruction';
  static const String ALERT_MSG =
      'Please select a Device first.';
  static const String CONTINUE_BTN = 'Continue';

  static const String ENTRY_TITLE = 'Entry';
  static const String EXIT_TITLE = 'Exit';
  static const String HOLIDAY_TITLE = 'Holiday';
  static const String OFF_DAY_TITLE = 'Off Day';
  static const String ON_LEAVE_TITLE = 'On Leave';
  static const String ABSENT_TITLE = 'Absent';

  //ALLOCATION
  static const String ALLOCATE_BTN = 'Allocate';
  static const String REVOKE_BTN = 'Revoke';

  static const String ALLOCATION_SUCCESSFUL =
      'Allocated Successfully.';
  static const String ALLOCATION_UNSUCCESSFUL =
      'Unsuccessful.';
  static const String REVOKE_SUCCESSFUL =
      'Revoked Successfully.';
  static const String REVOKE_UNSUCCESSFUL =
      'Unsuccessful.';
  static const String ALLOCATE_ALL_SUCCESSFUL =
      'Allocated all users in all devices.';
  static const String ALLOCATE_ALL_UNSUCCESSFUL =
      'Unsuccessful.';
  static const String DEVICE_ID_TITLE =
      'DEVICE ID';
  static const String EXCHANGE_LEAVE_DAYS =
      'Available days';

  static const String ALLOCATION_MSG_1 =
      'Select a device';
  static const String ALLOCATION_MSG_2 =
      'then allocate or revoke people';

  static const String PROFILE_ALLOCATION_MSG_1 =
      'Opps!!!';
  static const String PROFILE_ALLOCATION_MSG_2 =
      'We could not find any allocation info';

  static const String DEVICE_DROPDOWN_TITLE =
      'Device';
  static const String ALLOCATE_ALL_BTN = 'ALL';

  static const String TAB_ALLOCATED = 'ALLOCATED';
  static const String TAB_UNALLOCATED =
      'UNALLOCATED';

  static const String ALL_ALLOCATE_ALERT_TITLE =
      'Are you sure?';
  static const String ALL_ALLOCATE_ALERT_MSG =
      'This will allocate ALL the people into ALL the devices.';

  //ATTENDANCE
  static const String ATTENDANCE_WARNING_TITLE =
      'Warning';
  static const String ATTENDANCE_WARNING_HINT =
      'Given date range is not valid. Please give a valid date range.';

  static const String MONTH_DATE_YEAR =
      'Month/Date/Year';
  static const String SELECT_START_DATE =
      'See Report from';
  static const String SELECT_END_DATE =
      'See Report until';

  static const String MISMATCH = 'Mismatch';

  //LEAVE APPLY
  static const String LEAVE_APPLY = 'Apply Leave';
  static const String
      SELECT_FROM_REMAINING_LEAVE =
      'SELECT FROM REMAINING LEAVE';
  static const String START_AND_AND_DATE =
      'START AND END DATE';
  static const String SELECT_TYPE = 'SELECT TYPE';
  static const String FULL_DAY = 'Full Day';
  static const String HALF_DAY = 'Half Day';
  static const String UPLOAD_FILE_MANDATORY =
      'Upload File (mandatory)';
  static const String UPLOAD_FILE_OPTIONAL =
      'Upload File (optional)';
  static const String JPG = 'JPEG. PNG or PDF';
  static const String START_DAY = 'START DATE';
  static const String END_DAY = 'END DATE';
  static const String LEAVE_DAY = 'LEAVE DATE';

  static const String UNACCEPTABLE_APPLICATION =
      'Unacceptable Application';
  static const String HALF_DAY_FOR_ONE_DAY =
      'You can apply half day leave for only one day.';
  static const String
      APPLIED_LEAVE_GREATER_THAN_REMAINING =
      'Number of days applied for leave is greater than leave remaining.';
  static const String NO_FILE_ATTACHED =
      'No file attached';
  static const String
      FILE_ATTACHMENT_FOR_MEDICAL =
      'File attachment is compulsory for medical leave.';
  static const String
      LEAVE_APPLICATION_SUCCESSFUL =
      'Leave application successfully submitted.';

  //PENDING APPROVAL
  static const String PENDING_APPROVAL =
      'Pendings';

  //LATE APPLY
  static const String LATE_APPLY = 'Apply Late';
  static const String SELECT_DATE = 'SELECT DATE';
  static const String NO_LATE_ATTENDANCE =
      "You don't have any late attendance";
  static const String
      LATE_APPLICATION_SUCCESSFUL =
      'Late application successfully submitted.';

  //MANUAL ENTRY
  static const String MANUAL_ENTRY =
      'Manual Entry';
  static const String AREA = 'Area';
  static const String NO_TYPE_SELECTED =
      'No type selected';
  static const String PLEASE_SELECT_A_TYPE =
      'Please select a type';
  static const String NO_AREA_SELECTED =
      'No area mentioned';
  static const String MENTION_AN_AREA =
      'Please type the name of visited area';
  static const String SAVE_MANUAL_ENTRY =
      'SAVE MANUAL ENTRY';
  static const String SAVE_MISSING_PUNCH =
      'SAVE MISSING PUNCH';
  static const String SAVE_FIELD_VISIT =
      'SAVE FIELD VISIT';
  static const String ENTRY_TIME = 'ENTRY TIME';
  static const String EXIT_TIME = 'EXIT TIME';
  static const String
      APPLICATION_SUBMISSION_SUCCESSFUL =
      'Your application successfully submitted.';
  static const String MANUAL_DROP_SELECT_TYPE =
      'Select Type';
  static const String MANUAL_DROP_MANUAL_ENTRY =
      'Manual Entry';
  static const String MANUAL_DROP_MISSING_PUNCH =
      'Missing Punch';
  static const String MANUAL_DROP_FIELD_VISIT =
      'Field Visit';
  static const String MANUAL_CONTACT_ADMIN =
      'Contact Admin';
  static const String
      MANUAL_NOT_ALLOCATED_IN_DEVICE =
      'You are not allocated in any device';
  static const String
      MANUAL_PLEASE_CONTACT_ADMIN =
      'Please contact with admin';

  //PENDING APPROVAL
  static const String LEAVE_APPLICATION_APPROVED =
      "LEAVE_APPLICATION_APPROVED";
  static const String LEAVE_APPLICATION_REJECTED =
      "LEAVE_APPLICATION_REJECTED";
  static const String LATE_APPLICATION_APPROVED =
      "LATE_APPLICATION_APPROVED";
  static const String LATE_APPLICATION_REJECTED =
      "LATE_APPLICATION_REJECTED";
  static const String MANUAL_ENTRY_APPROVED =
      "MANUAL_ENTRY_APPROVED";
  static const String MANUAL_ENTRY_REJECTED =
      "MANUAL_ENTRY_REJECTED";
  static const String MISSING_PUNCH_APPROVED =
      "MISSING_PUNCH_APPROVED";
  static const String MISSING_PUNCH_REJECTED =
      "MISSING_PUNCH_REJECTED";
  static const String FIELD_VISIT_APPROVED =
      "FIELD_VISIT_APPROVED";
  static const String FIELD_VISIT_REJECTED =
      "FIELD_VISIT_REJECTED";

  static const String
      LEAVE_APPLICATION_APPROVED_DETAILS =
      "LEAVE_APPLICATION_APPROVED_DETAILS";
  static const String
      LEAVE_APPLICATION_REJECTED_DETAILS =
      "LEAVE_APPLICATION_REJECTED_DETAILS";
  static const String
      LATE_APPLICATION_APPROVED_DETAILS =
      "LATE_APPLICATION_APPROVED_DETAILS";
  static const String
      LATE_APPLICATION_REJECTED_DETAILS =
      "LATE_APPLICATION_REJECTED_DETAILS";
  static const String
      MANUAL_ENTRY_APPROVED_DETAILS =
      "MANUAL_ENTRY_APPROVED_DETAILS";
  static const String
      MANUAL_ENTRY_REJECTED_DETAILS =
      "MANUAL_ENTRY_REJECTED_DETAILS";
  static const String
      MISSING_PUNCH_APPROVED_DETAILS =
      "MISSING_PUNCH_APPROVED_DETAILS";
  static const String
      MISSING_PUNCH_REJECTED_DETAILS =
      "MISSING_PUNCH_REJECTED_DETAILS";
  static const String
      FIELD_VISIT_APPROVED_DETAILS =
      "FIELD_VISIT_APPROVED_DETAILS";
  static const String
      FIELD_VISIT_REJECTED_DETAILS =
      "FIELD_VISIT_REJECTED_DETAILS";

  static const String ACCEPT = 'ACCEPT';
  static const String REJECT = 'REJECT';
  static const String RESPONSE_SUCCESSFUL =
      'Your response for the approval has been successfully accepted';

  //TAKE_FINGERPRINT
  static const String
      ENROLLMENT_START_SUCCESSFUL =
      'Enrollment Started Successfully';
  static const String ENROLLMENT_STOP_SUCCESSFUL =
      'Enrollment Stopped Successfully';

  //MOBILE_PUNCH
  static const String OK_BTN = 'Ok';
  static const String SET_WORKPLACE_BTN =
      'Set Workplace';

  static const String PUNCH_SUCCESSFUL =
      'Punch Given Successfully.';
  static const String PUNCH_UNSUCCESSFUL =
      'Operation Failed';

  static const String WORKPLACE_SET_SUCCESSFUL =
      'Workplace was set Successfully.';
  static const String WORKPLACE_SET_UNSUCCESSFUL =
      'Operation Failed';

  static const String ALREADY_ASSIGNED_WORKPLACE =
      'Already Assigned Workplace';
  static const String WORKPLACE_NOT_SET =
      'Workplace not set yet';
  static const String
      WORKPLACE_NOT_SET_INSTRUCTION =
      'Press the set location button and set your workplace from map';

  static const String WORKPLACE = 'Workplace';
  static const String
      OUT_OF_WORKPLACE_INSTRUCTION =
      'Out of workplace location. Please stay in the workplace to give punch';
  static const String IN_WORKPLACE_INSTRUCTION =
      'You are all set. Now press and hold the green button to make sure attendance';
  static const String
      ALREADY_GAVE_PUNCH_INSTRUCTION =
      'Already gave punch within 10mins';

  static const String AWAY_FROM_WORKPLACE =
      'Away from workplace';

  static const String MY_LOCATION = 'My Location';
  static const String LATITUDE = 'Latitude';
  static const String LONGITUDE = 'Logitude';

  static const String TYPE_LOCATION_HINT =
      'Type Location Name...';
  static const String SET_LOCATION_TITLE =
      'Set Location';

  static const String INSRUCTIONS_TITLE =
      'Instructions';
  static const String INSRUCTIONS_MSG =
      '***You can only set your workplace once from app. So carefully set your workplace***' +
          '\n - Click the my location button at the right top of the screen' +
          '\n - Zoom to max possible level to your location' +
          '\n - Long press to add a marker to your location' +
          '\n - Click the marker to continue' +
          '\n - Type workplace name' +
          '\n - Press Set Location button to confirm';

  static const String MOBILE_PUNCH_WARNING_TITLE =
      'Warning';
  static const String MOBILE_PUNCH_WARNING_HINT =
      'Please Type Workplace Name';

  //MISCELLANEOUS
  static const String SELECT_DEVICE_SNACKBAR =
      'Please select a device to see the allocation list.';

  static const String NO_DATA = 'No Data';
  static const String TITLE_SET_LOCATION =
      'Select your location';

  //About Us
  static const String ABOUT_US = 'About Us';
  static const String VERSION = 'Version : ';
  static const String INOVACE_TECHNOLOGIES =
      'We are Inovace Technologies';
  static const String ABOUT_US_DESCRIPTION =
      'We provide hassle-free, easily '
      'deployable, flexible IoT solutions and help business to grow efficiently.';
  static const String OUR_PRODUCTS =
      'Our Products';

  //History
  static const String NAV_HISTORY = 'History';
  static const String EMPTY = 'Empty';
  static const String NO_HISTORY =
      'There is no application pending';
  static const String NO_LATE_HISTORY =
      'There is no late application pending';
  static const String NO_LEAVE_HISTORY =
      'There is no leave application pending';
  static const String NO_MANUAL_HISTORY =
      'There is no manual entry application pending';

  //LOGOUT
  static const String CONFIRMATION_LOGOUT =
      "Do you want to logout?";

  static const String TIPSOI_TITLE = 'Tipsoi';
  static const String TIPSOI_SUBTITLE =
      'Smart Attendance';
  static const String DORPON_TITLE = 'Dorpon';
  static const String DORPON_SUBTITLE =
      'Contactless attendance ';
  static const String INSALES_TITLE = 'InSales';
  static const String INSALES_SUBTITLE =
      'Sell smarter';
  static const String CHOKROJAN_TITLE =
      'Chokrojan';
  static const String CHOKROJAN_SUBTITLE =
      'Buy tickets online';
  static const String NIRAPOD_TITLE = 'Nirapod';
  static const String NIRAPOD_SUBTITLE =
      'Remote tracking';
  static const String INDUSTRIAL_SOLUTION_TITLE =
      'IOMS';
  static const String
      INDUSTRIAL_SOLUTION_SUBTITLE =
      'Industrial automation';

  static const String TIPSOI_URL =
      'https://inovacetech.com/tipsoi-21-gprs/';
  static const String DORPON_URL =
      'https://inovacetech.com/';
  static const String INSALES_URL =
      'https://inovacetech.com/insales/';
  static const String CHOKROJAN_URL =
      'https://inovacetech.com/chokrojan/';
  static const String NIRAPOD_URL =
      'https://inovacetech.com/nirapod_app/';
  static const String INDUSTRIAL_SOLUTION_URL =
      'https://inovacetech.com/';
  static const String INOVACE_URL =
      'https://inovacetech.com/';
  static const String WEB_LINK =
      'https://hrm.brickbox.xyz/login';

  //LOCALIZATION
  static const String ENGLISH = 'en';
  static const String BENGALI = 'bn';
  static const String US = 'US';
}
