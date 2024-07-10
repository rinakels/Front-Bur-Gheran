import 'dart:convert';

import 'package:burgheran/services/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();
  
  Future<bool> login(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
    },
      body: jsonEncode(<String,dynamic>{
        'usernameOrEmail' : user.email,
        'password' : user.password

      }),
    );
    if(response.statusCode == 200){
      return true;
    }
    return false;
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      body: SafeArea (
        child: Padding (
          padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
          child: Column (
            children: <Widget> [
              Center(
                child: Image.asset(
                  'assets/burgerfireko.png',
                  width: 250,
                ),
              ),
              Text(
                'Hi! Welcome Back',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  fontSize: 25.0
                ),
              ),
              SizedBox(height: 30.0,),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),

                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please provide an email';
                        }
                        if(value.length < 2) {
                          return 'Provide an existing email';
                        }
                        return null;
                      },
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height:  30.0,),
                    TextFormField(
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureIcon),
                          onPressed: (){
                            setState(() {
                              _obscure = !_obscure;
                              if (_obscure){
                                _obscureIcon = Icons.visibility_off;
                              }else{
                                _obscureIcon = Icons.visibility;
                              }
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                              ),
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please provide a password';
                              }
                              if(value.length < 8){
                                return 'Password must be atleast 8 characters long';
                              }
                              if (value.length > 20) {
                                return 'Passwords must be 20 characters long only';
                              }
                              return null;
                            },
                            onSaved: (value){
                              password = value!;
                            },
                          ),
                          SizedBox(height: 25.0,),
                          ElevatedButton(
                              onPressed: (){
                                if(formKey.currentState!.validate());{
                                  formKey.currentState!.save();
                                  User user = User(
                                    username: '',
                                    email: email,
                                    password: password
                                  );
                                //   if(login(user)){
                                // Navigator.pushReplacementNamed(context, '/dashboard');
                                //   }
                                  setState(() {
                                    buttonContent = FutureBuilder(
                                        future: login(user),
                                        builder: (context, snapshots){
                                          if(snapshots.connectionState == ConnectionState.waiting){
                                            return loadingDisplay;
                                          }
                                          if(snapshots.hasData){

                                          }
                                          return Text('Log in');
                                        }
                                    );
                                  });
                                  Navigator.pushReplacementNamed(context, '/');
                                }
                              },
                              child: buttonContent,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[200],
                              foregroundColor: Colors.black
                            ),
                          ),
                         SizedBox(height: 30.0,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget> [
                             Text(
                               'or log in with',
                               style: TextStyle(
                                 color: Colors.black
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 25.0,),
                         ElevatedButton.icon(
                             onPressed: (){},
                             icon: Icon(Icons.login),
                             label: Text('Sign in with Google'),
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.redAccent,
                             foregroundColor: Colors.black,
                           ),
                         ),
                    SizedBox(height: 25.0,),
                    ElevatedButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.facebook),
                        label: Text('Sign in with Facebook'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          InkWell(
                            child: Text(
                              'Signup here',
                              style: TextStyle(
                                color: Colors.brown,
                              ),
                            ),
                            onTap: ()=> Navigator.popAndPushNamed(context, '/signup'),
                          )
                        ],
                      ),
                  ],
                ),
              ),
          ),
    );
  }
}
