import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  List<String> lstImages = [
    "https://media.istockphoto.com/id/466850191/photo/grunge-wall-full-of-old-frames.jpg?s=612x612&w=0&k=20&c=rsQPJTu51opTBgRZxPk6-8OEgoMwq0YbnK2c9NCX8C8=",
    "https://media.istockphoto.com/id/592023966/photo/classic-frame-on-white-cement-wall-in-showroom-and-gallery.jpg?s=612x612&w=0&k=20&c=a8tD0AmReCCrT4cpd36PJ3-IOpVvVOJrieUtaxfiyT8=",
    "https://media.istockphoto.com/id/1131101048/photo/art-exibition-lot-3d-visualization.jpg?s=612x612&w=0&k=20&c=pvGBkaradjb52py4T6IE_o4Ik1BK0NkIoqVDB54r5h4=",
    "https://code.recuweb.com/c/u/3a09f4cf991c32bd735fa06db67889e5/2018/08/wordpress-photo-gallery-plugins1.png",
    "https://images.unsplash.com/photo-1518998053901-5348d3961a04?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ0JTIwZ2FsbGVyeXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: 1000,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(lstImages[index%lstImages.length], fit: BoxFit.fill),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
