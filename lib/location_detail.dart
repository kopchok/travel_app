// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class LocationDetail extends StatefulWidget {
  const LocationDetail({super.key});

  @override
  _LocationDetailState createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail> {
  Map<String, dynamic> data = Get.arguments;

  List<String> path = [
    'asset/sea3.jpg',
    'asset/sea4.jpg',
    'asset/sea5.jpeg',
  ];

  String currentPath = '';

  @override
  void initState() {
    super.initState();
    path.insert(0, data['pathImage']);
    currentPath = path[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    currentPath,
                    fit: BoxFit.fitHeight,
                    height: Get.height * 0.5,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Colors.transparent, Colors.black87],
                        stops: [0.6, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.05,
                  left: Get.width * 0.05,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(45)),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.05,
                  right: Get.width * 0.05,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(45)),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.favorite_border_rounded,
                              size: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.42,
                  left: 20,
                  child: Text(
                    data['name'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.prompt(
                      fontSize: 15,
                      height: 1.1,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.42 + 20,
                  left: 20,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Let\'s make our life so a life',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          fontSize: 12,
                          height: 1.1,
                          color: Colors.white70,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: Get.height * 0.2,
                  right: Get.width * 0.05,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 270,
                    width: 80,
                    child: ListView.separated(
                      itemCount: path.length,
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              currentPath = path[index];
                            }),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                path[index],
                                height: 60,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Distance',
                          style: GoogleFonts.prompt(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '5km',
                          style: GoogleFonts.prompt(
                            fontSize: 18,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Temp',
                          style: GoogleFonts.prompt(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '20 °C',
                          style: GoogleFonts.prompt(
                            fontSize: 18,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rating',
                          style: GoogleFonts.prompt(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data['rate']}',
                          style: GoogleFonts.prompt(
                            fontSize: 18,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.prompt(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ReadMoreText(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                    trimMode: TrimMode.Line,
                    trimLines: 5,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: ' Show less',
                    style: GoogleFonts.prompt(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    moreStyle: GoogleFonts.prompt(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightBlueAccent,
                    ),
                    lessStyle: GoogleFonts.prompt(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: Get.height * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: GoogleFonts.prompt(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '\$1320',
                    style: GoogleFonts.prompt(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_circle_right_rounded,
                size: 80,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
