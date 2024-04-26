
import 'package:flutter/material.dart';



class SignUpScreen extends  StatefulWidget {
    static const String screenRoute = 'signUp_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen>createState() => _SignUpScreenState();
} 

class _SignUpScreenState extends  State<SignUpScreen> {

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  //functions and valids

    bool IsEmailValid(String email){
      String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp EmailToRegex= RegExp(pattern);
      return EmailToRegex.hasMatch(email);
    }

    bool IsUsernameValid(String user){
      String pattern = r'^[a-zA-Z0-9_]+$';
      RegExp UsernameToRegex= RegExp(pattern);
      return UsernameToRegex.hasMatch(user);
    }

  @override
  Widget build(BuildContext context) {

    

    return Container(
      //decoration: BoxDecoration(color: Colors.red),
      child: Scaffold(
        appBar: AppBar(),
        body:  SingleChildScrollView(
          child: Padding(padding:const EdgeInsets.all(40),
          child: Column(
            children: [
              const Text("Create an account",
              style: TextStyle(
                color: Color.fromARGB(255, 20, 0, 99),
                fontSize: 25,
              ),),
              const SizedBox(height:10),

              //the form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: TextFormField(
                            validator: (value){
                              if(value == null||value == value.isEmpty||!IsUsernameValid(value)){
                                return 'Invalid name';
                              }
                              return null;
                            },
                            expands: false,
                            decoration: const InputDecoration(labelText: "First Name",), 
                            )
                          ),

                          const SizedBox(width: 16),

                          Expanded(child: TextFormField(
                            validator: (value){
                              if(value == null||value == value.isEmpty||!IsUsernameValid(value)){
                                return 'Invalid name';
                              }
                              return null;
                            },
                            expands: false,
                            decoration: const InputDecoration(labelText: "Last Name"), 
                            )
                          )
                      ],
                    ),

                    const SizedBox(height: 16),

                    //username
                    TextFormField(
                      validator: (value){
                        if(value == null||value == value.isEmpty||!IsUsernameValid(value)){
                          return 'Invalid username';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(labelText: "Username"), 
                    ),
                          
                    
                    //Email
                    TextFormField(
                      validator: (value){
                        if(value == null||value == value.isEmpty||!IsEmailValid(value)){
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(labelText: "Email"), 
                    ),


                    //phone number
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(labelText: "phone number"), 
                    ),


                    // password
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                       validator: (value){
                        if(value == null||value == value.isEmpty||value.length<6){
                          return 'Password must be at least 6 chars';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(labelText: "password"), 
                    ),

                    const SizedBox(height: 16),

                    //button
                  SizedBox(
                    width:300 ,
                    child: ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        // the code will be writte about what happens if all validations are true
                      }
                    },
                     child: const Text("Create account"))),
                     
                  ],
                  
                ),
              )
            ],
          )),
          

          )
      
      )
      
    );

  }

}
