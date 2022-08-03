

import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/main/services/branch/branch.contract.dart';

class BranchFakesService implements IBranchService{

  final _branch =<Branch>[

    Branch(
        id:1,
        externalCode: "201", 
        externalId: 1, 
        name: "Radames Gaxiola", 
        isActive: true, 
        isBySystem: false,
        description:"Panificadora La Esperanza, S.A. de C.V."
      ),
      Branch(
        id:2,
        externalCode: "202", 
        externalId: 1, 
        name: "Barrio Santa Barbara", 
        isActive: true, 
        isBySystem: false,
        description:"Panificadora La Esperanza, S.A. de C.V."
      ),
      Branch(
        id:3,
        externalCode: "203", 
        externalId: 1, 
        name: "Barrio la Asuncion", 
        isActive: true, 
        isBySystem: false,
        description:"Panificadora La Esperanza, S.A. de C.V."
      ),
      Branch(
        id:4,
        externalCode: "204", 
        externalId: 1, 
        name: "Gustavo Baz", 
        isActive: true, 
        isBySystem: false,
        description:"Panificadora La Esperanza, S.A. de C.V."
      ),
      Branch(
        id:5,
        externalCode: "205", 
        externalId: 1, 
        name: "Heroes de Churubusco", 
        isActive: true, 
        isBySystem: false,
        description:"Panificadora La Esperanza, S.A. de C.V."
      ),


  ];
  
  @override
  Future<List<Branch>> getAll() async{
    return _branch;
  }
  
  @override
  Future<Branch> getById(int id) async{
   return _branch.firstWhere((x) => x.id== id);
  }









}