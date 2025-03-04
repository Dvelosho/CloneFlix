//
//  Extensions.swift
//  ClonFlix
//
//  Created by daniel veloso on 03-03-25.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
