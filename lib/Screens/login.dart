import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}



final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String email_p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp_email = new RegExp(email_p);

bool obserText=true;

class _LogInState extends State<LogIn> {

  void validation(){
    final FormState? _form=_formKey.currentState;
    if(_form!=null){
      _form.validate();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    var scrwidth = MediaQuery.of(context).size.width;
    var scrheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login", style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  SizedBox(height: scrheight*0.05,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: scrwidth*0.03),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value!=null){
                              if(value.isEmpty){
                                return "Enter your email!";
                              }
                              else if(!regExp_email.hasMatch(value)){
                                return "Email is invalid";
                              }
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),                       
                            ),
                          ),
                        ),
                        SizedBox(height: scrheight*0.03,),
                        TextFormField(
                          obscureText: obserText,
                          validator: (value) {
                            if(value!=null){
                              if(value.isEmpty){
                                return "Enter your password!";
                              }
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  obserText=!obserText;
                                });  
                              },
                              child: Icon(obserText ? Icons.visibility : Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),                       
                            ),
                          ),
                        ),
                        SizedBox(height: scrheight*0.02,),
                        ElevatedButton(
                          onPressed: validation, 
                          child: Text('Login',style: TextStyle(fontSize: 18),),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(scrwidth*0.4,scrheight*0.06)),
                          ),
                        ),
                        SizedBox(height: scrheight*0.03,),
                        Row(
                          children: [
                            Text('I have no account! ',style: TextStyle(fontSize: 15),),
                            GestureDetector(
                              child: Text('SignUp',style: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.w700),),
                            ),
                          ],
                        ),
                        SizedBox(height: scrheight*0.15,),
                        
                      ]
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}