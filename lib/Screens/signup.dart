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
                color: Colors.green,
                // margin: EdgeInsets.symmetric(horizontal:scrwidth*0.03),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Username",
                        suffixIcon:GestureDetector(
                          onTap: (){
                            FocusScope.of(context).unfocus();
                          },
                          child:Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(style: BorderStyle.solid,color: Colors.red),
                        ),         
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
