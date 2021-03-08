import SwiftUI

struct HistoryView: View {
    @State var index = 0
    
    var body: some View {
        VStack {
            // Tab view
            HStack(spacing: 0){
                Text("Day")
                    .foregroundColor(index == 0 ? .white : Color(.black).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(.blue).opacity(index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        index = 0
                    }
                
                Spacer(minLength: 0)
                
                Text("Week")
                    .foregroundColor(index == 1 ? .white : Color(.black).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(.blue).opacity(index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        index = 1
                    }
                
                Spacer(minLength: 0)
                
                Text("Month")
                    .foregroundColor(index == 2 ? .white : Color(.black).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(.blue).opacity(index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        index = 2
                    }
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            
            // Dashboard Grid
            
            Spacer(minLength: 0)
        }
        .padding(.top)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
