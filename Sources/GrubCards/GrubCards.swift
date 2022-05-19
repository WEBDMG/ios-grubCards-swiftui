//
//  GrubCards.swift
//
//
//  Created by Richard Robinson on 5/19/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct GrubCards: View {
    public init(card: Card) {
        self.card = card
    }
    public var card:Card
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(.systemBackground))
            VStack(alignment: .leading){
                switch UIDevice.current.userInterfaceIdiom {
                case .pad:
                    // It's an iPad (or macOS Catalyst)
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fill).cornerRadius(10, corners: [.topLeft, .topRight])
                case .unspecified:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                case .phone:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                case .tv:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fill).cornerRadius(10, corners: [.topLeft, .topRight])
                case .carPlay:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                case .mac:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fill).cornerRadius(10, corners: [.topLeft, .topRight])
                @unknown default:
                    // Uh, oh! What could it be?
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                }
                
                VStack(alignment: .leading){
                    Text(card.title).font(.largeTitle).fontWeight(.bold)
                    HStack{
                        Image("FoodTypeIcon", bundle: Bundle.module)
                            .resizable()
                            .frame(width:15, height: 15)
                            .aspectRatio(contentMode: .fill)
                        Text(card.cuisine)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                    Divider()
                    Text(card.description)
                        .font(.title3)
                        .fontWeight(.regular)
                        .padding(.vertical)
                }.padding()
            }
        }.frame( minHeight:300)
    }
}

/// Single Card View
public struct GathrCard: View {
    public init(card: Card) {
        self.card = card
    }
    
    public var card:Card
    public var body: some View {
        GrubCards(card: card)
            .padding(.horizontal)
    }
}

struct GathrCards_Previews: PreviewProvider {
    static var previews: some View {
        GrubCards(card: CardTestData)
    }
}

struct GathrCard_Previews: PreviewProvider {
    static var previews: some View {
        GrubCards(card: CardTestData).preferredColorScheme(.dark)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension Image {
    init(packageResource name: String, ofType type: String) {
        #if canImport(UIKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(uiImage: image)
        #elseif canImport(AppKit)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = NSImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(nsImage: image)
        #else
        self.init(name)
        #endif
    }
}
