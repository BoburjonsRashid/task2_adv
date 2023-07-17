import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task2_adv/pages/home_page.dart';
import 'package:task2_adv/pages/signIn_page.dart';

void main() async{
  runApp(const MyApp());

  await Hive.initFlutter();
  await Hive.openBox('pdp_online');
  await GetStorage.init();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
        routes:{
        SignInPage.id:(context)=>const SignInPage(),}
    );
  }
}


