import 'package:academy/src/core/domain/entities/lesson_entity.dart';
import 'package:flutter/material.dart';
import 'package:dashed_line/dashed_line.dart';

class LessonsListItem extends StatelessWidget {
  final int index;
  final LessonEntity lessonEntity;
  final bool? isLast;

  const LessonsListItem({
    required this.index,
    required this.lessonEntity,
    this.isLast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    return indexToItem(index, width, colorScheme);
  }

  Widget indexToItem(int index, double width, ColorScheme colorScheme) {
    int remainder = index % 2;
    switch (remainder) {
      case 0:
        return firstContainer(width, colorScheme);
      case 1:
        return secondContainer(width, colorScheme);
      default:
        return const SizedBox();
    }
  }

  Widget firstContainer(double width, ColorScheme colorScheme) {
    return SizedBox(
      width: width,
      height: 150,
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: width * 0.75,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                  topLeft: Radius.circular(12),
                ),
              ),
              height: 120,
              child: _createLeftChild(),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 75,
              ),
              if (isLast != true)
                Expanded(
                  child: DashedLine(
                    path: Path()..cubicTo(15, 0, 15, 0, 15, 15),
                    color: colorScheme.onBackground,
                    dashLength: 1,
                    dashSpace: 1,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget secondContainer(double width, ColorScheme colorScheme) {
    return SizedBox(
      width: width,
      height: 150,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: width * 0.75,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(36),
                  ),
                ),
                height: 120,
                child: _createRightChild(),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  if (isLast != true)
                    Expanded(
                      child: Transform.flip(
                        flipX: true,
                        child: DashedLine(
                          path: Path()..cubicTo(15, 0, 15, 0, 15, 15),
                          color: colorScheme.onBackground,
                          dashLength: 1,
                          dashSpace: 1,
                        ),
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

  Widget _createLeftChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(36),
              ),
              child: Image.network(
                lessonEntity.imageUrl!,
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lessonEntity.title ?? 'Lesson title',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  lessonEntity.description ??
                      'Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _createRightChild() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.network(
                  lessonEntity.imageUrl!,
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lessonEntity.title ?? 'Lesson title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    lessonEntity.description ??
                        'Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc Lesson Desc ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
