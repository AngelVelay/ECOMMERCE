import 'package:get/get.dart';
import '../../entities/employee.type.dart';
import '../../services/employees/employees.contract.dart';

class TstController extends GetxController {
  final IEmployeeService _repo;
  var isLoading = false.obs;
  var employeeList = <Employee>[].obs;

  Employee? currentEmployee = Employee(
      id: 0,
      estatusEmpleadoId: 0,
      numeroEmpleado: 'numeroEmpleado',
      nombre: 'nombre',
      apellidoPaterno: 'apellidoPaterno',
      apellidoMaterno: 'apellidoMaterno',
      fechaNacimiento: DateTime.now(),
      correoPersonal: 'correoPersonal',
      foto: 'foto');

  TstController(this._repo);

  @override
  void onInit() {
    getEmployees();
    super.onInit();
  }

  void getEmployees() async {
    try {
      print('obteniendo');

      isLoading.value = true;
      var employees = await _repo.getAll();
      if (employees.isEmpty == false) {
        employeeList.value = employees;
      }
    } finally {
      print('termine');
      isLoading.value = false;
    }
  }

  void selectEmployee(Employee employee) async {
    currentEmployee = await _repo.getById(employee.id);
  }
}
