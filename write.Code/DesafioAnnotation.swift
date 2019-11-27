//
//  DesafioAnnotation.swift
//  write.Code
//
//  Created by cdt307 on 11/27/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import MapKit

class DesafioAnnotation: NSObject, MKAnnotation {
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate = CLLocationCoordinate2D(latitude:19.305_765, longitude:  -99.205_030)
    
    var title: String? = NSLocalizedString("HELLO", comment: "Desafio Ejemplo")
}
