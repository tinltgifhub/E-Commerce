import 'package:ecommerce/Screens/detail.dart';
import 'package:ecommerce/Screens/listproduct.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final List<bool> isSelected = [true, false, false, false];

  void handleSelection(int index) {
      setState(() {
        for (int i = 0; i < isSelected.length; i++) {
          isSelected[i] = (i == index); 
        }
      });
    }

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

    Widget _buildTitle(String title1, String title2){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx)=>ListProduct(name:title1)
                )
              );
            },
            child: Text('$title2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          ),
        ],
      );
    }

    Widget _buildCard(String image, String cost, String name ){
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx)=>Detail(),
            )
          );
        },
        child: Card(
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
        ),
      );
    }

    
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Tinlt',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),), 
              accountEmail: Text('tinlt@gmail.com', style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
              decoration: BoxDecoration(
                color: Colors.grey[200], 
              ),
              currentAccountPicture: CircleAvatar(
                maxRadius: 45,
                backgroundImage: AssetImage('images/user.jpg'),
              ),
            ),
            ListTile(
              selected: isSelected[0],
              onTap:() => handleSelection(0),    
              leading: Icon(Icons.home, size: 30,),
              title: Text("Home",style: TextStyle(fontSize: 17),),
            ),
            ListTile(
              selected: isSelected[1],
              onTap:() => handleSelection(1),
              leading: Icon(Icons.shopping_cart, size: 30,),
              title: Text("Cart",style: TextStyle(fontSize: 17),),
            ),
            ListTile(
              selected: isSelected[2],
              onTap:() => handleSelection(2),
              leading: Icon(Icons.info, size: 30,),
              title: Text("About",style: TextStyle(fontSize: 17),),
            ),
            ListTile(
              selected: isSelected[3],
              onTap:() => handleSelection(3),
              leading: Icon(Icons.exit_to_app, size: 30,),
              title: Text("Log out",style: TextStyle(fontSize: 17),),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor:  Colors.grey[200], 
        elevation: 0.0,
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
          // margin: EdgeInsets.only(top: scrheight*0.01),
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: scrwidth*0.03),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: scrheight*0.25, 
                        autoPlay: true, 
                        autoPlayInterval: Duration(seconds: 2), 
                        autoPlayAnimationDuration: Duration(milliseconds: 800), 
                        pauseAutoPlayOnTouch: true, 
                        enlargeCenterPage: true, 
                        enableInfiniteScroll: true, 
                      ),
                      items: [
                        Container(
                          child: Image(image: AssetImage('images/tie.png')),
                        ),
                        Container(
                          child: Image(image: AssetImage('images/dress.png')),
                        ),
                        Container(
                          child: Image(image: AssetImage('images/sneakers.png')),
                        ),
                      ],
                    ),
                    _buildTitle("Categorie",'View more'),
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
                    _buildTitle('Featured','View more'),
                    SizedBox(height: scrheight*0.01,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
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
                        ],
                      ),
                    ),
                    SizedBox(height: scrheight*0.03,),
                    _buildTitle("New Achives",'See all'),
                    SizedBox(height: scrheight*0.01,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
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