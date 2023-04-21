import 'package:flutter/material.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';
import 'brands.dart';
import 'home_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/icons/back_ic.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Product',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: TextFormField(
                cursorColor: customBlue,
                cursorWidth: 2.5,
                style: textStyle1,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: "Tìm kiếm",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                    Image.asset("assets/icons/search_ic.png"),
                  ),
                  hintStyle: textStyle1,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              )),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Brands(),
            ),
            Container(
              color: Colors.amberAccent,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.newspaper, color: Colors.black,),
                  Text(
                    "Sản phẩm",
                    style: textStyle4,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "",
                        style: textStyle5,
                      ))
                ],
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "BEST CHOISE",
                                        style: textStyle6,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Asus core i5",
                                        style: textStyle4,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "15.990.000 VNĐ",
                                        style: textStyle4,
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: Image.asset(
                                  "assets/shows/laptopDetail.png",
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            )]))))
        ]));
  }
}
