//
//  TopView.swift
//  Weather-Test-B4
//
//  Created by Paulo Dichone on 7/17/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import SwiftUI

struct TopView: View {

    @Binding var nodoItem: NoDo
    @State var placeHolder = "Enter Item"
    @Binding var showField: Bool
   // @Binding var nodoList: [NoDo]
    
    @Binding var nodoList: [NoDo] 
//    @State var temp = "nope"
//    @State var goNext:Bool = false
    
    
    var body: some View {
        
        ZStack {
            ZStack(alignment: .leading) {
                
                TextField(self.placeHolder, text:  self.$nodoItem.name){
                  
//                     print("Before DAta --> \(self.nodoList)")
                    self.nodoList.insert(NoDo(name: self.nodoItem.name, dateAdded: self.formatDate(Date()), isDone: false), at: 0)
                    
                    self.save()
                    
//                    print("DAta --> \(self.nodoList)")
                    
                  
                    self.nodoItem.name = "" //clear field
                    
                    }
                    .padding(.all, 10)
                    .frame(width: UIScreen.main.bounds.width - 50 , height: 50 )
                    .background(Color("lightBlue"))
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .shadow(color: Color("accentShadow"), radius: 10, x: 0, y: 10)
                    .offset(x: self.showField ? 0  : (-UIScreen.main.bounds.width / 2  - 180))
                    .animation(.spring())
                
                
        
                    Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                    .offset(x: self.showField ? (UIScreen.main.bounds.width - 90) : -30)
                    .animation(.spring())
                    .onTapGesture {
                        self.showField.toggle()
                        // self.showView.toggle()
                }
                
                
                
                }.padding(.bottom, 20)
                .padding(.leading, 2)
   
        }
        
    }
    
    func save() {
           guard let data = try? JSONEncoder().encode(self.nodoList) else { return }
           UserDefaults.standard.set(data, forKey: "nodos")
       }
    func formatDate(_ date: Date) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        return dateFormatter.string(from: date)
        
    }
    func timeAgoSinceDate(_ date:Date, numericDates:Bool = false) -> String {
          
          //source: https://gist.github.com/minorbug/468790060810e0d29545
          
          let calendar = NSCalendar.current
          let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
          let now = Date()
          let earliest = now < date ? now : date
          let latest = (earliest == now) ? date : now
          let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
          
          if (components.year! >= 2) {
              return "\(components.year!) years ago"
          } else if (components.year! >= 1){
              if (numericDates){
                  return "1 year ago"
              } else {
                  return "Last year"
              }
          } else if (components.month! >= 2) {
              return "\(components.month!) months ago"
          } else if (components.month! >= 1){
              if (numericDates){
                  return "1 month ago"
              } else {
                  return "Last month"
              }
          } else if (components.weekOfYear! >= 2) {
              return "\(components.weekOfYear!) weeks ago"
          } else if (components.weekOfYear! >= 1){
              if (numericDates){
                  return "1 week ago"
              } else {
                  return "Last week"
              }
          } else if (components.day! >= 2) {
              return "\(components.day!) days ago"
          } else if (components.day! >= 1){
              if (numericDates){
                  return "1 day ago"
              } else {
                  return "Yesterday"
              }
          } else if (components.hour! >= 2) {
              return "\(components.hour!) hours ago"
          } else if (components.hour! >= 1){
              if (numericDates){
                  return "1 hour ago"
              } else {
                  return "An hour ago"
              }
          } else if (components.minute! >= 2) {
              return "\(components.minute!) minutes ago"
          } else if (components.minute! >= 1){
              if (numericDates){
                  return "1 minute ago"
              } else {
                  return "A minute ago"
              }
          } else if (components.second! >= 3) {
              return "\(components.second!) seconds ago"
          } else {
              return "Just now"
          }
          
      }
}
