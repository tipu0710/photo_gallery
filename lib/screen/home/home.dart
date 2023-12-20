import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_gallery/controller/image_controller.dart';
import 'package:photo_gallery/model/imageModel/image_model.dart';
import 'package:photo_gallery/provider/login_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_gallery/screen/home/image_card.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int page = 1;

  final imageController = ImageController();

  @override
  void dispose() {
    imageController.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(
              "assets/images/logo.png",
              height: 30,
            ),
            const SizedBox(width: 5),
            const Text(
              "Photo Gallery",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        leadingWidth: 150,
        actions: [
          IconButton.outlined(
            onPressed: () {
              ref.read(loginProvider.notifier).logout(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: PagedListView<int, ImageModel>(
        pagingController: imageController.pagingController,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        builderDelegate: PagedChildBuilderDelegate<ImageModel>(
          itemBuilder: (context, item, index) => ImageCard(
            imageModel: item,
          ),
        ),
      ),
    );
  }
}
