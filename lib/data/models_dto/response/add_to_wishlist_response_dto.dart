
import '../../../domain/entities/add_to_wishlist_response_entity.dart';

class AddToWishListResponseDTO extends AddToWishListResponseEntity {
  String? status;
  String? statusMsg;

  AddToWishListResponseDTO(
      {this.status, this.statusMsg, super.message, super.data});

  AddToWishListResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      data = json["data"] == null ? null : List<String>.from(json["data"]);
    }
  }
}
