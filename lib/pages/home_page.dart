import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2_adv/pages/signIn_page.dart';
import 'package:task2_adv/service/log_service.dart';
import 'package:task2_adv/service/prefs_service.dart';

class Homepage extends StatefulWidget {
  static String id = 'home';
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //String email = emailController.text.toString().trim();

  @override
  late SharedPreferences prefs;
  String email = " ";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/gugu.png'),
                      fit: BoxFit.contain)),
            ),
            Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(171, 171, 171, 0.7),
                                      blurRadius: 20,
                                      offset: Offset(0, 10)),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom:
                                            BorderSide(color: Colors.grey))),
                                    child: TextField(
                                      controller: emailController,
                                      obscureText: true,
                                      style: const TextStyle(
                                        fontSize: 27,
                                      ),
                                      decoration: const InputDecoration(
                                          hintText: 'email',
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom:
                                            BorderSide(color: Colors.grey))),
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: true,
                                      style: const TextStyle(
                                        fontSize: 27,
                                      ),
                                      decoration: const InputDecoration (
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green),
                            child: MaterialButton(
                              onPressed: () {
                                // storeApiKey(emailController);
                                // storecApiKey(passwordController);
                                storeUser(emailController, passwordController);
                              },
                              child: const SizedBox(
                                width: 150,
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                           Center(
                            child: Row(
                              crossAxisAlignment:CrossAxisAlignment.center ,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30,),
                                const Center(child:Text(
                                'Login with SNS',
                                style: TextStyle(color: Colors.grey),
                              ) ,)
                                ,const SizedBox(width: 3,),
                              Container(
                                width: 120,
                                  height: 30,
                                  margin: const EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.deepPurple),
                                  child:  MaterialButton(
                                      onPressed: () { Navigator.pushNamed(context, SignInPage.id) ;},
                                      child:  const SizedBox(
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'SignIn',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),

                                    ),
                                  ),


                                  )
                              )
                              ],
                            )
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  save() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('text', emailController.text.toString());
    prefs = await SharedPreferences.getInstance();
    prefs.setString('Text', passwordController.text.toString());
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('text')!;
      password = prefs.getString('Text')!;
    });
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('text');
    prefs.remove('Text');
    email = "";
    password = "";
    setState(() {});
  }

  static storeApiKey(emailController) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "api_key", value: emailController.text.toString());
  }

  static storecApiKey(passwordController) async {
    const storage = FlutterSecureStorage();
    await storage.write(
        key: "vapi_key", value: passwordController.text.toString());
  }

  static Future<String?> loadApiKey() async {
    const storage = FlutterSecureStorage();
    String? api_key = await storage.read(key: "api_key");
    return api_key;
  }

  static Future<void> removeApiKey() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: "api_key");
  }


  static var box = Hive.box("pdp_online");

  static void storeUser (TextEditingController emailController,TextEditingController passwordController) async {
  box.put ("email", emailController.text.toString());
  box.put ("password", passwordController.text.toString());
  print(box.get("email"));
  print(box.get("password"));}
  static loadUser () {
    var emailController = (box.get('email'));
    var passwordController = (box.get('password'));
    // return emailController;
    // return passwordController;}
  }static void removeUser() async{
  box.delete ('user');}





}
