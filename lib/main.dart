import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rto_app/presentation/screens/celebrity_cars/PostViewModel.dart';
import 'package:rto_app/presentation/screens/splash_screen.dart';

import 'data/repositories/post_repository.dart';
import 'data/sources/remote_data_source.dart';
import 'domain/usecases/get_posts_use_case.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title:'RTO App',debugShowCheckedModeBanner: false,
   home: ChangeNotifierProvider(
     create: (_) => PostViewModel(  getPostsUseCase: GetPostsUseCase(repository:PostRepository( remoteDataSource: RemoteDataSource(client: http.Client()),))),child: SplashScreen(),)

      // home: SplashScreen(),
        );
  }
}

