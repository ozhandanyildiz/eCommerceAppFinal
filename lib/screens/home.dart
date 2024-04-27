import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/card/card_cubit.dart';
import 'package:flutter_advanced_dev/bloc/client/client_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_advanced_dev/core/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClientCubit clientCubit;
  late CardCubit cardCubit;

  bool type2 = true;
  bool type3 = true;
  bool type4 = true;
  bool type5 = true;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
    cardCubit = context.read<CardCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).getTranslate("settings")),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  clientCubit.changeLanguage(
                      language:
                          clientCubit.state.language == "tr" ? "en" : "tr");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.language,
                    size: 32,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  clientCubit.changeDarkMode(
                      darkMode: !clientCubit.state.darkmode);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    clientCubit.state.darkmode
                        ? Icons.wb_sunny
                        : Icons.nights_stay,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => GoRouter.of(context).push("/products"),
                    child: Text(
                        AppLocalizations.of(context).getTranslate("products")),
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)
                          .getTranslate("enable-all")),
                      Switch(
                        activeTrackColor: Color.fromARGB(255, 255, 115, 102),
                        value: type2,
                        onChanged: (value) => setState(() => type2 = value),
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)
                          .getTranslate("social-notifications")),
                      Switch(
                        activeTrackColor: Color.fromARGB(255, 255, 115, 102),
                        value: type3,
                        onChanged: (value) => setState(() => type3 = value),
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)
                          .getTranslate("promos-and-offers")),
                      Switch(
                        activeTrackColor: Color.fromARGB(255, 255, 115, 102),
                        value: type4,
                        onChanged: (value) => setState(() => type4 = value),
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)
                          .getTranslate("order-and-purchase")),
                      Switch(
                        activeTrackColor: Color.fromARGB(255, 255, 115, 102),
                        value: type5,
                        onChanged: (value) => setState(() => type5 = value),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
