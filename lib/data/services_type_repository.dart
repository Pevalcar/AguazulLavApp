import 'package:aguazullavapp/model/models.dart';

class ServiceTypeRepository {
  ServiceTypeRepository();

  List<ServiceInfo> GetServicesData() {
    return _servicios;
  }
}

// enum Servicio { Basico, Eco, Pro, Vip, Otro, None }

List<ServiceInfo> _servicios = [
  const ServiceInfo(
      servicioId: '1',
      nameService: 'Basico',
      description: 'Servicio básico',
      price: '100'),
  const ServiceInfo(
      servicioId: '2',
      nameService: 'Eco',
      description: 'Servicio eco',
      price: '200'),
  const ServiceInfo(
      servicioId: '3',
      nameService: 'Pro',
      description: 'Servicio pro',
      price: '300'),
  const ServiceInfo(
      servicioId: '4',
      nameService: 'Vip',
      description: 'Servicio vip',
      price: '400'),
  const ServiceInfo(
      servicioId: '5',
      nameService: 'Otro',
      description: 'Servicio otro',
      price: '500'),
];
