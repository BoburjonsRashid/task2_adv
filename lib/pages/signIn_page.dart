import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task2_adv/pages/home_page.dart';

class SignInPage extends StatefulWidget {
  static const String id = 'signin_page';

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create account',
              style: TextStyle(
                  fontSize: 50, fontFamily: 'Billabong', color: Colors.white),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 48,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.grey[200]),
              child: TextField(
                  controller: userController,
                  style: const TextStyle(
                    fontSize: 27,
                  ),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'user name',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25))),
            ),
            Container(
              height: 48,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.grey[200]),
              child: TextField(
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 27,
                  ),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25))),
            ),
            Container(
              height: 48,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.grey[200]),
              child: TextField(
                  controller: numberController,
                  style: const TextStyle(
                    fontSize: 27,
                  ),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'phone number',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25))),
            ),
            Container(
              height: 48,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.grey[200]),
              child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    fontSize: 27,
                  ),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 27))),
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              // color: Colors.blue,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue[500]),
              child: MaterialButton(
                onPressed: () {
                  storeUser(userController, emailController, numberController,
                      passwordController);
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(
                      height: 15,
                      width: 15,
                    ),
                    MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Homepage();
                          }));
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ))
          ],
        ),
      )),
    );
  }

  static var box = GetStorage();

  static void storeUser(
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController userController,
      TextEditingController numberController) async {
    box.write("email", emailController.text);
    box.write("password", passwordController.text);
    box.write("user", userController.text);
    box.write("number", numberController.text);
  }

  static loadEmail() {
    var emailController = (box.read("email"));
    return emailController;
  }

  static loadPassword() {
    var passwordController = (box.read("password"));
    return passwordController;
  }

  static loadNumber() {
    var numberController = (box.read("number"));
    return numberController;
  }

  static loadUser() {
    var userController = (box.read("user"));
    return userController;
  }

  static void removeUser() async {
    box.remove("email");
    box.remove("password");
    box.remove("user");
    box.remove("number");
  }
}
