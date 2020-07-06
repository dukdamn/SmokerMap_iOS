//
//  Escaping.swift
//  SmokerMap
//
//  Created by 황정덕 on 2020/03/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

//import Foundation
//func practice3(completion:  @escaping (_ count: Int) -> ()) {
//    let url = "https://jsonplaceholder.typicode.com/posts"
//    let apiURL = URL(string: url)!
//    var users: Array<Post> = []
//    var count = 0
//    let dataTask = URLSession.shared.dataTask(with: apiURL) {(data, response, error) in
//        guard error == nil else { return print(error!) }
//        guard let response = response as? HTTPURLResponse,
//            (200..<400).contains(response.statusCode)
//            else { return print("Invalid response") }
//        guard let data = data else { return print("wrong data") }
//        if let jsonData = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]] {
//            for json in jsonData {
//                if let userId = json["userId"] as? Int,
//                    let id = json["id"] as? Int,
//                    let title = json["title"] as? String,
//                    let body = json["body"] as? String {
//                    let user = Post(userId: userId, id: id, title: title, body: body)
//                    users.append(user)
//                    count = users.count
//                }
//            }
//            completion(count)
//        }
//    }
//    dataTask.resume()
//    //    print(count)
//}
//practice3() {
// nextfunction()
//}
