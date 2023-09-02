import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), 
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Image(
                image: AssetImage('images/welcome.png'),
              ),
            ),
            SizedBox(height: 20.0), 
            Text(
              'Welcome to the Best\nClothes Shopping App!',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                backgroundColor: Color.fromARGB(255, 11, 137, 255), 
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white, 
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  child: Text('Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),  
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





