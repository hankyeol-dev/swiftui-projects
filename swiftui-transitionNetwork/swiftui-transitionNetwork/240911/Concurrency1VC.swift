//
//  Concurrency1VC.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/11/24.
//

import UIKit
import SwiftUI

// uiviewrepresentable
// uiviewcontrollerrepresentable
/**
 GCD를 이용해서 코드를 작성할 때 조심해야 할 점 중 하나는 thread explosion입니다. thread explosion이 발생하면 컨텍스트 스위칭(context switching)이 많아지고 성능이 저하될 수 있습니다. 또한, 블록된 스레드가 어떤 자원을 잠그고(lock) 있을 때 데드락을 발생시킬 수도 있습니다.

 즉, thread explosion이 발생하면 너무 많은 스레드 블록에서 유발되는 메모리 오버헤드, 너무 많은 컨텍스트 스위칭에서 유발되는 스케줄링 오버헤드가 발생할 수 있습니다. 이에 따라 thread explosion을 막기 위해 하나의 서브시스템에 하나의 Dispatch Queue 혹은 Dispatch Queue 위계(hierarchy)를 할당하는 것이 권장되고 있습니다. 이는 서로 연관된 작업이 하나의 스레드에서 실행될 수 있게 하는 의도입니다. 이렇게 현재 개발에서 사용되고 있는 GCD의 경우 thread explosion을 예방하는 안전한 코드 작성이 필요합니다.

 반면 Swift Concurrency에서는 보다 편하게 스레드를 관리할 수 있습니다. Swift Concurrency에서 await으로 중단됐을 때, CPU가 컨텍스트 스위칭을 해서 다른 스레드를 불러오는 것이 아니라 같은 스레드에서 다음 함수를 실행시킵니다. 즉, 하나의 코어가 하나의 스레드를 실행하도록 유지하는 것을 보장합니다. 기존에 스레드의 컨텍스트 스위칭으로 진행되던 것이 같은 스레드 내의 함수 호출로 대체되는 것입니다. 
 */

struct Concurrency1VCWrapper: UIViewControllerRepresentable {
   
   typealias UIViewControllerType = Concurrency1VC
   
   func makeUIViewController(context: Context) -> Concurrency1VC {
      return Concurrency1VC()
   }
   
   func updateUIViewController(_ uiViewController: Concurrency1VC, context: Context) {
      // swiftui로 구현한 뷰에서 전달받은 context를 uikit 기반 뷰에 바인딩 시키고 뷰를 업데이트 할 때 활용
   }
}

final class Concurrency1VC: UIViewController {
   
   let image1 = UIImageView()
   let image2 = UIImageView()
   let image3 = UIImageView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.backgroundColor = .gray
      
      [image1, image2, image3].forEach {
         view.addSubview($0)
         $0.backgroundColor = .white
      }
      image1.frame = CGRect(x: 50, y: 50, width: 50, height: 75)
      image2.frame = CGRect(x: 120, y: 50, width: 50, height: 75)
      image3.frame = CGRect(x: 190, y: 50, width: 50, height: 75)
      
//      Concurrency1Manager.requestImage { image in
//         self.image1.image = image
//      }
//      
//      Concurrency1Manager.requestImage { result in
//         DispatchQueue.main.async {
//            switch result {
//            case let .success(image):
//               self.image2.image = image
//            case .failure:
//               self.image2.backgroundColor = .gray.withAlphaComponent(0.5)
//            }
//         }
//      }
      
      Task {
         let imageViews = [image1, image2, image3]
//         do {
//            image3.image = try await Concurrency1Manager.requestImage()
//         } catch {
//            image3.backgroundColor = .gray.withAlphaComponent(0.5)
//         }
         let images = await Concurrency1Manager.requestGroup()
         if images.isEmpty {
            imageViews.forEach { $0.backgroundColor = .gray.withAlphaComponent(0.5) }
         } else {
            imageViews.enumerated().forEach { idx, views in views.image = images[idx] }
         }
      }
   }
   
   private func continuationImages() async -> UIImage? {
      return await withCheckedContinuation { continuation in
         Task {
            do {
               let image = try await Concurrency1Manager.requestImage()
               return continuation.resume(returning: image)
            } catch {
               return continuation.resume(returning: nil)
            }
         }
      }
   }
}
