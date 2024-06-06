import 'package:academy/src/core/resources/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: GestureDetector(
            onTap: () {
              context.pushNamed('videoDetails');
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12), bottom: Radius.zero),
                      child: Image.network(
                        AppConstants.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'عنوان ویدئو 1',
                          style: Theme.of(context).textTheme.titleMedium,
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          'توضیحات توضیحات توضیحات توضیحات توضیحات توضیحات توضیحات',
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 175,),
            Container(
              margin: const EdgeInsets.only(left:8),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Text('45:20',style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        )
      ],
    );
  }
}
