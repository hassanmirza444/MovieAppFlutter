import 'package:api_calling_in_flutter/providers/FetchUsersProvider.dart';
import 'package:api_calling_in_flutter/screens/FetchUserScreenWithProvider.dart';
import 'package:api_calling_in_flutter/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/MovieScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieScreen(),
    );


/*    return ChangeNotifierProvider(
      create: (context)=> FetchUsersProvider(),
      child:const MaterialApp(
        home: FetchUsersScreenWithProvider(),
      ) ,);*/
  }
}






