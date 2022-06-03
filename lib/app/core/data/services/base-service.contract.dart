abstract class IBaseService {
  Future<String> get<T>(String urlComplement);
  Future<String> post(Object item, {String urlComplement = ''});
  Future<String> delete(int id);
}
