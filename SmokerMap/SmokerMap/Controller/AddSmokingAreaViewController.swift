//
//  AddSmokingAreaViewController.swift
//  SmokerMap
//
//  Created by 정의석 on 2020/03/09.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class AddSmokingAreaViewController: UIViewController {
  
  let uid = Auth.auth().currentUser?.uid
  let ref = Database.database().reference()
  var smokingArea: SmokingArea!
  
  let view1 = TagButtonView()
  var areaLat: Double = 0
  var areaLng: Double = 0
  let textField = UITextField()
  override func viewDidLoad() {
    super.viewDidLoad()
    textField.delegate = self
    textField.becomeFirstResponder()
    textField.placeholder = "장소~....."
    print(areaLat,areaLng)
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(didTabBackButton(_:)))
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(didTabInstarButton(_:)))
    self.view.addSubview(textField)
    self.view.addSubview(view1)
    
  }
  func setConfig(lat: Double, lng: Double ){
    areaLat = lat
    areaLng = lng
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let guide = self.view.safeAreaLayoutGuide
    view1.snp.makeConstraints {
      $0.trailing.leading.equalTo(guide)
      $0.height.equalTo(400)
      $0.top.equalTo(textField.snp.bottom)
    }
    
    textField.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(30)
      $0.trailing.equalToSuperview().offset(-30)
      $0.top.equalTo(guide.snp.top).offset(30)
    }
  }
  
  // MARK: - objc Func
  @objc private func didTabInstarButton(_ sender: UIButton) {
    print("instar 버튼 클릭")
    print(textField.text ?? "입력하지않음"  )
    print(areaLat,areaLng)
    
    let value = ["name": textField.text ?? "없음",
                 "lat": areaLat,
                 "lng": areaLng,
                 "isInside": false,
                 "roof": false,
                 "bench": false,
                 "open": false,
                 "spaceSzie": "SpaceSize.medium",
                 "memo": "String",
    ] as [String: Any]
    let randomNum = Array(1...10000000).randomElement()
    
    ref.child("SmokingArea").child(String(randomNum!)).setValue(value) {  err, raf in
      if err == nil {
        print("성공")
      } else {
        print("실패")
      }
    }
    dismiss(animated: true)
  }
  
  
  @objc private func didTabBackButton(_ sender: UIButton) {
    print("backButtonClick")
    dismiss(animated: true)
  }
}

extension AddSmokingAreaViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.endEditing(true)
    return true
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if textField.text != "" {
      return true
    } else {
      textField.attributedPlaceholder = NSAttributedString(string: "내용을 입력하지 않음", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
      return false
    }
  }
}
