import UIKit
import MapKit

enum AttractionType: Int {
  case misc = 0
  case ride
  case food
  case firstAid
  
  func image() -> UIImage {
    switch self {
    case .misc:
      return #imageLiteral(resourceName: "Halk")
    case .ride:
      return #imageLiteral(resourceName: "Jack")
    case .food:
      return #imageLiteral(resourceName: "Carita peluda")
    case .firstAid:
      return #imageLiteral(resourceName: "Ojito")
    }
  }
}

class AttractionAnnotation: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D
  var title: String?
  var subtitle: String?
  var type: AttractionType
  
  init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, type: AttractionType) {
    self.coordinate = coordinate
    self.title = title
    self.subtitle = subtitle
    self.type = type
  }
}
