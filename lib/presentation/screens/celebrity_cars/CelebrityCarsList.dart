import 'package:flutter/material.dart';
import 'package:pr'
    'ovider/provider.dart';

import 'PostViewModel.dart';
import 'User.dart';

class CelebraityCarList extends StatefulWidget{
  @override
  @override
  _CelebraityCarList createState() => _CelebraityCarList();
}

class _CelebraityCarList extends State<CelebraityCarList>{




  @override
  Widget build(BuildContext context) {


    final postViewModel = Provider.of<PostViewModel>(context);

    return Scaffold(appBar: AppBar(title: Text('Celebrity Cars'),leading: IconButton(onPressed: (){
        Navigator.pop(context); // Navigate back
    }, icon: Icon(Icons.arrow_back, size: 30, color: Colors.greenAccent)))
        ,
        body: postViewModel.isLoading?
        Center(child: CircularProgressIndicator()): postViewModel.errorMessage.isNotEmpty?
        Center(child: Text(postViewModel.errorMessage)) : ListView.builder( itemCount: postViewModel.posts.length,  itemBuilder: (context, index){
          final post = postViewModel.posts[index];
          return ListTile( title: Text(post.title ?? ''),subtitle: Text(post.body ?? ''),);

        }

        ),floatingActionButton: FloatingActionButton(onPressed: postViewModel.fetchUserList, child: Icon(Icons.refresh),),



    );





    List<int> numbers = List.filled(5, 0);
    print('HI So ${numbers}');



  }


  Widget rvfunTest(){

    List<User>  useDetils= [];
    useDetils.add(User(id: 1, name: 'Amit', email: 'sonu#gail.com'));
    useDetils.add(User(id: 2, name: 'Amit2', email: 'sonu#gail.com'));
    useDetils.add(User(id: 3, name: 'Ami1', email: 'sonu#gail.com'));
    useDetils.add(User(id: 4, name: 'Amit3', email: 'sonu#gail.com'));
    useDetils.add(User(id: 5, name: 'Ami4', email: 'sonu#gail.com'));
    useDetils.add(User(id: 6, name: 'Amit5', email: 'sonu#gail.com'));


    for(int i =0 ;i<useDetils.length;i++){
      print('User Id:-${useDetils[i].id} , User Name:-${useDetils[i].name}  , User Email:- ${useDetils[i].email} ');
    }

    return ListView.builder(itemCount: useDetils.length, itemBuilder: (context,index){
      return Card(child: ListTile(title: Text(useDetils[index].name),textColor: Colors.black,),);
    });

    // Widget useListView2(List<User> useD){
    //
    //
    // }


/*    Widget useListView(List<User> userDetil){
      return ListView.builder(itemCount: userDetil.length,itemBuilder:(context ,index)
      {
        return Card(child: ListTile());



      };
      )
    };*/



  }


  // int = {1,2,3,4,5,6};



}
