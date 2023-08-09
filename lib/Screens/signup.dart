import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key});

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

            Expanded(
              flex: 50,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal:scrwidth*0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
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
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon:GestureDetector(
                            onTap: (){
                              FocusScope.of(context).unfocus();
                            },
                            child:Icon(Icons.visibility),
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
                          onPressed: (){}, 
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
                    ],
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
