import 'package:academy/src/features/core/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import 'package:academy/src/features/meeting/meeting.dart';
import '../meeting/widgets/utils/constants.dart';
import '../meeting/widgets/utils/data.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconManager.previous,
            color: Theme.of(context).colorScheme.primary,
          ),
          color: appGrey,
        ),
        title: Text(
          "In-call messages",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                Participant user = getRandomUser();
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p12,
                    horizontal: AppPadding.p16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: user.color,
                        child: Center(
                          child: Text(
                            user.name[0],
                            style: TextStyle(color: LightColorManager.white),
                          ),
                        ),
                      ),
                      Space.w8,
                      // Text(user.name[index],
                      //     style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                        messages[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: ACTextFormField(
              controller: controller,
              hintText: "Send message",
              suffixIcon: Icon(
                IconManager.send,
                color: appGrey.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
