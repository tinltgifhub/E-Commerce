import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String name;
   ListProduct({required this.name});

  @override
  Widget build(BuildContext context) {

    var scrwidth = MediaQuery.of(context).size.width;
    var scrheight = MediaQuery.of(context).size.height;

    Widget _buildTitle(String title){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
        ],
      );
    }

      Widget _buildCard(String image, String cost, String name ){
        return Card(
          child: Column(
            children: [
              Container(
                width: scrwidth*0.4,
                height: scrheight*0.2,
                // color: Colors.red,
                child: Image(image: AssetImage('$image')),
              ),
              Text('$cost',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
              Container(
                width: scrwidth*0.4,
                child: Text('$name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,                
                  ),
                ),
              ),
              SizedBox(height: scrheight*0.03,),
            ],
          ),
        );
      }

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search), color: Colors.black, ),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none), color: Colors.black, ),
        ],
      ),
      body: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: scrwidth*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitle(name),
              Container(
                // color: Colors.red,
                height: scrheight*0.9,
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.74,
                  scrollDirection: Axis.vertical,
                  children: [
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ),       
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ),
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ),
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ),
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ),
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ),
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ),
                    _buildCard(
                      'images/product1.png',
                      '\$30.0.0', 
                      'Áo Sơmi Palewave Densed Stripes',
                    ), 
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}