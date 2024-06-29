import 'package:academy/src/features/core/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import 'package:academy/src/features/meeting/meeting.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '"meet.google.com/abc-dc1-034"');
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ADD OTHERS", style: Theme.of(context).textTheme.titleMedium),
          Space.h16,
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(IconManager.share, color: Theme.of(context).colorScheme.primary,),
                Space.w16,
                Text(
                  "Share joining information",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Space.h8,
          SizedBox(
            height: AppSize.s60,
            width: MediaQuery.of(context).size.width * 0.4,
            child: ACTextFormField(
              controller: controller,
              hintText: 'Meeting link',
              readOnly: true,
              style: Theme.of(context).textTheme.bodyMedium,
              suffixIcon: Icon(
                IconManager.copy,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Space.h16,
          Text("IN CALL", style: Theme.of(context).textTheme.bodyMedium),
        Space.h16,
          Column(
            children: roomUsers.map((user) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: user.color,
                            child: Center(
                              child: Text(
                                user.name[0],
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: LightColorManager.white),
                              ),
                            ),
                          ),
                          Space.w16,
                          Text(
                            user.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(IconManager.micOff, color: Theme.of(context).colorScheme.primary,),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(IconManager.videoCam, color: Theme.of(context).colorScheme.primary,),
                          ),
                        ],
                      )
                    ],
                  ),
                  Space.h12,
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}