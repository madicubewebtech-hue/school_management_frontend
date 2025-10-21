

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeScreen extends StatefulWidget {
  final zoomController;
  const HomeScreen({ Key? key, this.zoomController }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  List science  =[
    'assets/images/teacher2.PNG',
    'assets/images/teacher3.PNG',
    'assets/images/teacher4.PNG'
  ];

  List math  =[
    'assets/images/teacher5.PNG',
    'assets/images/teacher6.PNG',
    'assets/images/teacher2.PNG'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 5),
            child: InkWell(
              onTap: () => widget.zoomController.toggle(),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey)
                ),
                child: const Icon(IconlyBroken.category, color: Colors.black,),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Today's Activity", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
              const Text('12 new assignments uploaded', style: TextStyle(fontSize: 20, color: Colors.grey),),
              const SizedBox(height: 20,),
              // overlapped(),
              const SizedBox(height: 20,),
              const Divider(thickness: 1,),
              const SizedBox(height: 10,),
              ListTile(
                leading: CircleAvatar(
                  radius: 28.0,
                  child: Image.asset('assets/icons/1.png'),
                ),
                title: const Text('Science', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold ),),
                subtitle: const Text('3 Assignment'),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: science.length,
                  itemBuilder: (context, index){
                    return AspectRatio(
                      aspectRatio: 1.5,
                      child: Container(
                        height: 250,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(science[index]),
                            fit: BoxFit.contain
                          ),
                          color: Colors.teal[100],
                        ),
                      ),
                    );
                  }
                ),
              ),
              const SizedBox(height: 8,),
               ListTile(
                leading: CircleAvatar(
                  radius: 28.0,
                  child: Image.asset('assets/icons/2.png'),
                ),
                title: const Text('Math', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold ),),
                subtitle: const Text('4 Assignment'),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: math.length,
                  itemBuilder: (context, index){
                    return AspectRatio(
                      aspectRatio: 1.5,
                      child: Container(
                        height: 250,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(math[index]),
                            fit: BoxFit.contain
                          ),
                          color: Colors.teal[100],
                        ),
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
     
    );
  }



}