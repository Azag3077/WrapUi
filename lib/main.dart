import 'dart:math';
import 'package:extracted_ui/paints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'chip.dart';

void main() => runApp(const ProviderScope(child: DemoApp()));

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo app',
      home: MainUI(),
    );
  }
}

class MainUI extends StatelessWidget {
  const MainUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpecPage();
  }
}

final currentIndexStateProvider = StateProvider<int>((ref) => 0);

class SpecPage extends ConsumerWidget {
  const SpecPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = [
      "assets/car0.png",
      "assets/car1.JPG",
      "assets/car2.jpeg",
      "assets/car3.jpeg",
      "assets/car4.jpeg",
    ];
    final imageUrls = images.sublist(0, min(3, images.length));
    final extra = images.length - imageUrls.length;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        title: const Text("Toyota corolla"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  foregroundPainter: PageViewIndicatorEllipse(
                    length: imageUrls.length,
                    activeIndex: ref.watch(currentIndexStateProvider),
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Theme.of(context).colorScheme.background
                  ),
                  child: PageView(
                    onPageChanged: (int index) => ref.read(currentIndexStateProvider.notifier).update((state) => index),
                    children: imageUrls.map((url) => Image.asset(url)).toList(),
                    // children: imageUrls.map((url) => ImageLoader(imageUrl: url)).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 4,
                  color: Colors.grey.shade100,
                  margin: const EdgeInsets.only(top: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 30.0),
                          child: Text("Specification"),
                        ),
                        SizedBox(height: 10.0),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: <Widget>[
                                SpecChip(
                                  name: "Transmission",
                                  value: "Auto"
                                ),
                                SpecChip(
                                  name: "Fuel Type",
                                  value: "Electric"
                                ),
                                SpecChip(
                                  name: "Drive Type",
                                  value: "rear-wheel drive (RWD)"
                                ),
                                SpecChip(
                                  name: "Negotiable",
                                  value: "Yes"
                                ),
                                SpecChip(
                                  name: "Built-in GPS",
                                  value: "Yes"
                                ),
                                SpecChip(
                                  name: "Rear Camera",
                                  value: "Yes"
                                ),
                                SpecChip(
                                  name: "Interior Color",
                                  value: "Grey"
                                ),
                                SpecChip(
                                  name: "Exterior Color",
                                  value: "Off-White"
                                ),
                                SpecChip(
                                  name: "Engine Size",
                                  value: "3.0"
                                ),
                                SpecChip(
                                  name: "Steering",
                                  value: "Right"
                                ),
                                SpecChip(
                                  name: "Wheel Cover",
                                  value: "Alloy"
                                ),
                                SpecChip(
                                  name: "Cylinders",
                                  value: "12"
                                ),
                                SpecChip(
                                  name: "Condition",
                                  value: "Brand new"
                                ),
                                SpecChip(
                                  name: "Year",
                                  value: "2022"
                                ),
                                SpecChip(
                                  name: 'VIN',
                                  value: "19404231"
                                ),

                                SpecChip(
                                  name: "Cylinders",
                                  value: "12"
                                ),
                                SpecChip(
                                  name: "Condition",
                                  value: "Brand new"
                                ),
                                SpecChip(
                                  name: "Year",
                                  value: "2022"
                                ),
                                SpecChip(
                                  name: 'VIN',
                                  value: "19404231"
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: imageUrls.map((url) => SizedBox.square(
                      dimension: 44,
                      child: Card(
                        margin: const EdgeInsets.all(4.0),
                        color: Colors.grey.shade300,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: <Widget>[
                            Center(
                              // child: ImageLoader(imageUrl: url),
                              child: Image.asset(url),
                            ),
                            if (imageUrls.last == url && extra > 0) Container(
                              color: Colors.black.withOpacity(.4),
                              child: Center(
                                  child: Text(
                                    '+$extra',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade50,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    )).toList()
                  ),
                )
              ],
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: const MaterialStatePropertyAll(
                            Colors.white
                        ),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                        )
                    ),
                    child: const Text("Purchase now"),
                  ),
                  const Text("₦12,000,000")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Item {
  final String model;
  final String year;
  final String vin;
  final String interiorColor;
  final String exteriorColor;
  final String price;
  final String negotiable;
  final String transmission;
  final String steering;
  final String gps;
  final String camera;
  final String wheel;
  final String condition;
  final String driveType;
  final String fuelType;
  final String engineSizeType;
  final String cylinderType;
  final List<String> images;

  Item(
    this.model,
    this.year,
    this.vin,
    this.interiorColor,
    this.exteriorColor,
    this.price,
    this.negotiable,
    this.transmission,
    this.steering,
    this.gps,
    this.camera,
    this.wheel,
    this.condition,
    this.driveType,
    this.fuelType,
    this.engineSizeType,
    this.cylinderType,
    this.images,
  );
}
