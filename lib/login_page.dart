import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student/registration.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({Key? key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool passvis = true;

  @override
  void initState() {
    super.initState();
    passvis = false;
  }

  login_btn() {
      String user = usernameController.text;
      String pass = passController.text;
      if (user == "Doctor_Flutter" && pass == "123456789") {
        print("Login Success");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Registration()));
        Fluttertoast.showToast(
          msg: 'Login successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Please Enter Valid Username And Password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          fontSize: 16.0,
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  height: 350,
                  width: 350,
                  child: Image.asset("assets/images/login_image.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    controller: usernameController,
                    style: const TextStyle(color: Colors.blue),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon:
                      const Icon(Icons.email_outlined, color: Colors.blue),
                      hintText: "Enter Username",
                      hintStyle: const TextStyle(color: Colors.blue),
                      disabledBorder: const OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextFormField(
                    obscureText: !passvis,
                    controller: passController,
                    style: const TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key, color: Colors.blue),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: IconButton(
                          icon: Icon(
                              !passvis ? Icons.visibility_off : Icons.visibility),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              passvis = !passvis;
                            });
                          },
                        ),
                      ),
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(color: Colors.blue),
                      disabledBorder: const OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () {
                    login_btn();
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
