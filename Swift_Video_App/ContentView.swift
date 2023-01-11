//
//  ContentView.swift
//  swiftuidev
//
//  Created by Cairocoders
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                if UIDevice.current.orientation.isLandscape {
                    Color.black
                }
                
                VStack {
                    player().frame(height: UIDevice.current.orientation.isLandscape ? geo.size.height : geo.size.height / 3)
                        .edgesIgnoringSafeArea(.all)
                    
                    if !UIDevice.current.orientation.isLandscape {
                        Main()
                    }
                        
                        
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct player : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        
        let player1 = AVPlayer(url: URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4")!)
        
        let controller = AVPlayerViewController()
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController : AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
        
    }
}

struct Main : View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                subscriber()
                
                ForEach(1..<5){i in
                    
                    VideoCard(image: "\(i)", name: "Pinoy Food Recipes \(i)")
                }
            }
        }.padding(10)
        

    }
}

struct subscriber : View {
    var body: some View {
        
        HStack {
            Image("photo1")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            
            VStack (alignment: .leading, content: {
                Text("Cairocoders")
                    .fontWeight(.heavy).fixedSize()
                Text("5869 Subscribers")
                    .fixedSize()
            })
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Subscribe").fontWeight(.heavy)
            }.foregroundColor(.red)
        }
    }
}

struct VideoCard : View {
    
    var image = ""
    var name = ""
    
    var body: some View {
        
        HStack {
            Image(image).resizable().frame(width: 120, height: 80)
            
            VStack(alignment: .leading, content: {
                Text(name).fontWeight(.heavy)
                Text("Cairocoders")
                Text("5689 View")
            }).frame(width: UIScreen.main.bounds.width - 170, alignment: .leading)
            
            VStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "list.dash").resizable().frame(width: 15, height: 15).foregroundColor(.black)
                    Spacer()
                }.padding(.top, 5)
            }
        }
    }
}
