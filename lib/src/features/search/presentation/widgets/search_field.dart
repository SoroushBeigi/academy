import 'package:academy/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SearchField extends StatelessWidget {
  const SearchField({required this.autoFocus,required this.enabled,super.key});
  final bool? enabled;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        // Reduced border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        autofocus: true,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).startSearching,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon:
          const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceBright,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0),
        ),
        onChanged: (value) =>
            context.read<SearchCubit>().search(value),
      ),
    );

  }
}
