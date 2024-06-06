import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        return AddCubit();
      },
      child: const _AddScreen()
    );
  }
}

class _AddScreen extends StatefulWidget {
  const _AddScreen({super.key});

  @override
  State<_AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<_AddScreen> {
  @override
  void initState() {
    context.read<AddCubit>().getFile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Add Screen'),
      ],
    );
  }
}

