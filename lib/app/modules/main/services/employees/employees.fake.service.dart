import '../../entities/employee.type.dart';
import 'employees.contract.dart';

class EmployeesFakeService implements IEmployeeService {
  final _employees = <Employee>[
    Employee(
        id: 1,
        estatusEmpleadoId: 1,
        numeroEmpleado: '76576767',
        nombre: 'prueba',
        apellidoPaterno: 'hola',
        apellidoMaterno: 'ksjdhkj',
        fechaNacimiento: DateTime.now(),
        correoPersonal: 'jkhbjhb',
        foto: 'khjblhj'),
    Employee(
        id: 1,
        estatusEmpleadoId: 1,
        numeroEmpleado: '5028927',
        nombre: 'Jose',
        apellidoPaterno: 'Carballido',
        apellidoMaterno: 'González',
        fechaNacimiento: DateTime.now(),
        correoPersonal: 'erasto@hotmail.com',
        foto: 'khjblhj')
  ];

  @override
  Future<List<Employee>> getAll() async {
    return _employees;
  }

  @override
  Future<Employee> getById(int id) async {
    return _employees.firstWhere((element) => element.id == id);
  }
}
