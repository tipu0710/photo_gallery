import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/model/imageModel/image_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_gallery/screen/photoDetails/photo_details.dart';
import 'package:photo_gallery/utils/extensions.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.imageModel});
  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetails(imageModel: imageModel),
          ),
        );
      },
      child: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(vertical: 10),
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xff505763), width: .4),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 104,
              margin: const EdgeInsets.only(right: 9.7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Hero(
                  tag: imageModel.downloadUrl ?? UniqueKey().toString(),
                  child: CachedNetworkImage(
                    imageUrl: (imageModel.downloadUrl ?? "").changeUrl(),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
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
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      imageModel.author,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 38, 41, 47),
                        height: 1.3846153846153846,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text(
                    "01/12/2023",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff505763),
                      height: 1.3846153846153846,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
