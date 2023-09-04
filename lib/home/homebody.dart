import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Find/Search"
        ,textAlign: TextAlign.center,
        ),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Added borderRadius
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MAP GET LOCATION / FIND',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/latLong');
                  },
                  child:const  ItemDashboard(
                    title: 'GET ADDRESS',
                    iconData: Icons.location_history,
                    background: Colors.deepPurple,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/searchonamp');
                  },
                  child: const ItemDashboard(
                    title: 'SEARCH ON MAPS',
                    iconData: Icons.location_city_outlined,
                    background: Colors.teal,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/homeonmap');
                  },
                  child: const ItemDashboard(
                    title: 'GET ADDRESS ON MAP',
                    iconData: Icons.location_city,
                    background: Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDashboard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color background;

  const ItemDashboard(
      {super.key,
    required this.title,
    required this.iconData,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: background.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration:const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              color: background,
              size: 40,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
