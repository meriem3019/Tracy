import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delayed_animation.dart';
import 'main.dart';
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF66C3EC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size:30,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[

                  DelayedAnimation(delay: 1000,
                    child: Container(

                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                          ),
                          Text(
                            "Inscription",
                            style: GoogleFonts.poppins(
                              color: d_yellow,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                 SignForm(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DelayedAnimation(
              delay: 1000,
            child:
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'NOM',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),

              ),
            ),
          SizedBox(height: 20),
          DelayedAnimation(
            delay: 1100,
            child:
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'PRENOM',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          DelayedAnimation(
            delay: 1000,
            child:
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Téléphone',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),

            ),
          ),
          SizedBox(height: 20),
          DelayedAnimation(
            delay: 1200,
            child:
            TextFormField(
              validator: (value) => validateEmail(value),
            decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),

            ),
          ),
          SizedBox(height: 20),
          DelayedAnimation(
            delay: 1300,
            child:
            TextFormField(
              obscureText: _isObscure,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },

              decoration: InputDecoration(
                labelText: 'MOT DE PASSE',
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),

            ),
          ),
          SizedBox(height: 20),
          DelayedAnimation(
            delay: 1400,
            child:
            TextFormField(
              obscureText: _isObscure,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'CONFIRMATION',
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),

            ),
          ),
          SizedBox(height: 40),
          DelayedAnimation(
            delay: 1500,
           child: ElevatedButton(
            onPressed:(){
            if (_formKey.currentState!.validate()) {
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
                   );
                }
            },
            style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: d_yellow,
              padding: EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 125,
              ),
            ),
             child: Text(
               "CONFIRMER",
               style: GoogleFonts.poppins(
                 color: Colors.black,
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
               ),
             ) ,
           ),
          ),
        ],
        ),
    );
  }
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}

