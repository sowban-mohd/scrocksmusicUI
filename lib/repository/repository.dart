import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:srocksmusicapp/model/service_card_model.dart';

class Repository {
  final FirebaseFirestore _firestore;
  Repository({required FirebaseFirestore firestore}) : _firestore = firestore;

  Future<List<ServiceCardModel>> getServiceCards() async {
    final serviceCardsSnapshot =
        await _firestore.collection('servicecards').orderBy('index').get();
    final List<ServiceCardModel> serviceCardList =
        serviceCardsSnapshot.docs
            .map((doc) => doc.data())
            .map((data) => ServiceCardModel.fromMap(data))
            .toList();
    print(serviceCardList);
    return serviceCardList;
  }
}
