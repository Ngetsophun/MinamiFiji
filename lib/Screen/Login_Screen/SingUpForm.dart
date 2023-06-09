import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:minamifuji/Screen/Login_Screen/loginForm.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  get _formfield => GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  // final nameFocusNode = FocusNode();
  // final emailFocusNode = FocusNode();
  // final passFocusNode = FocusNode();

  bool passToggle = true;

  // @override
  // void initState() {

  //   super.dispose();
  //   passController.dispose();
  //   emailController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.black,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          child: Text(
                            "Welcome From Minamifuji",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "Sign Up".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: TextField(
                                      controller: nameController,
                                      //focusNode: nameFocusNode,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2)),
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        labelText: 'Enter your Name',
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      //focusNode: emailFocusNode,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2)),
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        labelText: 'Enter your Email',
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    child: TextField(
                                      obscureText: passToggle,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: passController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2)),
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        labelText: 'Enter your Password',
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              passToggle = !passToggle;
                                            });
                                          },
                                          child: Icon(passToggle
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () {
                                          // if (_formfield.currentState!
                                          //     .validate()) {
                                          //   _auth
                                          //       .createUserWithEmailAndPassword(
                                          //           email: emailController.text
                                          //               .toString(),
                                          //           password: passController
                                          //               .text
                                          //               .toString());
                                          // }

                                          FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                                  email: emailController.text
                                                      .trim(),
                                                  password: passController.text
                                                      .trim())
                                              .then((value) {
                                            print("Create account");
                                          }).onError((error, stackTrace) {
                                            print('Error${error.toString()}');
                                          });
                                          Fluttertoast.showToast(
                                              msg: 'Create Success');
                                          nameController.clear();
                                          emailController.clear();
                                          passController.clear();
                                        },
                                        child: const Text(
                                          'Create Account',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an Accoount?",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login_Form()));
                                        },
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Material(
                                          elevation: 20,
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://static01.nyt.com/images/2021/10/02/business/00roose-fb-silo/00roose-fb-silo-superJumbo.jpg'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          elevation: 20,
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          elevation: 20,
                                          child: Container(
                                            height: 60,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3eFQVn3FQLL4vi7-ssHMBQRjBrv_MQP7zbTnbv2dSm4bl1sybVcR5jg3kQfCeHXwPPdI&usqp=CAU'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
