import '../../core/repository.dart';
import '../entities/business.dart';

typedef BusinessId = String;

abstract class BusinessRepository extends Repository<BusinessId, Business> {}
