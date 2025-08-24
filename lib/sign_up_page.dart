import 'package:flutter/material.dart';
import 'package:flutter_application_2/pageOne.dart';

class sign_up_page extends StatefulWidget {
  const sign_up_page({super.key, required this.title});

  final String title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<sign_up_page> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController posswordController = TextEditingController();

  bool obscureText = true;

  String loginMessage = '';
  void validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Pageone()), // Replace
      );
    } else {
      setState(() {
        loginMessage = 'Please fix the errors above.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // DESIGN YOUR APPLICATION HERE
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up Page'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,

              // color: Colors.grey,
              // height: 1000,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Sign Up', style: TextStyle(fontSize: 60)),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: Text('Sign Up to continue'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'First name required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Enter your First name'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Last  name is required.';
                              }
                              return null;
                            },
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Enter Your last name'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ageController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Enter Your Age'),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Age is required';
                              }
                              int? age = int.tryParse(value);
                              if (age == null) {
                                return 'Enter a valid number';
                              }
                              if (age < 10) {
                                return 'Age should be greater than 10';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            controller: dateOfBirthController,
                            decoration: const InputDecoration(
                              // icon: Icon(Icons.calendar_month_outlined),
                              border: OutlineInputBorder(),
                              label: Text('Enter Your DOB'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 4, 8),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text('Enter Your Phone Number'),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 4, 0),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              label: Text('Enter Your Email'),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 8, 4, 0),
                          child: TextFormField(
                            controller: posswordController,
                            obscureText: obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              label: Text('Enter Your Possword'),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.length < 6 || value.trim().isEmpty) {
                                return 'Possword should be atlest 6 words ';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(Icons.remove_red_eye),
                          ),
                          Text('show password'),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: validateAndLogin,
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
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
