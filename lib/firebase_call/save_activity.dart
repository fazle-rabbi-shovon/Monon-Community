import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/activity_service.dart';

Future<void> saveActivityOnFirebase({
  required String activityName,
  required Map<String, dynamic> activityData,
  required int activityIndex,
}) async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) {
    throw Exception('User not logged in');
  }

  final now = DateTime.now();
  final formattedDate =
      "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

  final firestore = FirebaseFirestore.instance;

  // Fixed document ID per activity per day
  final collectionRef  = firestore
      .collection('Activity')
      .doc(uid)
      .collection(formattedDate)
      .doc(activityName) // always overwrite or check this
      .collection('entries');
  

  await collectionRef.add({
    ...activityData,
    'savedAt': FieldValue.serverTimestamp(),
  });

  /// ✅ Mark amar_kaaj activity complete locally in Hive
  await ActivityService().markCompleted('amar_kaaj', activityIndex);
}


