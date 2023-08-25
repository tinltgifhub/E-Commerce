import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  


  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    var scrwidth = MediaQuery.of(context).size.width;
    var scrheight = MediaQuery.of(context).size.height;

    Widget _bulidCategoryProduct(String image , Color color){
      return CircleAvatar(
        maxRadius: scrwidth*0.07,
        backgroundColor: color,
        child: Image(
          color: Colors.white,
          width: scrwidth*0.1, 
          height: scrheight*0.1,
          image: AssetImage('images/$image'),
        ),
      );
    }

    Widget _buildTitle(String title){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          Text('See all',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
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
              width: scrwidth*0.5,
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



    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor:  Colors.grey[200], 
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            _key.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu,color: Colors.black,),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.notifications_none,color: Colors.black,),
            ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.send,color: Colors.black,),
            ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: scrheight*0.01),
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: scrwidth*0.03),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Something",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )
                  ),
                ),
              ),
              SizedBox(height: scrheight*0.02,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: scrwidth*0.03),
                child: Column(
                  children: [
                    _buildTitle('Featured'),
                    SizedBox(height: scrheight*0.01,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCard(
                            'images/Áo Sơmi Palewave Densed Stripes.png',
                            '\$30.0.0', 
                            'Áo Sơmi Palewave Densed Stripes',
                          ),
                          _buildCard(
                            'images/Áo Sơmi Palewave Densed Stripes.png',
                            '\$30.0.0', 
                            'Áo Sơmi Palewave Densed Stripes',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: scrheight*0.03,),
                    _buildTitle("Categorie"),
                    SizedBox(height: scrheight*0.01,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _bulidCategoryProduct('dress.png', Color.fromARGB(255, 100, 164, 217)),
                          SizedBox(width:scrwidth*0.04),
                          _bulidCategoryProduct('tshirt.png',Color.fromARGB(255, 83, 213, 118)),
                          SizedBox(width:scrwidth*0.04),
                          _bulidCategoryProduct('sneakers.png',Color.fromARGB(255, 203, 116, 72)),
                          SizedBox(width:scrwidth*0.04),
                          _bulidCategoryProduct('trousers.png',Color.fromARGB(255, 225, 216, 54)),
                          SizedBox(width:scrwidth*0.04),
                          _bulidCategoryProduct('tie.png',Color.fromARGB(255, 254, 127, 220)),
                          SizedBox(width:scrwidth*0.04),
                        ],
                      ),
                    ),
                    SizedBox(height: scrheight*0.03,),
                    _buildTitle("New Achives"),
                    SizedBox(height: scrheight*0.01,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                           _buildCard(
                            'images/Áo Sơmi Palewave Densed Stripes.png',
                            '\$30.0.0', 
                            'Áo Sơmi Palewave Densed Stripes',
                          ),
                          _buildCard(
                            'images/Áo Sơmi Palewave Densed Stripes.png',
                            '\$30.0.0', 
                            'Áo Sơmi Palewave Densed Stripes',
                          ),
                        ],
                      ),
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