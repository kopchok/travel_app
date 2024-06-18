import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/location_detail.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexTab = 0;

  List<String> category = ['Beach', 'Mountain', 'Waterfalls', 'Lake', 'Dam'];

  List<Map<String, dynamic>> beach = [
    {
      'name': 'Maya Bay',
      'location': 'Thailand, South Asia',
      'pathImage': 'asset/sea3.jpg',
      'rate': 4.8,
    },
    {
      'name': 'Freshwater West',
      'location': 'Pembrokeshire, Wales',
      'pathImage': 'asset/sea4.jpg',
      'rate': 4.9,
    },
    {
      'name': 'Itzurun Beach',
      'location': 'Spain',
      'pathImage': 'asset/sea5.jpeg',
      'rate': 4.5,
    },
  ];

  List<Map<String, dynamic>> topDes = [
    {
      'name': 'McWays',
      'location': 'California',
      'pathImage': 'asset/sea5.jpeg',
    },
    {
      'name': 'Satorini',
      'location': 'Greece',
      'pathImage': 'asset/sea3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover',
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 15),
                        Icon(Icons.notifications_outlined)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            indexTab = index;
                          }),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                category[index],
                                style: GoogleFonts.prompt(
                                  fontWeight: index == indexTab
                                      ? FontWeight.bold
                                      : null,
                                  color: index == indexTab
                                      ? Colors.black87
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              if (index == indexTab)
                                const Icon(
                                  Icons.brightness_1,
                                  size: 5,
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: Get.height * 0.5,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: beach.length,
                  itemBuilder: (_, index) {
                    final data = beach[index];

                    return GestureDetector(
                      onTap: () => Get.to(
                        const LocationDetail(),
                        arguments: data,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              data['pathImage'],
                              fit: BoxFit.fitHeight,
                              width: Get.width * 0.65,
                              height: Get.height * 0.5,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              width: Get.width * 0.65 - 20,
                              height: Get.height * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: GoogleFonts.prompt(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      data['location'],
                                      style: GoogleFonts.prompt(
                                        fontSize: 8,
                                        color: Colors.black54,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: Get.height * 0.06 - 3,
                            right: Get.width * 0.1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: Colors.yellow.shade600,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      data['rate'].toString(),
                                      style: GoogleFonts.prompt(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 20),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Destination',
                    style: GoogleFonts.prompt(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: topDes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                topDes[index]['pathImage'],
                                fit: BoxFit.fitHeight,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    topDes[index]['name'],
                                    style: GoogleFonts.prompt(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    topDes[index]['location'],
                                    style: GoogleFonts.prompt(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 20)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.grey.shade100,
        color: Colors.grey,
        activeColor: Colors.black,
        curveSize: 0,
        items: const [
          TabItem(icon: Icons.home_rounded),
          TabItem(icon: Icons.share_location_rounded),
          TabItem(icon: Icons.favorite_border_rounded),
          TabItem(icon: Icons.person_outline_rounded),
        ],
        onTap: (_) {},
      ),
    );
  }
}
