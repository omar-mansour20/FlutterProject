import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/view/page/confirm_password_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class verification_code_component extends StatelessWidget {
  const verification_code_component({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _NumController = TextEditingController();

    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Enter the verification code sent to your email',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
                   mainAxisAlignment: MainAxisAlignment.center,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',
//                    obscuringWidget: const FlutterLogo(
//                      size: 24,
//                ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                     validator: my_validation().codeValidate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: 100,
                      fieldWidth: 60,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.grey,
                      inactiveColor: Colors.black,
                      selectedFillColor: Colors.black26,
                      fieldOuterPadding: EdgeInsets.only(right: 10),
                    ),
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: _NumController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                     
                    },
                   
                  ),
               
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String password = _NumController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('successfully')),
                      );
                      Navigator.pushNamed(context, 'confirmPassword');
                    }

                  },
                  child: const Text('Verify'),
                ),
              ],
            ),
          ),
        ),
      );
  }
}