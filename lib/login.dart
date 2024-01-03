import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'home.dart';
import 'home2.dart';
import 'home3.dart';

const String _baseURL='https://travelagencyapplication.000webhostapp.com/';
EncryptedSharedPreferences _encryptedData = EncryptedSharedPreferences();
late bool result;
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerUserName=TextEditingController();
  TextEditingController _controllerPassword=TextEditingController();


  bool _loading = false;
  @override
  void dispose() {
    _controllerUserName.dispose();
    _controllerPassword.dispose();

    super.dispose();
  }
  void update(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [

                  Colors.blueAccent,
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.lightBlueAccent
                ]
            )
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: Text("Sign In", style: TextStyle(fontSize: 50, color: Colors.white),)
                    ),
                  ],
                ),
              ),

              Center(child: Container(
                width: 500,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40), bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[


                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                              ),
                              child: TextFormField(
                                controller: _controllerUserName,
                                decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Username';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                              ),
                              child: TextFormField(

                                controller: _controllerPassword,
                                obscureText: true,
                                decoration: InputDecoration(

                                    hintText: "Password",
                                    //icon: Icon(CupertinoIcons.eye_slash),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),

                      SizedBox(height: 40,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange
                        ),
                        child: ElevatedButton.icon(

                          key: Key("Log In"),
                          onPressed: _loading
                              ? null
                              : () async {
                            setState(() {
                              _loading = true;
                            });
                            if (_controllerPassword.text.isEmpty ||
                                _controllerUserName.text.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Log In failed'),
                                    content: Text('Please enter all fields'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            _loading = false; // Reset the loading state
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              if(await logIn(update, _controllerUserName.text.toString(), _controllerPassword.text.toString())){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Home2(username: _controllerUserName.text.toString())),
                                );
                              }else{
                                Navigator.of(context).pop();
                              }

                            }

                          },
                          label: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(Icons.login),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ]          ),
      ),
    );
  }
}
Future<bool> logIn(Function(String text) update,  String userName, String password)async{
  try{
    final response = await http.post(
        Uri.parse('$_baseURL/login.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, String>{
          'Username': userName, 'Password': password
        })).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      update(response.body);
      return true;
    }
    return false;
  }
  catch(e){
    update("Connection Error");
    return false;
  }
}

