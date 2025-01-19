import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/login/login_view.dart';
import '../ui/splash/splash_screen_view.dart';
/*
import 'package:inhrm/app/ui/features/confirm_site_entry/model/path_argument_confirm_entry.dart';
import 'package:inhrm/app/ui/features/confirm_site_entry/view/confirm_site_entry_view.dart';
import 'package:inhrm/app/ui/features/late_apply/model/path_argument_late_apply.dart';
import 'package:inhrm/app/ui/features/pending_approval/model/path_argument_pending.dart';
import 'package:inhrm/app/ui/features/punch_image_upload/model/path_argument_punch_without_settings.dart';
import 'package:inhrm/app/ui/features/site_attendance/model/path_argument_site_attendance.dart';
import 'package:inhrm/app/ui/features/site_attendance/view/site_attendance_view.dart';
import 'package:inhrm/app/ui/features/take_fingerprint/model/path_argument_enroll_from_profile.dart';
import 'package:inhrm/app/ui/features/splash/login_view.dart';
import '../data/model/employee.dart';
import '../ui/features/allocation/view/allocation_view.dart';
import '../ui/features/attendance/view/attendance_view.dart';
import '../ui/features/department_add/view/department_add_view.dart';
import '../ui/features/designation_add/view/designation_add_view.dart';
import '../ui/features/device_add/view/device_add_view.dart';
import '../ui/features/employee_create/view/employee_create_view.dart';
import '../ui/features/employee_list/model/path_argument_employeeDirectory.dart';
import '../ui/features/employee_list/view/employee_list_view.dart';
import '../ui/features/employee_list/widgets/employee_directory_profile.dart';
import '../ui/features/enroll/enroll_view.dart';
import '../ui/features/enroll/path_argument_enroll.dart';
import '../ui/features/help_enrolement/help_enrollment_page_view.dart';
import '../ui/features/help_n_support/help_n_support_view.dart';
import '../ui/features/history/model/mobile_punch_history.dart';
import '../ui/features/history/model/path_argument_history.dart';
import '../ui/features/history/view/history_view.dart';
import '../ui/features/late_apply/view/late_view.dart';
import '../ui/features/leave_adjust_new/model/path_argument_leave_adjust.dart';
import '../ui/features/leave_adjust_new/view/leave_adjust_view.dart';
import '../ui/features/leave_apply_new/view/leave_apply_view.dart';
import '../ui/features/leave_details/model/path_argument_leave_details.dart';
import '../ui/features/leave_details/view/leave_details_view.dart';
import '../ui/features/manage_office/manage_office_view.dart';
import '../ui/features/manual_entry/model/path_argument_manual_entry.dart';
import '../ui/features/manual_entry/view/manual_entry_view.dart';
import '../ui/features/mobile_punce_new/view/mobile_punch_new_view.dart';
import '../ui/features/mobile_punch/view/mobile_punch_view.dart';
import '../ui/features/mobile_punch/view/work_location_view.dart';
import '../ui/features/mobile_punch_history/view/mobile_punch_history_view.dart';
import '../ui/features/mobile_punch_history_details/view/mobile_punch_history_details_view.dart';
import '../ui/features/on_board_enroll_success/view/enroll_success_view.dart';
import '../ui/features/pending_approval/view/pending_approval_view.dart';
import '../ui/features/profile/model/path_argument_profile.dart';
import '../ui/features/profile/model/path_argument_settings.dart';
import '../ui/features/profile/view/profile_view.dart';
import '../ui/features/profile_allocation/view/profile_allocation_view.dart';
import '../ui/features/profile_image_upload/model/path_argument_image_upload.dart';
import '../ui/features/profile_image_upload/view/profile_image_upload_view.dart';
import '../ui/features/punch_image_upload/model/path_argument_punch_image.dart';
import '../ui/features/punch_image_upload/model/path_argument_punch_image_2.dart';
import '../ui/features/punch_image_upload/view/punch_image_view.dart';
import '../ui/features/rfid_admin/view/rfid_admin_view.dart';
import '../ui/features/scan_register/model/device.dart';
import '../ui/features/scan_register/model/path_argument_scan.dart';
import '../ui/features/scan_register/view/scan_register_view.dart';
import '../ui/features/settings/view/settings_view.dart';
import '../ui/features/sign_up_admin/view/sign_up_admin_view.dart';
import '../ui/features/sign_up_complete/sign_up_complete_view.dart';
import '../ui/features/take_fingerprint/model/path_argument.dart';
import '../ui/features/take_fingerprint/view/take_fingerprint_view.dart';
import '../ui/home/view/home_view.dart';
import '../ui/login/view/login_view.dart';

 */

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return navigateToRoute(
          builder: (_) => LoginView(),
        );


      case '/splash':
        return navigateToRoute(
          builder: (_) => SplashScreen(),
        );

      // case '/home':
      //   return navigateToRoute(
      //     builder: (_) => HomeView(),
      //   );
      //
      // case '/attendance':
      //   if (args is int) {
      //     int employeeId = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => AttendanceView(employeeId, true),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/attendanceForUser':
      //   if (args is int) {
      //     int employeeId = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => AttendanceView(employeeId, false),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/pending_approval':
      //   if (args is PathArgumentPending) {
      //     return navigateToRoute(
      //       builder: (_) => PendingApprovalView(args.employeeId, args.index),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/history':
      //   if (args is PathArgumentHistory) {
      //     return navigateToRoute(
      //       builder: (_) => HistoryView(args.item, args.employeeId,
      //           args.isAdminEntry, args.backButtonNeeded, args.index),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/mobilePunchHistory':
      //   if (args is MobilePunchHistory) {
      //     return navigateToRoute(
      //       builder: (_) => MobilePunchHistoryView(args),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/mobilePunchDetails':
      //   if (args is int) {
      //     return navigateToRoute(
      //       builder: (_) => MobilePunchHistoryDetailsView(args),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/settings':
      //   if (args is PathArgumentSettings) {
      //     return navigateToRoute(
      //       builder: (_) => SettingsView(args.employee, args.isAdminEntry),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/leave_adjust':
      //   if (args is PathArgumentLeaveAdjust) {
      //     return navigateToRoute(
      //       builder: (_) => LeaveAdjustView(
      //           args.userId, args.latestHistory, args.remaining),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/confirm_entry':
      //   if (args is PathArgumentConfirmEntry) {
      //     return navigateToRoute(
      //       builder: (_) => ConfirmSiteEntryView(
      //         args.imageFile,
      //         args.siteEmployee,
      //       ),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/employeeCreate':
      //   if (args is int) {
      //     int shiftGroupId = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => EmployeeCreateView(shiftGroupId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/sign_up_complete':
      //   if (args is Device) {
      //     Device device = args;
      //     return navigateToRoute(
      //       builder: (_) => SignUpComplete(device),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/sign_up_admin':
      //   if (args is Device) {
      //     Device device = args;
      //     return navigateToRoute(
      //       builder: (_) => SignUpAdminView(device),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/late':
      //   if (args is PathArgumentLateApply) {
      //     return navigateToRoute(
      //       builder: (_) => LateAttendanceView(
      //           args.employeeId, args.adminOwnProfile, args.isAdmin),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/leaveApply':
      //   if (args is PathArgumentLateApply) {
      //     return navigateToRoute(
      //       builder: (_) => LeaveApplyView(
      //           args.employeeId, args.adminOwnProfile, args.isAdmin),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/siteAttendance':
      //   if (args is PathArgumentSiteAttendance) {
      //     return navigateToRoute(
      //       builder: (_) => SiteAttendanceView(args.employeeId!),
      //     );
      //   }
      //   return _underConstructionRoute('Error');
      //
      // case '/leaveDetails':
      //   if (args is PathArgumentLeaveDetails) {
      //     return navigateToRoute(
      //       builder: (_) => LeaveDetailsView(
      //           args.employeeId, args.leaveLogId, args.isFromHistory),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/manualEntry':
      //   if (args is PathArgumentManualEntry) {
      //     return navigateToRoute(
      //       builder: (_) => ManualEntryView(
      //           args.item, args.isAdmin, args.fromMore, args.adminOwnProfile),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/profile':
      //   if (args is PathArgumentProfile) {
      //     return navigateToRoute(
      //       builder: (_) => ProfileView(
      //         Key('profileView'),
      //         args.employeeId,
      //         args.isAdminEntry,
      //         args.isHrManager,
      //         args.isLineManager
      //       ),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/profile_image_upload':
      //   if (args is PathArgumentImageUpload) {
      //     return navigateToRoute(
      //       builder: (_) => ProfileImageView(args.item),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/punch_image_upload':
      //   if (args is PathArgumentPunchImage) {
      //     print('Location Tracking Enabled222: ${args.isLocationTrackingEnabled}');
      //     return navigateToRoute(
      //       builder: (_) => PunchImageView(
      //           args.address,
      //           args.timeString,
      //           args.latitude,
      //           args.longitude,
      //           args.companyId,
      //           args.mobilePunchGeneralSettings,
      //           args.isGeneralSettings,args.isLocationTrackingEnabled,args.passEmployeeId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/punch_image_upload_2':
      //   if (args is PathArgumentPunchImage2) {
      //     print('Location Tracking Enabled3333: ${args.isLocationTrackingEnabled}');
      //     return navigateToRoute(
      //       builder: (_) => PunchImageView.fromPunch(
      //           args.punchId,
      //           args.address,
      //           args.timeString,
      //           args.latitude,
      //           args.longitude,
      //           args.companyId,
      //           args.mobilePunchGeneralSettings,
      //           args.isGeneralSettings,args.isLocationTrackingEnabled,args.passEmployeeId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/punch_image_upload_without_settings':
      //   if (args is PathArgumentPunchWithoutSettings) {
      //     print('Location Tracking Enabled5555: ${args.isLocationTrackingEnabled}');
      //     return navigateToRoute(
      //       builder: (_) => PunchImageView.withoutGeneralSettings(
      //         args.punchId,
      //         args.address,
      //         args.timeString,
      //         args.latitude,
      //         args.longitude,
      //         args.companyId,
      //         args.isGeneralSettings,args.isLocationTrackingEnabled,
      //       args.passEmployeeId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/profile_device_allocation':
      //   if (args is Employee) {
      //     Employee employee = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => ProfileAllocationView(employee),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/mobile_punch':
      //   if (args is Employee) {
      //     Employee employee = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => MobilePunchView(employee),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/takeFingerprintList':
      //   if (args is EmployeeListView) {
      //     EmployeeListView employeeListView = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => employeeListView,
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/takeFingerprint':
      //   if (args is PathArgument) {
      //     return navigateToRoute(
      //       builder: (_) => TakeFingerprintView(
      //         args.item,
      //         args.deviceId!,
      //         args.isCreateAdmin,
      //       ),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/takeFingerprintFromProfile':
      //   if (args is PathArgumentEnrollFromProfile) {
      //     return navigateToRoute(
      //       builder: (_) => TakeFingerprintView.FromProfile(
      //         args.item,
      //         args.isCreateAdmin,
      //       ),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/employee_directory':
      //   if (args is PathArgumentEmployeeDirectory) {
      //     return navigateToRoute(
      //       builder: (_) => EmployeeDirectoryProfile(args.itemDirectory),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/allocation':
      //   return navigateToRoute(
      //     builder: (_) => AllocationView(),
      //   );
      //
      // case '/help_enrollment':
      //   return navigateToRoute(
      //     builder: (_) => HelpEnrollment(),
      //   );
      //
      // case '/work_location':
      //   return navigateToRoute(
      //     builder: (_) => WorkLocationView(),
      //   );
      //
      // case '/help_n_support':
      //   if (args is bool) {
      //     //String version = args;
      //     return navigateToRoute(
      //       builder: (_) => HelpSupportView(args),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/scan_register':
      //   if (args is bool) {
      //     bool isCreateAdmin = args;
      //     return navigateToRoute(
      //       builder: (_) => ScanRegisterView(isCreateAdmin),
      //     );
      //   }
      //   return _underConstructionRoute('Error');
      //
      // case '/scan_register_add_device':
      //   if (args is PathArgumentScan) {
      //     return navigateToRoute(
      //       builder: (_) => ScanRegisterView.fromAddDevice(
      //           args.isCreateAdmin, args.officeId),
      //     );
      //   }
      //   return _underConstructionRoute('Error');
      //
      // case '/signup_admin':
      //   if (args is Device) {
      //     Device device = args;
      //     return navigateToRoute(
      //       builder: (_) => SignUpAdminView(device),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/rfid_admin':
      //   if (args is PathArgument) {
      //     return navigateToRoute(
      //       builder: (_) => RFIDAdminView(
      //         args.item,
      //         args.deviceId!,
      //       ),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/department_add':
      //   if (args is int) {
      //     int officeId = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => DepartmentAddView(officeId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/designation_add':
      //   if (args is int) {
      //     int officeId = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => DesignationAddView(officeId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/device_add':
      //   if (args is int) {
      //     int officeId = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => DeviceAddView(officeId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/mobilePunchNew':
      //   if (args is Employee) {
      //     Employee employee = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => MobilePunchNewView(employee),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/manage_office':
      //   if (args is int) {
      //     int officeId = args;
      //
      //     return navigateToRoute(
      //       builder: (_) => ManageOfficeView(officeId),
      //     );
      //   }
      //
      //   return _underConstructionRoute('Error');
      //
      // case '/on_board_enroll_success':
      //   if (args is bool) {
      //     bool isFingerEnroll = args;
      //     return navigateToRoute(
      //       builder: (_) => EnrollSuccessView(isFingerEnroll),
      //     );
      //   }
      //   return _underConstructionRoute('Error');
      //
      // case '/enroll':
      //   if (args is PathArgumentEnroll) {
      //     return navigateToRoute(
      //       builder: (_) => EnrollView(args.employee, args.deviceId),
      //     );
      //   }
      //   return _underConstructionRoute('Error');

      default:
        return _underConstructionRoute('Error');
    }
  }

  static navigateToRoute({required Widget Function(BuildContext) builder}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: builder);
    } else {
      return MaterialPageRoute(builder: builder);
    }
  }

  static Route<dynamic> _underConstructionRoute(String title) {
    return navigateToRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Text(
              (title == 'Error') ? 'ERROR' : 'Under Construction',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
