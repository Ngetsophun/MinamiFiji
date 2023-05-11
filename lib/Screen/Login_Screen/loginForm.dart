import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/HomePage/homePage_Screen.dart';
import 'package:minamifuji/Screen/Login_Screen/ForgotFrom.dart';
import 'package:minamifuji/Screen/Login_Screen/SingUpForm.dart';

class Login_Form extends StatefulWidget {
  const Login_Form({super.key});

  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool passToggle = true;

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
                    color: Colors.red,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          child: Text(
                            "Welcome From E-Robot",
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
                              height: 20,
                            ),
                            Container(
                              child: Text(
                                "Login".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
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
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForgotScreen()));
                                          },
                                          child: Text(
                                            "Forgot password?",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // if (_formfield.currentState!
                                          //     .validate()) {
                                          //   print("success");
                                          //   emailController.clear();
                                          //   passController.clear();
                                          // }
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                     HomePageScreen()));
                                          print("success");
                                          emailController.clear();
                                          passController.clear();
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an Accoount?",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpScreen()));
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
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
