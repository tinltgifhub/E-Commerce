import 'package:ecommerce/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

String email_p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
String phone_p = r'(^(?:[+0]9)?[0-9]{10,12}$)';
RegExp regExp_email = new RegExp(email_p);
RegExp regExp_phone = new RegExp(phone_p);

bool obserText=true; 


TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _usernameController = TextEditingController();



void addData(String username, String email,String password, String phoneNumber) async {
  DatabaseReference _ref = FirebaseDatabase.instance.reference().child('users');
  Map<String, dynamic> userData = {
    'username': username,
    'email': email,
    'password':password,
    'phone': phoneNumber,
  };
  await _ref.push().set(userData);
}

class _SignUpState extends State<SignUp> {

  void validation() async {
    final FormState? _form = _formKey.currentState;
    
    if(_form!=null && _form.validate()){
      try{
        // UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      }on PlatformException catch(e){
        print(e.message.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    var scrwidth = MediaQuery.of(context).size.width;
    var scrheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal:scrwidth*0.03,vertical: scrheight*0.02),
                alignment: Alignment.bottomCenter,
                child: Container(
                  // color: Colors.amber,
                  margin: EdgeInsets.symmetric(vertical: scrheight*0.04),
                  child: Text('Register',style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                color: Colors.white,
              ),
            ),

            Form(
              key: _formKey,
              child: Expanded(
                flex: 50,
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal:scrwidth*0.03),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          validator: (value){
                            if(value!=null){
                              if(value.isEmpty){
                                return 'UserName cannot be empty!';
                              }
                              else if(value.length<6){
                                return 'Too Short!(>6 pls)';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Username",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // ),
                          ),
                        ),
                        SizedBox(height: scrheight*0.03,),
                        TextFormField(
                          controller: _emailController,
                          validator: (value){
                            if(value!=null){
                              if(!regExp_email.hasMatch(value)){
                                return "Email is invalid!";
                              }
                              else if(value.isEmpty){
                                return "Email cannot be empty!";
                              }                             
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // ),
                          ),
                        ),
                        SizedBox(height: scrheight*0.03,),
                        TextFormField(
                          obscureText: obserText,
                          controller: _passwordController,
                          validator: (value) {
                            if(value!=null){
                              if(value.isEmpty){
                                return "Password cannot be empty!";
                              }
                              else if(value.length<8){
                                return "Too Short!(>8 pls)";
                              }                             
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon:GestureDetector(
                              onTap: (){
                                setState(() {
                                  obserText=!obserText;
                                });    
                              },
                              child: Icon(obserText? Icons.visibility : Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // ),
                          ),
                        ),
                        SizedBox(height: scrheight*0.03,),
                        TextFormField(
                          controller: _phoneController,
                          validator: (value) {
                            if(value!=null){
                              if(value.isEmpty){
                                return "Phone number cannot be empty!";
                              }
                              else if(!regExp_phone.hasMatch(value)){
                                return "Phone number is invalid(requires 10)";
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // ),
                          ),
                        ),
                        SizedBox(height: scrheight*0.01,),
                        Container(
                          child: ElevatedButton(
                            onPressed: validation,
                            // onPressed:(){
                            //   addData(
                            //     _usernameController.text,
                            //     _emailController.text,
                            //     _passwordController.text,
                            //     _phoneController.text
                            //     );
                            // },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(scrwidth*0.4,scrheight*0.06)),
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 18),
                            ),
                            ),
                        ),
                        SizedBox(height: scrheight*0.02,),
                        Row(
                          children:[
                            Text('I Have Already An Account! ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LogIn()));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w800),
                              ),
                            ),
                          ] ,
                        ),
                        SizedBox(height: scrheight*0.02,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   // flex: 10,
            //   child: Container(
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
