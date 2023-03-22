// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// // void main() {
// //   runApp(const MyApp());
// // }
//
// class UserApp extends StatelessWidget {
//   const UserApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const UserHomePage(title: 'Hệ thống bán lẻ laptop'),
//     );
//   }
// }
//
// class UserHomePage extends StatefulWidget {
//   const UserHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<UserHomePage> createState() => _UserHomePageState();
// }
//
// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // The search area here
//           title: Container(
//             width: double.infinity,
//             height: 40,
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(5)),
//             child: Center(
//               child: TextField(
//                 decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.search),
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.clear),
//                       onPressed: () {
//                         /* Clear the search field */
//                       },
//                     ),
//                     hintText: 'Search...',
//                     border: InputBorder.none),
//               ),
//             ),
//           )),
//     );
//   }
// }
//
// class Choice {
//   const Choice({required this.title, required this.icon});
//   final String title;
//   final IconData icon;
// }
//
// class Product {
//   const Product({required this.name, required this.price, required this.image});
//   final String name;
//   final int price;
//   final String image;
// }
//
//
//
// const List<Choice> choices = const <Choice>[
//   const Choice(title: 'Hãng', icon: Icons.branding_watermark_sharp),
//   const Choice(title: 'Giá', icon: Icons.price_change),
//   const Choice(title: 'Ram', icon: Icons.memory),
//   const Choice(title: 'Screen', icon: Icons.laptop_mac_sharp),
//   const Choice(title: 'Core', icon: Icons.generating_tokens_sharp),
//   const Choice(title: 'Sắp xếp', icon: Icons.change_circle),
// ];
//
//
// final List<Product> product = const <Product>[
//   const Product(name: 'Asus', price: 11, image: 'assets/images/laptop.png'),
//   const Product(name: 'Acer', price: 12, image: 'assets/images/laptop.png'),
//   const Product(name: 'Dell', price: 13, image: 'assets/images/laptop.png'),
//   const Product(name: 'HP', price: 10, image: 'assets/images/laptop.png'),
//   const Product(name: 'Dell vostro', price: 15, image: 'assets/images/laptop.png'),
//   const Product(name: 'Dell core i5', price: 18, image: 'assets/images/laptop.png'),
//   const Product(name: 'HP core i5', price: 17, image: 'assets/images/laptop.png'),
//   const Product(name: 'Asus core i7', price: 19, image: 'assets/images/laptop.png'),
// ];
//
//
//
//
// class SelectCard extends StatelessWidget {
//   const SelectCard({ Key? key, required this.choice}) : super(key: key);
//   final Choice choice;
//
//   @override
//   Widget build(BuildContext context) {
//     // final TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
//     return Card(
//         color: Colors.lightBlueAccent,
//         child: Center(child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Expanded(child: Icon(choice.icon, size:25.0, color: Theme.of(context).textTheme.displaySmall?.color)),
//               Text(choice.title, style: Theme.of(context).textTheme.subtitle1
//                   ),
//             ]
//         ),
//         )
//     );
//   }
// }
//
//
// class _UserHomePageState extends State<UserHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   // final List<Map> myProducts =
//   // List.generate(100000, (index) => {"id": index, "name": "Product $index"})
//   //     .toList();
//   //
//   final ScrollController _horizontal = ScrollController(),
//       _vertical = ScrollController();
//
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,   //new line
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           // Navigate to the Search Screen
//           IconButton(
//               onPressed: () => Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => const SearchPage())),
//               icon: const Icon(Icons.search))
//         ],
//       ),
//       body: SizedBox(
//     child: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//     child: Column(
//           children: <Widget>[
//             Container(
//               height: 120,
//               width: 380,
//               child: ListView(
//                   children: [
//                     CarouselSlider(
//                       items: [
//                         Container(
//                           margin: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(("https://phuochungcomputer.com/wp-content/uploads/2021/06/banner-dell-m4800-phuochung.png").replaceAll('"', '')),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(("https://phuochungcomputer.com/wp-content/uploads/2023/02/mtqn.png").replaceAll('"', '')),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(("https://hacom.vn/media/news/2409_0924-BannerConsumer_HNC_800x450.jpg").replaceAll('"', '')),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ],
//                       options: CarouselOptions(
//                         height: 200.0,
//                         enlargeCenterPage: true,
//                         autoPlay: true,
//                         aspectRatio: 16 / 9,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         viewportFraction: 0.8,
//                       ),
//                     ),
//                   ]),
//             ),
//             Card(child:ListTile(title: Text("SORT BY"), leading: Icon(Icons.search_off_rounded, color: Colors.cyan),)),
//             Container(
//               width: 380,
//               height: 150,
//               child:   Padding(
//                 padding: const EdgeInsets.all(22),
//                 child:  GridView.count(
//                     crossAxisCount: 3,
//                     childAspectRatio: 7 / 3,
//                     crossAxisSpacing: 5.0,
//                     mainAxisSpacing: 5.0,
//                     children: List.generate(choices.length, (index) {
//                       return Center(
//                         child: SelectCard(choice: choices[index]),
//                       );
//                     }
//                     )
//                 ),
//             )
//             ),
//             Card(child:ListTile(title: Text("TOP SELLER"), leading: Icon(Icons.shopping_cart)), color: Colors.amberAccent,),
//             Container(
//               height: 200,
//               width: 400,
//               color: Colors.white60,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 // implement GridView.builder
//                 child: GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                         maxCrossAxisExtent: 250,
//                         childAspectRatio: 4 / 4 ,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 20),
//                     itemCount: product.length,
//                     itemBuilder: (BuildContext ctx, index) {
//                       return Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Color.fromARGB(100, 100, 100, 100),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Center(child: Column(
//                       // crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                       Expanded(child: Image.asset(product[index].image,width: 100,height: 100,)),
//                       Text(product[index].name, style: Theme.of(context).textTheme.subtitle1),
//                       Text("price: " + product[index].price.toString() + " USD", style: Theme.of(context).textTheme.subtitle2),
//                         ButtonBar(
//                           alignment: MainAxisAlignment.center,
//                           buttonPadding:EdgeInsets.symmetric(
//                               horizontal: 30,
//                               vertical: 10
//                           ),
//                           children: [
//                             ElevatedButton(  child: Row (
//                               children: [
//                                 Text("Xem chi tiết"),
//
//                               ],
//                             ) ,
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => const UserApp()),
//                                 );
//                               },)],
//                         ),
//                         Text('')]
//                       ),
//
//                       ));
//                     }),
//               )),
//             Card(child:ListTile(title: Text("Sản phẩm sắp ra mắt"), leading: Icon(Icons.shopping_cart_checkout_outlined)), color: Colors.lightGreenAccent,),
//             Container(
//               height: 120,
//               width: 380,
//               child: ListView(
//                   children: [
//                     CarouselSlider(
//                       items: [
//                         Container(
//                           margin: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(("https://phuochungcomputer.com/wp-content/uploads/2021/06/banner-dell-m4800-phuochung.png").replaceAll('"', '')),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(("https://phuochungcomputer.com/wp-content/uploads/2023/02/mtqn.png").replaceAll('"', '')),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(("https://hacom.vn/media/news/2409_0924-BannerConsumer_HNC_800x450.jpg").replaceAll('"', '')),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ],
//                       options: CarouselOptions(
//                         height: 120.0,
//                         enlargeCenterPage: true,
//                         autoPlay: true,
//                         aspectRatio: 16 / 9,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         viewportFraction: 0.8,
//                       ),
//                     ),
//                   ]),
//             ),
//             Container(
//                 height: 350,
//                 width: 400,
//                 color: Colors.white60,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   // implement GridView.builder
//                   child: GridView.builder(
//                       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                           maxCrossAxisExtent: 250,
//                           childAspectRatio: 4 / 4 ,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 20),
//                       itemCount: product.length,
//                       itemBuilder: (BuildContext ctx, index) {
//                         return Container(
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(100, 100, 100, 100),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(child: Column(
//                               // crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   Expanded(child: Image.asset(product[index].image,width: 100,height: 100,)),
//                                   Text(product[index].name, style: Theme.of(context).textTheme.subtitle1),
//                                   Text("price: " + product[index].price.toString() + " USD", style: Theme.of(context).textTheme.subtitle2),
//                                   Text('')]
//                             ),
//
//                             ));
//                       }),
//                 )),
//
//           ],
//         ),
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';

import '../View/splash_screen.dart';


void main(){
  runApp(const UserApp());
}
class UserApp extends StatelessWidget {
  const UserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
