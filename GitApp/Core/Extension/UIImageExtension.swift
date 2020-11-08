//
//  UIImageExtension.swift
//  GitApp
//
//  Created by Tiko on 10/31/20.
//

import UIKit

extension UIImage {
    static func setImage(_ urlString: String?) -> UIImage? {
        var setImage = UIImage(named: "rain")
        do {
            if let imageUrl = urlString {
                let url = URL(string: imageUrl)!
                let imageData = try Data(contentsOf: url)
                if let image = UIImage(data: imageData) {
                    setImage = image
                }
            }
        } catch {
            print("Error info: \(error)")
        }
        return setImage
    }
}
