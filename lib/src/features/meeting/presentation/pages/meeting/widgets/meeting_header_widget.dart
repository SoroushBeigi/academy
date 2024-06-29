import 'package:academy/src/features/meeting/meeting.dart';
class MeetingHeaderWidget extends StatelessWidget {
  const MeetingHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: Icon(IconManager.previous, color: Theme.of(context).colorScheme.primary,),
            ),
            Space.w12,
            Text(
              "abc-dc1-034",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(IconManager.flipCamera, color: Theme.of(context).colorScheme.primary,),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(IconManager.headPhones, color: Theme.of(context).colorScheme.primary,),
            ),
          ],
        )
      ],
    );
  }
}