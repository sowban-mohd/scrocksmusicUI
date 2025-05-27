import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:srocksmusicapp/repository/repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<Repository>(
    Repository(firestore: getIt<FirebaseFirestore>()),
  );
}
