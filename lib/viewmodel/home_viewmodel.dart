import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:srocksmusicapp/model/service_card_model.dart';
import 'package:srocksmusicapp/repository/repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final Repository _repo;
  HomeViewmodel({required Repository repo}) : _repo = repo;
  List<ServiceCardModel> _serviceCards = [];
  bool _isLoading = false;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  List<ServiceCardModel> get serviceCards => _serviceCards;

  Future<void> getServiceCards() async {
    _isLoading = true;
    notifyListeners();
    try {
      _serviceCards = await _repo.getServiceCards();
      _isLoading = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      _errorMessage = "Error occured : ${e.toString()}";
      notifyListeners();
    }
  }
}
