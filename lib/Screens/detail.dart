import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    var scrwidth = MediaQuery.of(context).size.width;
    var scrheight = MediaQuery.of(context).size.height;

    Widget _buildSize(String size){
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.4,
            color: Color.fromARGB(255, 238, 159, 90),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        
        height: scrheight*0.06,
        width: scrwidth*0.13,
        child: Center(
          child: Text('$size', 
            style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.w500, color: Color.fromARGB(255, 236, 148, 97)
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.arrow_back, color: Color.fromARGB(255, 255, 115, 0),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.notifications, color: Color.fromARGB(255, 255, 115, 0),
              ),
            ),
        ],
      ),
      body: Container(
        color: Colors.grey[10],
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: scrwidth*0.04), 
              child: Container(
                width: scrwidth*0.8,
                height: scrheight*0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/product1.png'),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: scrwidth*0.04,right: scrwidth*0.04,top: scrheight*0.02 ),
              child: Row(
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text('\$30.0.0',    
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 101, 6),
                        ),
                      ),
                      SizedBox(height: scrheight*0.03,),
                      Text('Áo Sơmi Palewave Densed Stripes',    
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: scrheight*0.05,),
                      Text('Description',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(189, 0, 0, 0) ,
                        ),
                      ),
                      Container(
                        width: scrwidth*0.9,
                        child: Text('Introducing our Classic Cotton T-Shirt, a timeless wardrobe essential that combines comfort, style, and versatility. Crafted with the finest quality cotton, this T-shirt is designed to provide both a soft, luxurious feel and a smart, casual look. It\'s the perfect addition to your everyday attire.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 100, 98, 98),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: scrheight*0.03,),
                      Text('Size',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(187, 250, 121, 28) ,
                        ),
                      ),
                      Container(
                        width: scrwidth*0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSize("S"),
                            _buildSize("M"),
                            _buildSize("L"),
                            _buildSize("XL"),
                          ],
                        ),
                      ),
                    ]
                ),
                ]
              ),
            ),
          ]
        ),
      ),
    );
  }
}