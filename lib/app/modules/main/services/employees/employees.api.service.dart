import 'package:jexpoints/app/core/data/entities/request_method.enum.dart';
import 'package:jexpoints/app/core/data/services/base-service.service.dart';
import '../../entities/employee.type.dart';
import 'employees.contract.dart';

class EmployeesApiService extends BaseService implements IEmployeeService {
  EmployeesApiService() : super('Empleados');

  @override
  Future<List<Employee>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Employee> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
