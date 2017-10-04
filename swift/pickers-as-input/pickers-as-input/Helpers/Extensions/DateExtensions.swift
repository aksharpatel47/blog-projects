//
//  DateExtensions.swift
//  pickers-as-input
//
//  Created by Akshar Patel on 02/10/17.
//  Copyright © 2017 Akshar Patel. All rights reserved.
//

import Foundation

extension Date {
  var mediumDateString: String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: self)
  }
}
