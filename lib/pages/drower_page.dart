import 'package:flutter/material.dart';
// Draver telegramga o'xshab yonidan ma'lumotlarni chiqarib beradi
class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}
class _DrawerPageState extends State<DrawerPage> {
  PageController? _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Messages",style: TextStyle(color: Colors.white,fontSize: 30),)),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Container(
            child:ListView(
              children: [
                _itemList(title: "Laurent   20:18\nHow about meeting tomorrow?",image: "assets/img.png"),
                _itemList(title: "Tracy   19:22\nILove that idea,it's great!",image: "assets/img_1.png"),
                _itemList(title: "Claire  14:34\nI wasn't aware of that.Let me check",image: "assets/img_2.png"),
                _itemList(title: "Joe  11:03\nFlutter just roloaso1.0 officially.\nShould igo for it?",image: "assets/img_3.png"),
                _itemList(title: "Mark  09:46\nIt totally makes sense to get some\nextra day-off ",image: "assets/img_4.png"),
                _itemList(title: "Williams  08:15\nIt has been re-scheduled to next\nSaturday 7.30pm",image: "assets/img_5.png"),
              ],
            ),
          ),
          Container(
            color: Colors.cyan,
            child: Center(
              child: Text(
                "Page two",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ), Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                "Page three",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", ),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "Message",),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), label: "Video"),
        ],
        currentIndex: _selectedIndex,
        //iconlar yurganda rangini o'zgartiradi shu rangga
        selectedItemColor: Colors.deepPurple,
        // umumiy iconlar turgan joy rangi
        backgroundColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            _pageController!.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        },
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Image(image:AssetImage ("assets/img.png",),height: 90,width: 90,),
                  ),
                  Text("Durdona"),
                  Text("Durdona@gmail.com"),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: Row(
                      children: [Icon(Icons.home), SizedBox(width: 5,), Text("Home"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: Row(
                      children: [Icon(Icons.person), SizedBox(width: 5,), Text("Person"),
                      ],
                    ),
                  ), Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: Row(
                      children: [Icon(Icons.people_outline), SizedBox(width: 5,), Text("Aboutus"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _itemList({title, image}){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,color: Colors.grey
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text(title),
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color:Colors.black ,),iconSize: 16,)
        ],

      ),

    );

  }
}
