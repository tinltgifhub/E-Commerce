import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var scrwidth = MediaQuery.of(context).size.width;
    var scrheight = MediaQuery.of(context).size.height;

    Widget _buildQuentity(){
      return Container(
        height: scrheight*0.05,
        width: scrwidth*0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 253, 169, 43),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.remove, color: Colors.white, size: 20,),
                ),
              )
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                border: Border(     
                  top: BorderSide(
                    color: const Color.fromARGB(255, 253, 169, 43),
                    width: 1.5, 
                    ),
                  bottom: BorderSide(
                    color: const Color.fromARGB(255, 253, 169, 43),
                    width: 1.5,
                    ),
                  ),
                ),
                child: Center(
                  child: Text('1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 253, 169, 43),
                    ),
                  ),
                ),
              )
            ),
            Expanded(
              child: Container(
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add, color: Colors.white,size: 20,),
                ),
              )
            ),
          ],
        ),
      );
    };

    Widget _buildCard(){
      return Container(
        margin: EdgeInsets.only(bottom: scrheight*0.02),
        padding: EdgeInsets.symmetric(horizontal: scrwidth*0.02),
        height: scrheight*0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image(
                    image: AssetImage('images/product1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Áo Sơmi Palewave Densed Stripes',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(163, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: scrheight*0.01,),
                    Text('\$30.0.0',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(162, 0, 97, 44),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                // color: Colors.green,
                child: _buildQuentity(),
              ),
            )
          ],
        ),
      );
    };

    Widget _buildCost(String name, String value, Color color){
      return Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(166, 0, 0, 0),
              ),
          ),
          // SizedBox(width: scrwidth*0.03,),
          Text('$value',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      );
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back,color: Colors.orange[500],),
        ),
        title: Text('My Cart',style: TextStyle(fontSize: 30,color: Colors.orange[300]),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(121, 224, 178, 114),
              ),
              padding: EdgeInsets.only(left: scrwidth*0.035, right: scrwidth*0.035, top: scrheight*0.02),
              margin: EdgeInsets.only(bottom: 70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  Container(
                    margin: EdgeInsets.only(bottom: scrheight*0.03),
                    padding: EdgeInsets.symmetric(horizontal: scrwidth*0.05),
                    // height: scrheight*0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height:scrheight*0.01),
                        _buildCost('Your price:', '\$30.0.0', Color.fromARGB(255, 248, 69, 14)),
                        SizedBox(height:scrheight*0.01),
                        _buildCost('Discount:', '\$2.0.0',Color.fromARGB(255, 5, 196, 46)),
                        SizedBox(height:scrheight*0.01),
                        _buildCost('Shipping:', '\$3.0.0',Color.fromARGB(255, 248, 69, 14)),
                        SizedBox(height:scrheight*0.01),
                        _buildCost('Total:', '\$29.0.0',Color.fromARGB(255, 248, 69, 14)),
                        SizedBox(height:scrheight*0.01),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: scrwidth*0.03,
            right: scrwidth*0.03,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: scrheight*0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 255, 206, 81),
              ),
              height: scrheight*0.07,
              child: Center(
                child: Text('Check Out',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}