//
//  String.swift
//  Mailway
//
//  Created by Cirno MainasuK on 2020-7-1.
//  Copyright © 2020 Dimension. All rights reserved.
//

import Foundation

extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}