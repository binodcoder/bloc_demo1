import 'package:bloc_demo1/employee.dart';
import 'package:bloc_demo1/employee_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
            stream: _employeeBloc.employeeListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5.0,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text('${snapshot.data[index].id}'),
                              trailing:
                                  Text('Rs.${snapshot.data[index].salary}'),
                              title: Text(snapshot.data[index].name),
                              subtitle: const Text('Developer'),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 70, right: 17),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _employeeBloc.employeeSalaryIncrement
                                          .add(snapshot.data[index]);
                                    },
                                    child: const Text('Treatment'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _employeeBloc.employeeSalaryDecrement
                                          .add(snapshot.data[index]);
                                    },
                                    child: const Text('Diagnosis'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
