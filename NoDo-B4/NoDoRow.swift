import SwiftUI

struct NoDoRow: View {
    
  
    
    @State var noDoItem: NoDo
  
    var body: some View {
        
        VStack(alignment: .center, spacing: 2) {
            
            Group {
                HStack {
                    Text(self.noDoItem.name)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Image(systemName: (self.noDoItem.isDone) ? "checkmark" : "square") //checkmark
                        .padding()
                    
                }
                
                HStack(alignment: .center, spacing: 3) {
                    Spacer()
                    
                    Text("Added : \(self.noDoItem.dateAdded)")
                        .foregroundColor(.white)
                        .italic()
                        .padding(.all, 4)
                    
                    
                }.padding(.bottom, 5)
            }.padding(.all, 4)
            
        }.opacity((self.noDoItem.isDone) ? 0.3 : 1)
            .background((self.noDoItem.isDone) ? Color.gray : Color.pink)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .onTapGesture {
                
                self.noDoItem.isDone.toggle()
                print("Tapped! \(self.noDoItem.isDone)")
                
        }
        
        
        
    }
    
    
}

