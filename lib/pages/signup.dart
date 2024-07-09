import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:burgheran/services/user.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

createAccount(User user) async{
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/api/v1/auth/register/user'),
    headers : <String, String>{
      'Content-Type' : 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username' : user.username,
      'email' : user.email,
      'password' : user.password
    }),
  );
  print(response.body);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(
                'Lets Get Started!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 30.0,),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      maxLength: 40,
                      decoration: InputDecoration(
                        label: Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value){
                         if(value == null || value.isEmpty){
                           return 'Please provide a name';
                         }
                         if(value.length < 2){
                           return 'Name should be atleast 10 letters long';
                         }
                         return null;
                      },
                      onSaved: (value){
                        name = value!;
                      },
                    ),
                    SizedBox(height: 25.0,),
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
                        if(value.length < 2){
                          return 'Email should be atleast 10 letters long';
                        }
                        return null;
                      },
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 40.0,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please provide a password';
                        }
                        if(value.length < 8 ){
                          return 'Password should be atleast 8 characters long';
                        }
                        if (value.length > 20){
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
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            User user = User(
                              username: name,
                              email: email,
                              password: password
                            );
                            createAccount(user);
                            Navigator.pushReplacementNamed(context, '/login');
                          }
                        },
                        child: Text('Create Account'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[200],
                        foregroundColor: Colors.black
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Row(
                      children: <Widget> [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 50,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'or sign up with',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    ElevatedButton.icon(
                      onPressed: (){},
                      icon:Icon(Icons.g_mobiledata),
                      label: Text('Log in with Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    ElevatedButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.facebook),
                      label: Text('Log in with Facebook'),
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
                    'Do you have an account?',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  InkWell(
                    child: Text(
                      'Login here',
                      style: TextStyle(
                        color: Colors.brown[700],
                      ),
                    ),
                    onTap: ()=> Navigator.popAndPushNamed(context, '/login'),
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
