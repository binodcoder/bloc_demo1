/*
TODO1:Imports
TODO2:List of Employees
TODO3:Stream Controllers
TODO4:Stream Sink Getters
TODO5:Constructor-add data,listen to changes
TODO6:Core Functions
TODO7:Dispose
*/
//imports
import 'employee.dart';
import 'dart:async';

//list of employees
class EmployeeBloc {
  final List<Employee> _employeeList = [
    Employee(1, "Binod Bhandari", 30000.0),
    Employee(2, "Ramesh Bhandari", 20000.0),
    Employee(3, "Siva Bhandari", 10000.0),
    Employee(4, "Ganesh Bhandari", 5000.0),
  ];

//streams controllers
  final _employeeListStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

//getters
  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  //constructors and listen to changes
  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }
  //core functions
  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  //dispose
  void dispose() {
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
  }
}
