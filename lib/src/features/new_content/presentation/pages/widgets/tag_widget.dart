import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/core/ui_kits/ac_elevated_button/ac_elevated_button.dart';
import 'package:academy/src/features/core/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TagWidget extends StatefulWidget {
  const TagWidget({super.key, this.tags, required this.onTagListChanged});
  final List<String>? tags;
  final ValueChanged<List<String>> onTagListChanged;

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  late List<String> newTags;

  @override
  void initState() {
    newTags = widget.tags ?? [];
    super.initState();
  }


  void addNewTag(String tag) {
    setState(() {
      newTags.add(tag);
    });
    widget.onTagListChanged(newTags);
  }

  void deleteTag(String tag) {
    setState(() {
      newTags.remove(tag);
    });
    widget.onTagListChanged(newTags);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSize.s8,
      runSpacing: AppSize.s8,
      children: newTags.map((item) {
        return Container(
          padding: const EdgeInsets.all(AppPadding.p6),
          decoration: BoxDecoration(
            border: Border.all(
              width: AppSize.s2,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item, style: Theme.of(context).textTheme.bodyMedium),
              Space.w4,
              InkWell(
                onTap: () {
                  deleteTag(item);
                },
                child: Icon(IconManager.close, color: Theme.of(context).colorScheme.error),
              ),
            ],
          ),
        );
      }).toList()
        ..add(
          Container(
            padding: const EdgeInsets.all(AppPadding.p6),
            decoration: BoxDecoration(
              border: Border.all(
                width: AppSize.s2,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            child: InkWell(
              onTap: () {
                showAddTagDialog(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Add', style: Theme.of(context).textTheme.bodyMedium),
                  Space.w4,
                  Icon(IconManager.add, color: Theme.of(context).colorScheme.secondary),
                ],
              ),
            ),
          ),
        ),
    );
  }
  void showAddTagDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ACTextFormField(
                    controller: controller,
                    hintText: 'Add Tag...',
                  ),
                  Space.h16,
                  ACElevatedButton(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        addNewTag(controller.text);
                        context.pop();
                      }
                    },
                    child: Text('Add', style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
