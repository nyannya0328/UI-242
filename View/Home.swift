//
//  Home.swift
//  UI-242
//
//  Created by にゃんにゃん丸 on 2021/06/20.
//

import SwiftUI
import SpriteKit

struct Home: View {
    @State var selected : Trip = trips[0]
    var body: some View {
        ZStack{
            
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in:.global)
                
                Image(selected.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
                SpriteView(scene: RainFall(),options: [.allowsTransparency])
                
                
                
            }
            .ignoresSafeArea()
          
            
            
            VStack{
                
                Text("TRIP")
                    .font(.custom("Limelight-Regular", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .kerning(1.5)
                
                
                Text("I want go to\nyankee and city")
                    .font(.custom("Limelight-Regular", size: 15))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .kerning(1.5)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10.0)
                    .padding(.top,3)
                
                GeometryReader{proxy in
                    
                    let frame = proxy.frame(in:.global)
                    VStack{
                        
                        
                        TabView(selection:$selected){
                            
                            
                            ForEach(trips){trip in
                                
                                
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width - 100, height: frame.height - 100)
                                    .cornerRadius(4)
                                    .tag(trip)
                                
                                
                            }
                            
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        Text(selected.title)
                            .font(.custom("Limelight-Regular", size: 15))
                            .foregroundColor(.red)
                            .padding(.bottom,20)
                        
                        
                        PageController(currentpage: getIndex(), maxPage: trips.count)
                        
                        
                    }
                    .padding(.horizontal,20)
                    .background(Color.white.clipShape(CustomShape()))
                   
                    
                    
                    
                    
                    
                    
                }
                .frame(height: UIScreen.main.bounds.height / 2.1)
                
                
                  
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("START")
                        .font(.custom("Limelight-Regular", size: 30))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: .init(colors: [.red,.orange,.purple]), startPoint: .leading, endPoint: .trailing)
                        
                        
                        )
                        .cornerRadius(20)
                        
                    
                })
                .padding(.top)
                
                   
                    
                
                
            }
            .padding()
            
        }
    }
    
    func getIndex()->Int{
        
        let index = trips.firstIndex { trip in
            
            selected.id == trip.id
        } ?? 0
        
        return index
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

class RainFall : SKScene{
    
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
       
        anchorPoint = CGPoint(x: 0.5, y: 1)
        backgroundColor = .clear
        
        let node = SKCropNode(fileNamed: "MyParticle.sks")!
        addChild(node)
       
        
    }
    
}



struct PageController : UIViewRepresentable {
    
    var currentpage : Int
    var maxPage : Int
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.backgroundStyle = .minimal
        view.numberOfPages = maxPage
        view.currentPage = currentpage
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        
        uiView.currentPage = currentpage
    }
}


struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let width = rect.width / 2
            
            path.addLine(to: CGPoint(x: width - 80, y: rect.height))
            path.addLine(to: CGPoint(x: width - 75, y:rect.height - 25))
            path.addLine(to: CGPoint(x: width + 70, y:rect.height - 25))
            path.addLine(to: CGPoint(x: width + 80, y:rect.height))
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
            
            
        }
    }
}
