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
      drawer: Drawer(
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
              accountName: Text("Wesley"), 
              accountEmail: Text("engwesleybruno@gmail.com"), 
              currentAccountPicture: CircleAvatar(
                child: Text("W"),
                backgroundColor: Colors.redAccent,
              )
            ),

            ListTile(
              title: const Text("Details"),
              trailing: const Icon(Icons.arrow_forward),
              onTap:(){ 
                _pageController.jumpToPage(0);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavigationBar = 0;
                });
              },
            ),
            ListTile(
              title: const Text("Home"),
              trailing: const Icon(Icons.arrow_forward),
              onTap:(){ 
                _pageController.jumpToPage(1);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavigationBar = 1;
                });
              },
            ),
            
          ],
        ),
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