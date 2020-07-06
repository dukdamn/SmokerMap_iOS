//
//  InfoViewController.swift
//  SmokerMap
//
//  Created by 정의석 on 2020/03/09.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
class InfoViewController: UIViewController {
  let testView: AddSmokingAreaView = AddSmokingAreaView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(testView)
    setAutoLayOut()
  }

  private func setAutoLayOut(){
    let guide = self.view.safeAreaLayoutGuide
    testView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(guide)
      $0.height.equalTo(200)
    }
  }
}
