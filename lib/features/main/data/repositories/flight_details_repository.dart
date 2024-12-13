import 'package:golrang_task/core/network/rest_service.dart';
import 'package:golrang_task/features/main/data/models/flight_details_model.dart';
import 'package:golrang_task/features/main/domain/repositories/flight_details_repository_interface.dart';

class FlightDetailsRepository implements FlightDetailsRepositoryInterface {
  FlightDetailsRepository(this.restService);

  final RestService restService;

  @override
  Future<FlightDetailsModel?> getDetails() async {
    var mockData = {
      "flightDetails": {
        "refundPolicy": {
          "50": "از زمان صدور تا 12 ظهر 3 روز قبل از پرواز",
          "60": "از 12 ظهر 3 روز قبل از پرواز تا 12 ظهر 1 روز قبل از پرواز",
          "80": "از 12 ظهر 1 روز قبل از پرواز تا 3 ساعت قبل از پرواز",
          "100": "از 3 ساعت قبل از پرواز تا بعد از پرواز"
        },
        "allowedBaggage": {
          "checkedBaggage": {
            "weight": "20 کیلوگرم",
            "note":
                "برای هر مسافر یک عدد چمدان با وزن حداکثر 20 کیلوگرم مجاز است."
          },
          "carryOnBaggage": {
            "weight": "7 کیلوگرم",
            "dimensions": "55x40x23 سانتی‌متر",
            "note":
                "هر مسافر می‌تواند یک کیف دستی با وزن حداکثر 7 کیلوگرم به کابین ببرد."
          },
          "additionalFees":
              "برای بار اضافی، مبلغ 200,000 تومان به ازای هر کیلوگرم اضافه دریافت می‌شود."
        },
        "flightConditions": {
          "boardingTime":
              "حداقل 2 ساعت قبل از پرواز در فرودگاه حضور داشته باشید.",
          "passportRequirement":
              "همراه داشتن کارت شناسایی معتبر برای پروازهای داخلی الزامی است.",
          "specialServices":
              "خدمات ویژه برای افراد کم‌توان یا سالمندان با هماهنگی قبلی فراهم می‌شود.",
          "cancellationPolicy":
              "لغو پرواز تنها تا 24 ساعت قبل از زمان پرواز ممکن است و هزینه استرداد بر اساس قوانین محاسبه می‌شود."
        }
      }
    };

    FlightDetailsModel flightDetailsModel =
        FlightDetailsModel.fromJson(mockData);

    return flightDetailsModel;
  }
}
