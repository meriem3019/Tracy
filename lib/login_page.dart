import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delayed_animation.dart';
import 'signup_page.dart';
import 'forget_page.dart';
import 'main.dart';
class LoginPage extends StatelessWidget {
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
          DelayedAnimation(
              delay: 1000,
              child: Container(

                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                    ),
                    Text(
                      "Connexion",
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
                    SizedBox(height: 22),
                    DelayedAnimation(
                      delay:1500,
                    child :
                    Column(
                      children: [
                    Align(
                      alignment: Alignment.center,
                    ),
                    Text(
                    " Accedez a votre compte grâce a votre email et mot de passe",

                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                      ],
                ),
                    ),
              SizedBox(height: 35),
        LoginForm(),
              SizedBox(height: 20),
              DelayedAnimation(
                delay: 3800,
                child: Container(
                  child : Column (
                      children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=> PasswordPage()
                        ),
                    );
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Mot de passe oublié",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                        SizedBox(width: 50),
                        Align(
                          alignment: Alignment.centerRight,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child:
                          Text("Crée un nouveau compte",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        ),
                ],
              ),
              ),
              ),
            SizedBox(height: 80),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 35),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    } ,
                    child: DelayedAnimation(
                      delay: 4000,
                      child: Text(
                        "SKIP",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),

                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
            ),
          ],

    ),
    ),

    );
  }

}
class LoginForm extends StatefulWidget {
  const LoginForm ({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();

}
class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DelayedAnimation(
          delay: 2000,
          child: TextFormField(
            validator: (value) => validateEmail(value),
            decoration: InputDecoration(
              labelText: 'votre Email',
              labelStyle: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          ),
          SizedBox(height: 35),
          DelayedAnimation(
              delay: 2200,
            child: TextFormField(
              obscureText: _isObscure,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: Colors.blueGrey,
                ),
                labelText: "Mot de passe",
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
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 3500,
            child: ElevatedButton(
              onPressed: (){
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
              child: Text("CONFIRMER",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
