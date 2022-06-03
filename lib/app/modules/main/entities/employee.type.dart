// import 'dart:convert';

// List<Employee> employeeFromJson(String str) =>
//     List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

// String employeeToJson(List<Employee> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    required this.id,
    required this.estatusEmpleadoId,
    required this.numeroEmpleado,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.fechaNacimiento,
    required this.correoPersonal,
    required this.foto,
  });

  int id;
  int estatusEmpleadoId;
  String numeroEmpleado;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  DateTime fechaNacimiento;
  String correoPersonal;
  String foto;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        estatusEmpleadoId: json["estatusEmpleadoId"],
        numeroEmpleado: json["numeroEmpleado"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        correoPersonal: json["correoPersonal"],
        foto: json["foto"] == null ? "" : json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estatusEmpleadoId": estatusEmpleadoId,
        "numeroEmpleado": numeroEmpleado,
        "nombre": nombre,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "correoPersonal": correoPersonal,
        "foto": foto,
      };
}
