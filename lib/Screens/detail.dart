import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  int quentity=1;
  
  @override
  Widget build(BuildContext context) {
    var scrwidth = MediaQuery.of(context).size.width;
    var scrheight = MediaQuery.of(context).size.height;

    
    Widget _buildSize(String size){
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.7,
            color:Color.fromARGB(115, 249, 126, 10),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        
        height: scrheight*0.06,
        width: scrwidth*0.13,
        child: Center(
          child: Text('$size', 
            style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.w500, color: Colors.orange[400],
            ),
          ),
        ),
      );
    }

    Widget _buildColor(Color color){
      return Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1.7,
            color:color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        
        height: scrheight*0.06,
        width: scrwidth*0.13,
      );
    }

    Widget _buildquentity() {
      return Container(
        height: scrheight*0.05,
        // width: scrwidth*0.35,
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(
            color: Color.fromARGB(132, 255, 163, 3),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              splashColor:  Color.fromARGB(132, 255, 163, 3),
              onPressed: (){
                if(quentity>1){
                  setState(() {
                    quentity--;
                  });
                }
              }, 
              icon: Icon(Icons.remove,size: 22,color: Color.fromARGB(132, 255, 163, 3),)),
            Text(quentity.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:Color.fromARGB(132, 255, 163, 3),)),
            IconButton(
              splashColor:  Color.fromARGB(132, 255, 163, 3),
              onPressed: (){
                setState(() {
                  quentity++;
                });
              }, 
              icon: Icon(Icons.add,size: 22, color:  Color.fromARGB(132, 255, 163, 3),)),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
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
        child: SingleChildScrollView(
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
                        SizedBox(height: scrheight*0.02,),
                        Text('Áo Sơmi Palewave Densed Stripes',    
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: scrheight*0.03,),
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
                            color: Colors.orange[400],
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
                        SizedBox(height: scrheight*0.02,),
                        Text('Color',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange[400],
                          ),
                        ),
                        Container(
                          width: scrwidth*0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildColor(Color.fromARGB(255, 5, 203, 253)),
                              _buildColor(Color.fromARGB(255, 2, 10, 251)),
                              _buildColor(Color.fromARGB(255, 255, 157, 0)),
                              _buildColor(Color.fromARGB(255, 2, 114, 45)),
                            ],
                          ),
                        ),
                        SizedBox(height: scrheight*0.02,),
                        Text('Quentity',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(132, 255, 163, 3),
                          ),
                        ),
                        SizedBox(height: scrheight*0.01,),
                        _buildquentity(),
                        SizedBox(height: scrheight*0.03,),
                        Container(
                          height: scrheight*0.06,
                          width: scrwidth*0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: Center(
                            child: GestureDetector(
                              child: Text('Check Out',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(140, 0, 0, 0), 
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: scrheight*0.03,),
                      ]
                  ),
                  ]
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}