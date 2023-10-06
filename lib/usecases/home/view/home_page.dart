import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constants/widget_keys.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:flutter_template/usecases/home/bloc/home_bloc.dart';
import 'package:flutter_template/widgets/screens/activist_list_widget.dart';
import 'package:flutter_template/widgets/screens/student_list_widget.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<HomeBloc>()..add(const HomeEvent.started()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            key: const Key(WidgetKeys.homeScaffoldKey),
            appBar: AppBar(
              title: Text(S
                  .of(context)
                  .home),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                GetIt.instance<HomeBloc>().add(
                  HomeEvent.tabChanged(tabIndex: index),
                );
              },
              currentIndex: state.tabIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'Студенты'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.volunteer_activism), label: 'Активисты'),
              ],
            ),
            body: Material(
              child: <Widget>[
                StudentList(
                  students: state.students,
                ),
                ActivistList(students: state.activists),
              ][state.tabIndex],
            ),
          );
        },
      ),
    );
  }
}
