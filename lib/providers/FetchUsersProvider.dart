import 'package:api_calling_in_flutter/services/FetchUserService.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class FetchUsersProvider extends ChangeNotifier {
  List<Result> _list = [];

  List<Result> get getUsers => _list;
  FetchUserService service = FetchUserService();
  bool isLoading = false;

  Future<void> getAllUsers(int page) async {
    isLoading = true;
    notifyListeners();
    final response = await service.fetchUsers(page);
    _list = response;
    isLoading = false;
    notifyListeners();
  }
}
