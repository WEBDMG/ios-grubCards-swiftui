//
//  Card.swift
//  
//
//  Created by Richard Robinson on 5/19/22.
//

import Foundation

public struct Card:Identifiable, Codable {
    public var id = UUID()
    public var title: String
    public var cuisine: String
    public var description: String
    public var image:String
    public var active:Bool
    
    public enum CodingKeys: String, CodingKey {
        case title = "title"
        case cuisine = "caption"
        case description = "body"
        case image = "image"
        case active = "true"
    }
}

public let CardTestData =
Card( title: "Grub Truck", cuisine: "American Asian Fusion", description: "My mom’s famous family recipes for your family to enjoy! 🍔🌭🥙 A food truck is a large vehicle with a kitchen to make and serve food. They are popping up across the United States and are becoming increasingly popular. Many entrepreneurs opt for a food truck because purchasing a restaurant location is very expensive, while food trucks are much more affordable. ", image: "https://res.cloudinary.com/back-of-house/image/upload/h_518,w_1080,f_auto,c_fill,g_faces:center/products/harry-gillen-b2gdRynjL9Q-unsplash_jdxslm", active: true)
