abstract class INavigationService {
  Future<void> pushNamed(String path, {Object data});
  Future<void> pushNamedAndClear(String path, {Object data});
  Future<void> pop();
}
