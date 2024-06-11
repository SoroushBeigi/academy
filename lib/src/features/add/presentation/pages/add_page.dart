import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
import 'package:academy/src/features/add/presentation/pages/widgets/camera_widget.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = getIt<AddCubit>();
        bloc.cameraVoid();
        return bloc;
      },
      child: BlocBuilder<AddCubit,AddState>(
        builder: (context, state) {
          return state.whenOrNull(
            loading: (progress) => const ACLoading(),
            success: () => CameraWidget(cameras: context.read<AddCubit>().cameras)
          ) ?? const SizedBox.shrink();
        },
      ),
    );
  }
}

