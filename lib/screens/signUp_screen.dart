
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'booking_pickup_screen.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 final _auth=FirebaseAuth.instance;




  String _email='';
  String _username='';
  String _mob='';
  String _password='';

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void _trySubmit()async{
    final isValid=_formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if(isValid){

      UserCredential authResult;
      _formKey.currentState!.save();
      print("username is ${_username}");
      print("email is ${_email}");
      print("password is ${_password}");
      print("mob is ${_mob}");

      authResult =await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BookingPickupScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Sign up"),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(16.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 220,),
                   Row(children:  [Text("Sign up",
                    style: GoogleFonts.poppins(fontSize: 36.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffC18A00)),)],),
                   SizedBox(height: 24.h,),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:   InputDecoration(labelText: 'Email',
                      // enabledBorder: OutlineInputBorder(
                      //   // borderSide: BorderSide(
                      //   //     width: 3, color: Colors.black), //<-- SEE HERE
                      // )
                      ),
                    validator: (value) {
                      if (value!.isEmpty||!value.contains('@')) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _email=value!;
                    },
                  ),
                  SizedBox(height: 12.h,),
                  TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value!.isEmpty||value.length<4) {
                        return 'Please enter at least 4 characters';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _username=value!;
                    },
                  ),
                  SizedBox(height: 12.h,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Phone no.'),
                    validator: (value) {
                      if (value!.isEmpty||value.length<10) {
                        return 'Please enter 10 digit';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _mob=value!;
                    },
                  ),
                  SizedBox(height: 12.h,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty||value.length<4) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _password=value!;
                    },
                  ),

                  SizedBox(height: 100.h,),
                  InkWell(
                    onTap: _trySubmit,
                    child: Container(
                      height: 50.h,
                      width: 328.w,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.h),
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text("Sign Up",
                      style: TextStyle(fontSize: 18,color: Colors.white),),
                    ),
              ),
                  ),
                  SizedBox(height: 16.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Already have an account?",
                      style: TextStyle(fontSize: 12.h),),
                      Text("  Log in",
                        style: TextStyle(fontSize: 12.h,
                        color: Colors.blue),)
                    ],
                  ),
              ]

            ),

    ),
        ),
        ),
      )
    );
  }
}