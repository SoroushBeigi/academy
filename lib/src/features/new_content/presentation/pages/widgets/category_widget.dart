import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/core/ui_kits/ac_elevated_button/ac_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key, required this.onTagListChanged, required this.categoryMap, required this.allCategoryMap});
  final ValueChanged<Map<String, int>> onTagListChanged;
  final Map<String, int> allCategoryMap;
  final Map<String, int> categoryMap;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  late Map<String, int> newCategoryMap;

  @override
  void initState() {
    newCategoryMap = Map<String, int>.from(widget.categoryMap);
    super.initState();
  }


  void addNewCategory(String category, int id) {
    setState(() {
      newCategoryMap[category] = id;
    });
    widget.onTagListChanged(newCategoryMap);
  }

  void deleteCategory(String category) {
    setState(() {
      newCategoryMap.remove(category);
    });
    widget.onTagListChanged(newCategoryMap);
  }
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context);
    return Wrap(
      spacing: AppSize.s8,
      runSpacing: AppSize.s8,
      children: newCategoryMap.keys.map((item) {
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
                  deleteCategory(item);
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
                showAddCategoryDialog(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(textLocalization.add, style: Theme.of(context).textTheme.bodyMedium),
                  Space.w4,
                  Icon(IconManager.add, color: Theme.of(context).colorScheme.secondary),
                ],
              ),
            ),
          ),
        ),
    );
  }

  void showAddCategoryDialog(BuildContext context) {
    String? selectedKey;
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: StatefulBuilder(
              builder: (BuildContext _, setState) {
                final textLocalization = AppLocalizations.of(context);
                return Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton<String>(
                          hint: Text(
                            textLocalization.selectAnItem,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          value: selectedKey,
                          items: widget.allCategoryMap.keys.map((String key) {
                            return DropdownMenuItem<String>(
                              value: key,
                              child: Text(key),
                            );
                          }).toList(),
                          onChanged: (String? newKey) {
                            setState(() {
                              selectedKey = newKey;
                            });
                          },
                        ),
                        Space.h16,
                        Center(
                          child: ACElevatedButton(
                            backgroundColor: Theme.of(context).colorScheme.onPrimary,
                            onTap: () {
                              if (selectedKey != null) {
                                addNewCategory(selectedKey!, widget.allCategoryMap[selectedKey]!);
                                context.pop();
                              }
                            },
                            child: Text('Add', style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
