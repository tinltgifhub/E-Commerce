import 'package:flutter/material.dart';

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

class _SignUpState extends State<SignUp> {
  void validation(){
    final FormState? _form = _formKey.currentState;
    if(_form!=null){
      _form.validate();
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
                          validator: (value){
                            if(value!=null){
                              if(value.isEmpty){
                                return 'UserName cannot be empty!';
                              }
                              else if(value.length<6){
                                return 'Too Short!(>6 pls)';
                              }
                            }
                            return '';
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
                          validator: (value){
                            if(value!=null){
                              if(!regExp_email.hasMatch(value)){
                                return "Email is invalid!";
                              }
                              else if(value.isEmpty){
                                return "Email cannot be empty!";
                              }                             
                            }
                            return "";
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
                          validator: (value) {
                            if(value!=null){
                              if(value.isEmpty){
                                return "Password cannot be empty!";
                              }
                              else if(value.length<8){
                                return "Too Short!(>8 pls)";
                              }                             
                            }
                            return "";
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
                          validator: (value) {
                            if(value!=null){
                              if(value.isEmpty){
                                return "Phone number cannot be empty!";
                              }
                              else if(!regExp_phone.hasMatch(value)){
                                return "Phone number is invalid(requires 10)";
                              }
                            }
                            return "";
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
                              onTap: (){},
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
