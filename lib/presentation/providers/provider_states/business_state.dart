import '../../../core/failure.dart';
import '../../../domain/entities/business.dart';

abstract class BusinessState {
  const BusinessState();
}

class BusinessLoading extends BusinessState {
  const BusinessLoading();
}

class BusinessData extends BusinessState {
  const BusinessData(this.businesses);
  final Iterable<Business> businesses;
}

class BusinessEmpty extends BusinessState {
  const BusinessEmpty({this.businesses = const []});
  final Iterable<Business> businesses;
}

class BusinessError extends BusinessState {
  const BusinessError(this.failure);
  final Failure failure;
}
