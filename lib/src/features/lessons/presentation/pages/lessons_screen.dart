import 'package:academy/src/core/domain/entities/course_entity.dart';
import 'package:academy/src/core/domain/entities/lesson_entity.dart';
import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/src/core/widgets/change_theme_icon.dart';
import 'package:academy/src/features/lessons/presentation/widgets/lessons_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LessonsScreen extends StatelessWidget {
  final CourseEntity courseEntity;

  const LessonsScreen({
    super.key,
    required this.courseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(courseEntity.title ?? ''),
              const ChangeThemeIcon(),
            ],
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.library_books_outlined),
                  SizedBox(
                    width: 2.w,
                  ),
                  const Text('Lessons'),
                ]),
              ),
              Tab(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.more_outlined),
                  SizedBox(
                    width: 2.w,
                  ),
                  const Text('Details'),
                ]),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Lessons section
            _buildLessons()
                .animate()
                .fade(curve: Curves.easeIn, duration: 0.7.seconds),
            //Details section
            _buildDetails()
                .animate()
                .fade(curve: Curves.easeIn, duration: 0.7.seconds),
          ],
        ),
      ),
    );
  }

  Widget _buildLessons() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return LessonsListItem(
            lessonEntity: LessonEntity(imageUrl:AppConstants.imageUrl ),
            index: index,
            isLast: index==9,
          );
        },
        itemCount: 10,
      ),
    );
  }

  Widget _buildDetails() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              courseEntity.imageUrl ?? AppConstants.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 30.h,
            ),
            SizedBox(height: 3.h),
            const Text(
              'In this course, you will learn:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: courseEntity.learningGoals
                      ?.map((e) => Text(e.addBulletPoint() ?? ''))
                      .toList() ??
                  [],
            ),
            SizedBox(height: 3.h),
            const Text(
              'Requirements:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: courseEntity.requierments
                      ?.map((e) => Text(e.addBulletPoint() ?? ''))
                      .toList() ??
                  [],
            ),
          ],
        ));
  }
}
