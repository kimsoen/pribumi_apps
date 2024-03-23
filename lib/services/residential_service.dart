import 'package:geolocator/geolocator.dart';
import 'package:pribumi_apps/data/data_resedential.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/services/distance_service.dart';
import 'package:pribumi_apps/services/location_service.dart';

class ResidentialService {
  static Future<List<ResidentialModel>> listWithDistance() async {
    List<ResidentialModel> listResidential = [];

    Position? position = await LocationService.getCurrentPosition();

    if (position != null) {
      for (var residential in DataResidential.listResedential) {
        double result = DistanceService.distanceBetween(position.latitude,
            position.longitude, residential.latitude!, residential.longitude!);

        double distance = result / 1000;

        ResidentialModel data = ResidentialModel(
          name: residential.name,
          address: residential.address,
          distance: distance,
          image: residential.image,
          latitude: residential.latitude,
          longitude: residential.longitude,
        );

        listResidential.add(data);
      }
      return listResidential;
    }

    return listResidential;
  }
}
