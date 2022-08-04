import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloctest/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloctest/bloc/internet_bloc/internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Test"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetConnectedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Internet Connected"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("No Internet Connection"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetConnectedState) {
                return const Text("Connected");
              } else if (state is InternetLostState) {
                return const Text("No Internet Connection");
              } else {
                return const Text("Loading.....");
              }
            },
          ),
          // child: BlocBuilder<InternetBloc, InternetState>(
          //   builder: (context, state) {
          //     if (state is InternetConnectedState) {
          //       return const Text("Connected");
          //     } else if (state is InternetLostState) {
          //       return const Text("No Internet Connection");
          //     } else {
          //       return const Text("Loading.....");
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
