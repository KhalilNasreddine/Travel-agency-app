import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'home.dart';

const String _baseURL='https://travelagencyapplication.000webhostapp.com/';
EncryptedSharedPreferences _encryptedData = EncryptedSharedPreferences();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _controllerName=TextEditingController();
  TextEditingController _controllerUserName=TextEditingController();
  TextEditingController _controllerPassword=TextEditingController();
  bool _loading = false;
  @override
  void dispose() {
    _controllerName.dispose();
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
              Colors.deepOrange,
              Colors.deepOrangeAccent,
              Colors.orange,
              Colors.orangeAccent
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
                  Text("Sign Up", style: TextStyle(fontSize: 35, color: Colors.white),)
                ],
              ),
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
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
                            color: Colors.orange,
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
                              controller: _controllerName,
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none

                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Name';
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
                    GestureDetector(
                      child: Text("Already Have An Account?", style: TextStyle(color: Colors.grey),),
                      /*onTap: Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login()
                        ),
                      );,*/
                    ),
                    SizedBox(height: 40,),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange
                      ),
                      child: ElevatedButton.icon(
                        onPressed: _loading ? null : () { // disable button while loading
                            setState(() {
                              _loading = true;
                            });
                            signUp(update, _controllerName.text.toString(), _controllerUserName.text.toString(),_controllerPassword.text.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()
                              ),
                            );
                        },
                        /*onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()
                            ),
                          );
                        },*/
                        label: Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        icon: Icon(Icons.create),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
void signUp(Function(String text) update, String name, String userName, String password)async{
  try{
    final response = await http.post(
        Uri.parse('$_baseURL/register.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, // convert the cid, name and key to a JSON object
        body: convert.jsonEncode(<String, String>{
          'Name': name, 'Username': userName, 'Password': password
        })).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      // if successful, call the update function
      update(response.body);
    }
  }
  catch(e){
    update("Connection Error");
  }
}