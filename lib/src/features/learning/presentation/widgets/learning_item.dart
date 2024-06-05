import 'package:academy/src/core/domain/entities/course_entity.dart';
import 'package:academy/src/core/resources/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LearningItem extends StatelessWidget {
  const LearningItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final mockEntity = CourseEntity(
      id: '1',
      description: 'description' * 10,
      learningGoals: [
        'first learning goal goal goal goal',
        'second learning goal goal goal goal',
        'third learning goal goal goal goal goal',
      ],
      requierments: [
        'first requirement requirement ',
        'second requirement requirement requirement',
        'third requirement  requirement',
      ],
      title: 'First Course on blabla',
      imageUrl: AppConstants.imageUrl,
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      height: 20.h,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 8,
                        lineWidth: 8,
                        percent: 0.25,
                        progressColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 3.w),
                      const Text('25% completed'),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.network(
                      AppConstants.imageUrl,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      const Expanded(child: Text('Title of the first chapter')),
                      ElevatedButton(
                          onPressed: () => context.push(
                                '/lessons/$title',
                                extra: mockEntity,
                              ),
                          child: const Text('Continue learning')),
                      const SizedBox(height: 8),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
