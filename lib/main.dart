
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Find Your',
                  style: TextStyle(color: Colors.black87, fontSize: 25.0),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Inspiration',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(244, 243, 243, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black87),
                      hintText: "Find What You're Looking For",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Promo Today',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        promoCard('assets/images/image-1.jpg'),
                        promoCard('assets/images/image-2.jpeg'),
                        promoCard('assets/images/image-4.jpg'),
                        promoCard('assets/images/image-5.jpeg'),
                      ],
                    ),
                    ),
                    const SizedBox(height: 20,),
                    Container(  
                      height: 190,
                      decoration: BoxDecoration( 
                        color:Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      image:const DecorationImage(
                        fit: BoxFit.cover,
                        image:AssetImage('assets/images/image-3.jpg'),
                      )
                      ),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child:Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Best Design',style:TextStyle(color: Colors.white,fontSize: 15),),
                        ),
                      ),
                    )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget promoCard(image) {
    return AspectRatio(
        aspectRatio: 2.62 / 3,
        child: Container(
          margin: const EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ));
  }
}
