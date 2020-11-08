//
//  StringExtension.swift
//  GitApp
//
//  Created by Tiko on 11/3/20.
//

import Foundation

extension String {
    func maxCharacters(length: Int) -> String? {
        var text = self
        let nsString = text as NSString
        if nsString.length >= length {
            text = nsString.substring(with: NSRange(location: 0, length: nsString.length > length ? length : nsString.length))
            return  "\(text)..."
        } else {
            return  text
        }
    }
}
