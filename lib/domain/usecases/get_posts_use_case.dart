

import 'package:rto_app/data/models/UserList.dart';
import 'package:rto_app/data/repositories/post_repository.dart';

class GetPostsUseCase{

  final PostRepository repository;

  GetPostsUseCase({required this.repository});

  Future<List<UserList>>  execute(){
    return  repository.getPosts();
  }

}