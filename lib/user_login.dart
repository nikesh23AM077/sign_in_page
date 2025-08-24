import 'package:flutter/material.dart';
import 'package:flutter_application_2/pageOne.dart';
import 'package:flutter_application_2/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String msg = "";
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My App',
            style: TextStyle(color: Colors.lightBlue, fontSize: 25),
          ),
          leading: const Icon(Icons.padding_outlined, color: Colors.deepPurple),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.red,
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.person_2, size: 200),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.person),
                          label: Text('Enter Your Name'),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return ' Enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.remove_red_eye),
                          label: Text('Enter your password'),
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty || value.length < 6) {
                            return ' Password should be greater than 6 words';
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text('Forgot password'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 10,
                          shadowColor: Colors.black),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (nameController.text == 'nikesh' &&
                              passwordController.text == '1234567') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pageone()),
                            );
                            setState(() {
                              msg = '';
                            });
                          } else {
                            setState(() {
                              msg = 'Invalid Username or Password';
                            });
                          }
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text("Don't have an account?"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 80,
                          height: 35,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 5),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const sign_up_page(title: ''),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(msg),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
