
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';

abstract class IBranchService{

Future<List<Branch>> getAll();

Future<Branch> getById(int id);

}