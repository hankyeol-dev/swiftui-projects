//
//  Concurrency1Manager.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/11/24.
//

import UIKit

struct Concurrency1Manager {
   static private let urls = "https://picsum.photos/200/300"
   static let shared = URLSession.shared
   
   enum Concurrency1ManagerError: Error {
      case invalidURL
      case invalidResponse
      case noImage
      case somthingWrong
   }
   
   /// completionHandler version
   static func requestImage(_ completionHanlder: @escaping (UIImage) -> Void) {
      DispatchQueue.global().async {
         if let url = URL(string: urls) {
            do {
               let data = try Data(contentsOf: url, options: [.alwaysMapped])
               if let image = UIImage(data: data) {
                  DispatchQueue.main.async {
                     completionHanlder(image)
                  }
               }
            } catch {
               
            }
         }
      }
   }
   
   /// resultType + URLSession
   static func requestImage(
      _ completion: @escaping (Result<UIImage, Concurrency1ManagerError>) -> Void) {
         guard let url = URL(string: urls) else {
            completion(.failure(.invalidURL))
            return
         }
         
         let request = URLRequest(url: url,
                                  cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                  timeoutInterval: 5)
         
         URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data else {
               completion(.failure(.noImage))
               return
            }
            
            guard error == nil else {
               completion(.failure(.invalidResponse))
               return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
               completion(.failure(.invalidResponse))
               return
            }
            
            guard let image = UIImage(data: data) else {
               completion(.failure(.noImage))
               return
            }
            
            completion(.success(image))
            
         }.resume()
      }
   
   /// swift concurrency
   static func requestImage() async throws -> UIImage {
      guard let url = URL(string: urls) else {
         throw Concurrency1ManagerError.invalidURL
      }
      
      let request = URLRequest(url: url,
                               cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                               timeoutInterval: 5)
      
      do {
         let (data, response) = try await URLSession.shared.data(for: request)
                  
         if let res = response as? HTTPURLResponse, (200..<300).contains(res.statusCode) {
            if let image = UIImage(data: data) {
               return image
            } else {
               throw Concurrency1ManagerError.noImage
            }
         }
         
         throw Concurrency1ManagerError.invalidResponse
         
      } catch {
         throw Concurrency1ManagerError.somthingWrong
      }
   }
   
   /// swift concurrency async let
   static func requestGroup() async -> [UIImage] {
      async let result = requestImage()
      async let result2 = requestImage()
      
      do {
         return try await [result, result2]
      } catch {
         return []
      }
   }
}
