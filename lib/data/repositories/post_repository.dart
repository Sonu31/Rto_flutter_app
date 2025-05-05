import 'package:rto_app/data/models/UserList.dart';

import '../sources/remote_data_source.dart';

class PostRepository{
  final RemoteDataSource remoteDataSource;

  PostRepository({required this.remoteDataSource});
  Future<List<UserList>> getPosts() async {
    return await remoteDataSource.fetchPosts();
  }

}