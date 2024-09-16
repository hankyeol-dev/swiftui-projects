//
//  ButtonList.swift
//  swiftui-releaseproject-playground
//
//  Created by 강한결 on 9/16/24.
//

import SwiftUI

import RealmSwift

struct ButtonList: View {
   @EnvironmentObject private var realmManager: RealmManager
   
   var body: some View {
      NavigationView {
         VStack {
            CustomNavigationBar(action: noneAction, title: "테스트야", icon: "")
            ScrollView {
               NavigationLink {
                  
               } label: {
                  asRoundedButton(title: "주제 생성 테스트")
               }
               
               NavigationLink {
                  PointCreateView()
               } label: {
                  asRoundedButton(title: "포인트 지급 테스트")
               }
               
               NavigationLink {
                  
               } label: {
                  asRoundedButton(title: "스마트 목록 생성 테스트")
               }
               Spacer()
            }
            .padding(.horizontal, 16.0)
         }
      }
   }
   
   private func noneAction() {}
}

struct PointCreateView: View {
   @StateObject private var pointCreateLogic: PointCreateLogic = .init()
   @State private var increaseText: String = ""
   @State private var decreaseText: String = ""
   
   var body: some View {
      Form {
         HStack(alignment: .center) {
            Text("오늘의 사유 동전을 받으세요.")
            Spacer()
            Button {
               do {
                  try pointCreateLogic.addPointRecord(1, pointType: .increase, pointDescript: .todayPoint)
               } catch {
                  print(error)
               }
            } label: {
               asRoundedButton(title: "+")
            }
            .frame(width: 100.0)
            .disabled(pointCreateLogic.isAcquireTodayPoint())
         }
         
         HStack {
            TextField("포인트를 일단 입력해봐", text: $increaseText)
               .onSubmit {
                  if let point = Int(increaseText) {
                     do {
                        try pointCreateLogic.addPointRecord(
                           point,
                           pointType: .increase,
                           pointDescript: .dailySayu)
                     } catch {
                        print(error)
                     }
                  }
               }
         }
         .frame(height: 44.0)
         
         HStack {
            TextField("포인트를 일단 입력해봐", text: $decreaseText)
            Spacer()
            Button {
               if let point = Int(decreaseText) {
                  do {
                     try pointCreateLogic.addPointRecord(
                        point,
                        pointType: .decrease,
                        pointDescript: .boughtSayuBadge)
                  } catch {
                     print(error)
                  }
               }
            } label: {
               asRoundedButton(title: "-")
            }
            .frame(width: 100.0)
         }
         .frame(height: 44.0)
         
         Button {
         } label: {
            asRoundedButton(title: "오늘 획득 여부 확인")
         }
         .frame(height: 44.0)
      }
   }
}

final class PointCreateLogic: ObservableObject {
   @ObservedResults(ThinkPoint.self)
   private var pointObject
   
   @Published var pointText: Int
   
   enum PointErrors: Error {
      case haveNoPoint
      case notEnoughPoint
   }
   
   enum PointDescript: String {
      case todayPoint = "오늘 출석 사유 동전"
      case dailySayu = "오늘의 사유 작성"
      case boughtSayuBadge = "사유 배지 교환"
   }
   
   
   init(
      pointText: Int = 0
   ) {
      self.pointText = pointText
   }
   
   func addPointRecord(_ point: Int, pointType: ThinkPoint.PointType, pointDescript: PointDescript) throws  {
      let currentPoint = getLastRecord()

      switch pointType {
      case .increase:
         if isRecordEmpty() {
            $pointObject.append(.init(point: point, accumulated: point, pointType: 0, descript: pointDescript.rawValue))
         } else {
            $pointObject.append(.init(point: point, accumulated: currentPoint + point, pointType: 0, descript: pointDescript.rawValue))
         }
      case .decrease:
         if isRecordEmpty() {
            throw PointErrors.haveNoPoint
         } else {
            if currentPoint < point {
               throw PointErrors.notEnoughPoint
            } else {
               // 여기서 내역 업데이트
               $pointObject.append(.init(point: point, accumulated: currentPoint - point, pointType: 1, descript: pointDescript.rawValue))
            }
         }
      }
   }
   
   private func isRecordEmpty() -> Bool { return pointObject.isEmpty }
   private func getLastRecord() -> Int {
      if isRecordEmpty() {
         return 0
      } else {
         if let last = pointObject.last {
            return last.accumulated
         } else {
            return 0
         }
      }
   }
   
   func isAcquireTodayPoint() -> Bool {
      let result = pointObject.where { query in
         query.descript == PointDescript.todayPoint.rawValue
      }.filter { Calendar.current.isDateInToday($0.createdAt) }
      return !result.isEmpty
   }
}

#Preview {
   ButtonList()
}
