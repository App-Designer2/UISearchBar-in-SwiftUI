//
//  ContentView.swift
//  SearchBar
//
//  Created by App-Designer2 . on 23.08.19.
//  Copyright © 2019 App-Designer2 . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
     var names = ["room15","room16","room17","room18","room19","room20","room3","room4","room5","room6","room7","room21","room9","room10","room11","room12","room13","room14"]
    
    var living: Livingroom
    
    @State private var searchItem: String = ""
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var now = Date()
    var body: some View {
        NavigationView {
            List {
                
                ScrllView()
                SearchsBar(text: $searchItem)
                ForEach(names.filter {
                    searchItem.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchItem)
                }, id: \.self) { User in
                    NavigationLink(destination: Image(User).resizable().aspectRatio(contentMode: .fit)) {
                        VStack(alignment: .leading,spacing: 10) {
                    HStack {
                        Image(User)
                        .resizable()
                            .frame(width: 390, height: 220)
                            //.aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            
                            Spacer()
                            Text("0").foregroundColor(.secondary)
                            Image(systemName: "bubble.left.fill")
                            .foregroundColor(.gray)
                        }
                        Text("\(self.now,formatter: Self.dateFormatter)").foregroundColor(.secondary)
                            .font(.caption)
                        
                        Text("Nürnberg Views: Charming, naturally well-lit 3 bedroom 2 bathroom apartment in Old Town neighborhood. Close to the red line, shops and nightlife on Well '92s Street, and walking distance to the Whole Foods").foregroundColor(.gray)
                    }
                    }
                }
            }.navigationBarTitle(Text("Livingrooms"))
                .navigationBarItems(trailing: Button(action: {print("Sended")}) {
                        HStack {
                        
                    Image(systemName: "tv").accentColor(.white)
                            
                            Button(action: {print("Sended")}) {
                                    HStack {
                                        
                                Image(systemName: "paperplane")
                                        .accentColor(.white)
                                }
                            }
                    }
                })
            
                .contextMenu {
                    Button(action: {print("Sended")}) {
                        HStack {
                            Text("Send")
                    Image(systemName: "paperplane")
                    }
                }
                    Button(action: {print("Mark as favorite")}) {
                        HStack {
                            Text("Mark as favorite")
                    Image(systemName: "star.fill")
                    }
                    
                    }
            }
        }.colorScheme(.dark)
    }
}

struct ScrllView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                VStack {
                    Image("room15").resizable()
                        .frame(width: 60, height: 60)
                    .cornerRadius(5)
                    Text("Living Room").font(.caption)
                }
                VStack {
                    Image("room16").resizable()
                        .frame(width: 60, height: 60)
                    .cornerRadius(5)
                    Text("Amazing").font(.caption)
                }
                VStack {
                    Image("room17").resizable()
                        .frame(width: 60, height: 60)
                    .cornerRadius(5)
                    Text("Relax").font(.caption)
                }
                
                VStack {
                    Image("room14").resizable()
                        .frame(width: 60, height: 60)
                    .cornerRadius(5)
                    Text("Comfortable").font(.caption)
                }
                
                VStack {
                    Image("room4").resizable()
                        .frame(width: 60, height: 60)
                    .cornerRadius(5)
                    Text("Familiar").font(.caption)
                }
                VStack {
                    Image("room26").resizable()
                        .frame(width: 60, height: 60)
                    .cornerRadius(5)
                    Text("Comodidad").font(.caption)
                }
            }
        }
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(living: livingData[0])
    }
}
#endif
