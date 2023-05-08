import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_check/bloc/check_connection_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CheckConnectionBloc, CheckConnectionState>(
              builder: (context, state) {
                if (state is CheckConnectionStatus) {
                  return Text(state.message);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CheckConnectionBloc>(context)
                    .add(CheckConEvent());
              },
              child: const Text(
                "check con",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
