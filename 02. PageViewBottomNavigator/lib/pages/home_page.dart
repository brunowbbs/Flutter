import 'package:example/pages/pagesViews/one_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();

    int indexBottomNavigationBar = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView"),
      ),
      body: PageView(
        controller: _pageController,
        children:  [
          const OnePage(),
          Container(color: Colors.redAccent),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavigationBar,
        onTap: (int page){
            
          setState(() {
            indexBottomNavigationBar = page;
          });
            _pageController.animateToPage(page,duration:  const Duration(milliseconds: 300), curve: Curves.ease );

          },
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.deck), label:"Details")
        ]
      ),
    );
  }
}