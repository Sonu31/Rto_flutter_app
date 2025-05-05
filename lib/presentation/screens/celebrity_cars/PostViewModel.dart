 import 'package:flutter/cupertino.dart';

import '../../../data/models/UserList.dart';
import '../../../domain/usecases/get_posts_use_case.dart';

class PostViewModel extends ChangeNotifier{


  final GetPostsUseCase getPostsUseCase;
  PostViewModel({required this.getPostsUseCase});

  List<UserList> posts = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchUserList() async {
    isLoading = true;
    notifyListeners();
    try {
      posts = await getPostsUseCase.execute();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }


}