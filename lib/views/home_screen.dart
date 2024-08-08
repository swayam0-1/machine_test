import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:machine_test/views/widgets/icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int i=0;
    final List<String> imgList = [
      'https://rukminim2.flixcart.com/fk-p-flap/844/140/image/0f55fc4a6e385599.jpg?q=50',
      'https://rukminim2.flixcart.com/fk-p-flap/844/140/image/752b0ca7a56e92a7.jpg?q=50',
      'assets/dealsDray.png',
      'assets/dealsDray.png',
      'assets/dealsDray.png',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 2,
   title: Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
   children: [
     Expanded(child:Container(

       padding: EdgeInsets.symmetric(horizontal: 16),
       decoration: BoxDecoration(
        color: Colors.grey,
         borderRadius: BorderRadius.circular(8)
       ),
       child: Row(
         children: [
           Container(
             child: Image.asset('assets/dealsDray.png',width: 35,height: 35,),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20)),
             ),
          const SizedBox(width: 8,),
            const Expanded(child: TextField(
             decoration: InputDecoration(
               border: InputBorder.none,
               hintText: 'Search..',
             ),
           )),
        const   Icon(Icons.search),
         ],
       ),
     ),),
     const SizedBox(width: 8,),
     const Icon(Icons.notifications)
   ],

   ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(

        options: CarouselOptions(

                  height: 260.0,
                  autoPlay: true,
                  enlargeCenterPage: true,

                ),

                items: imgList.map((item) => Container(
                 padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown[800]
                  ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                     Padding(
                       padding:const EdgeInsets.symmetric(vertical: 10,horizontal:8 ),
                       child:  Column(

                         crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                           const Text('Redmi Note 7s',style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),),
                          const  Text('48MP for everyone',style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                            ),),

                         Container(
                           margin: EdgeInsets.only(top: 9),
                           child:const Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                                Text('20M units',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold
                                ),),
                              Text('of Redmi Note 7 series sold globally' ,style:TextStyle(
                                   color: Colors.white,
                                   fontSize: 12
                               ),),
                               Text('% Now on No Cost EMI',style:TextStyle(
                                   color: Colors.white,
                                   fontSize: 12
                               ),),
                                Text('From 9999',style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 12
                                ),),
                             ],
                           ),
                         ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,

                              ),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                                  child: Text('Buy Now')),
                            )
                          ],
                        ),
                     ),


                            Image.network('https://m.media-amazon.com/images/I/71C8O0yT7hL._AC_UY327_FMwebp_QL65_.jpg',
                             height:250 ,width: 100,)
                    ],
                  ),


                )).toList(),
              ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurpleAccent,
              ),
              width: double.infinity,
              alignment: Alignment.center,

              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: (
              Column(
                children: [
                 const Text('KYC Pending',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                   color: Colors.white
              ),),
                  const Text('You need to provide the required documents for your account activation.,',textAlign: TextAlign.center,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,

              )),
                  TextButton(onPressed: (){
                    print('pressed');
                  },
                      child:const Text('Click Here',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                      ),),)

                ],
              )
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconWidget(
                    icons:Icons.phone_android ,
                    txt: 'Mobile',
                    color: Colors.deepPurpleAccent,
                  ),
                  IconWidget(
                    icons: Icons.laptop,
                    txt: 'Laptop',
                    color: Colors.greenAccent,
                  ),
                  IconWidget(
                    icons: Icons.camera_alt,
                    txt: 'Camera',
                    color: Colors.pinkAccent,
                  ),
                  IconWidget(
                    color: Colors.deepOrangeAccent,
                    icons: Icons.lightbulb,
                    txt: 'LED',
                  ),
                ],
              ),
            ),
        Container(
    decoration: BoxDecoration(
      color: Colors.cyan
    ),
    child: Column(
      children: [
        const Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EXCLUSIVE FOR YOU',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                wordSpacing: 1
              ),),
              Icon(Icons.arrow_forward,color: Colors.white,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
            child: Row(
              children:  List.generate(5,(index) =>buildCard(index)),
            ),
          ),
        ),
      ],
    ),
  )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      isExtended: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child:const Stack(

        children: [
           Row(
              children: [

                Icon(Icons.chat),

                Text('Chat',)
              ],
            ),
  ],

        ),),
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: i,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.grey,),label: 'Home',

          ),
          BottomNavigationBarItem(icon: Icon(Icons.category,color: Colors.grey,),label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department,color: Colors.grey,),label: 'Deals'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.grey,),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.grey,),label: 'Profile'),
        ],

      ),
      );

  }


//build card for the category phones
  Widget buildCard(int index) {
    return
       Container(
         color: Colors.white,
     margin:const  EdgeInsets.all(10),
        padding:const EdgeInsets.all(4),
        width: 200,
        height: 300,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Center(
                    child: Image.network(
                      'https://th.bing.com/th?id=OPAC.1dAQqDO%2fO4oO5w474C474&w=220&h=210&c=17&o=5&dpr=1.3&pid=21.1',
                      height:100 ,
                      width: 100,

                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Title $index',
                        style:const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const  SizedBox(height: 5),
                     const Text(
                        'Product description goes here.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.green,
                ),
                height: 20,
                width: 60,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

                child:const Text(
                  '20% Off',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }}