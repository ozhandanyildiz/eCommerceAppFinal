import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push("/products");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Skip",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 115, 102, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Signin to continue",
                            style: TextStyle(
                              color: const Color.fromRGBO(128, 128, 128, 1),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none,
                          ),
                        ),
                        Gap(10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            border: InputBorder.none,
                          ),
                        ),
                        Gap(10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "E-mail",
                            border: InputBorder.none,
                          ),
                        ),
                        Gap(10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                          ),
                        ),
                        Gap(10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: InputBorder.none,
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (newValue) {},
                            ),
                            Text(
                              'I agree to ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text("Terms of Service",
                                style: TextStyle(
                                  color: const Color.fromRGBO(255, 115, 102, 1),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => GoRouter.of(context).push("/login"),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 115, 102),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "or login using social media",
                        style: TextStyle(
                          color: const Color.fromRGBO(128, 128, 128, 1),
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push("/register");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 115, 102, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
