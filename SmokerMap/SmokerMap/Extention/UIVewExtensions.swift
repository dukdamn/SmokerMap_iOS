//
//  UIVewExtensions.swift
//  SmokerMap
//
//  Created by 황정덕 on 2020/03/10.
//  Copyright © 2020 pandaman. All rights reserved.
//
import UIKit

extension UIView {
  func shadow() {
    self.layer.shadowRadius = 8.0
    self.layer.shadowOpacity = 0.5
    self.layer.shadowOffset = .zero
    self.layer.shadowColor = UIColor.darkGray.cgColor
  }
  
  func unShadow() {
    self.layer.shadowRadius = 0
    self.layer.shadowOpacity = 0
    self.layer.shadowOffset = .zero
    self.layer.shadowColor = UIColor.clear.cgColor
  }
}
