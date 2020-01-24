//
//  ContentView.swift
//  NoDo
//
//  Created by Paulo Dichone on 7/11/19.
//  Copyright © 2019 BAWP. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    
    //@State var nodoList: [NoDo] = []
    @State var nodoList: [NoDo] = {
        guard let data = UserDefaults.standard.data(forKey: "nodos") else { return [] }
               if let json = try? JSONDecoder().decode([NoDo].self, from: data) {
                   return json
               }
               return []
    }()
    
    @State var showField: Bool = false
    @State var nodoItem = NoDo()
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5) {
                
                    TopView(nodoItem: self.$nodoItem, showField: self.$showField, nodoList: self.$nodoList)
                    
                    
                }
                
                
                List {
                    ForEach(self.nodoList, id: \.name) { item in //Beta 4 update!
                      
                       return NoDoRow(noDoItem: item)
                    }
                        /*make sure to give an id that's actually unique - date, in this case is not unique.  If used, tableview will show the first added item no matter how many items you add to the list!! *** Important to note!
                         */
                        
                        //                    ForEach(self.nodoList.identified(by: \.name)) { item in
                        //                        //print("Inside loop ==> \(item.name)")
                        //                        NoDoRow(noDoItem: item)
                        ////                       NoDoRow(noDoItem: item, timeAgo: self.nodoItem.dateAdded)
                        //                  }
                        .onDelete(perform: deleteItem)
                }
            
                
            }.navigationBarTitle(Text("NoDo"))
            
        
            
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        
        guard let index = Array(offsets).first else {return}
        
        print("Removed: \(self.nodoList[index])")
        
        self.nodoList.remove(at: index)
        
        save()// call save once we delete so that the list current state is saved!
        
        
        
    }
    
    func save() {
           guard let data = try? JSONEncoder().encode(self.nodoList) else { return }
           UserDefaults.standard.set(data, forKey: "nodos")
       }
    
    
    
}









