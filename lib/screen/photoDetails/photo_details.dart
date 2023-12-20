import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/model/imageModel/image_model.dart';
import 'package:photo_gallery/utils/extensions.dart';

class PhotoDetails extends StatefulWidget {
  const PhotoDetails({super.key, required this.imageModel});

  final ImageModel imageModel;

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Photo Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Hero(
                tag: widget.imageModel.downloadUrl ?? "",
                child: CachedNetworkImage(
                  imageUrl: (widget.imageModel.downloadUrl ?? "").changeUrl(),
                  fit: BoxFit.fitWidth,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported,
                    size: 104,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text.rich(
                TextSpan(children: [
                  const TextSpan(
                      text: "Captured by: ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 83, 85, 95),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(text: widget.imageModel.author),
                ]),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Photo Description:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(
                  color: Color.fromARGB(255, 42, 33, 33),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
