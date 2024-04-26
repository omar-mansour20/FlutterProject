import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/forgetpassword.dart';
import 'package:hotel_reservation_project/features/auth/signup/view/page/signup_page.dart';



class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/bb.jpeg'), fit: BoxFit.cover),),
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.black54,
           title: Text('Login', style: TextStyle(
             color: Colors.blueGrey,
             fontSize: 33),),),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
     Container(
       padding: EdgeInsets.only(left: 35, top:90),
           child: Text('Welcome', style: TextStyle(
               color: Colors.white,
               fontSize: 33),),
         ),
          Container(
            padding: EdgeInsets.only( top:MediaQuery.of(context).size.height * 0.3, right: 35, left: 35),
            child: Form(
              key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),),
                   validator: _validateEmail,   ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  validator: _validatePassword,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Sign In',style: TextStyle(
                  color: Colors.white54,
                    fontSize: 27,fontWeight: FontWeight.w700),
                  ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueAccent,
                   child:IconButton(
                     onPressed: (){
                        if (_formKey.currentState!.validate()) {
                           // Validation passed
                           // Implement your account creation logic here
                         ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('successfully')),
                );
              }
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ),],
                ),
      SizedBox(
        height: 20,
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // signup button

                    TextButton(onPressed:(){
                        Navigator.pushNamed(context, SignUpScreen.screenRoute);
                    },
                     child: Text('Sign Up', style: TextStyle
                      (
                      decoration: TextDecoration.underline,
                     fontSize: 18,
                     color: Colors.white54,    ),
                    ),
                    
                    ),

                    // forgetpassword button

                    TextButton(onPressed:(){
                      Navigator.pushNamed(context, ForgetPasswordScreen.screenRoute);
                    }, child: Text('Forget Password', style: TextStyle
                      (
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.white54,    ),
                    ),),
                  ],
                )
              ],
            ),
          ),
          )
        ],
      ),
    ),
    );
  }
}