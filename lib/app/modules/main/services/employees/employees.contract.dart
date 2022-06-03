import '../../entities/employee.type.dart';

abstract class IEmployeeService {
  Future<List<Employee>> getAll();
  Future<Employee> getById(int id);
}
