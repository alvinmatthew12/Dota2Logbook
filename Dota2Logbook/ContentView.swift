//
//  ContentView.swift
//  Dota2Logbook
//
//  Created by Alvin Matthew Pratama on 26/03/23.
//

import SwiftUI

struct ContentView: View {
    let baseColor = Color("baseColor")
    let greyColor = Color("greyColor")
    let greyBGColor = Color("greyBGColor")
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                // MARK: - Cover Image
                ZStack {
                    Image("windranger-cover")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 350)
                    LinearGradient(colors: [.clear, baseColor], startPoint: .top, endPoint: .bottom)
                        .frame(height: 115)
                        .padding(.top, 235)
                }
                // MARK: - Name
                VStack(spacing: 8) {
                    Text("Lyralei, Master Archer of the Wood")
                        .font(helveticaNeue(size: 16))
                        .foregroundColor(greyColor)
                        .fontWeight(.bold)
                    Text("Windranger")
                        .textCase(.uppercase)
                        .font(helveticaNeue(size: 38))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding(.top, -30)
                // MARK: - Attribute
                GeometryReader { geometry in
                    HStack(alignment: .top, spacing: 0) {
                        heroAttribute(.strength, value: "18", gain: "2.6", width: geometry.size.width / 3)
                        heroAttribute(.agility, value: "17", gain: "1.4", width: geometry.size.width / 3)
                        heroAttribute(.intelligence, value: "18", gain: "3.6", width: geometry.size.width / 3)
                    }
                }
                .frame(height: 30)
                // MARK: - Roles
                HStack(alignment: .top, spacing: 25) {
                    heroRoles("Ranged")
                    heroRoles("Carry")
                    heroRoles("Support")
                    heroRoles("Disabler")
                }
                .padding(.top, 30)
                // MARK: - Story
                VStack(alignment: .leading) {
                    Text("Story of Windranger")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(helveticaNeue(size: 16))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    Text("The western forests guard their secrets well. One of these is Lyralei, master archer of the wood, and favored godchild of the wind. Known now as Windranger, Lyralei's family was killed in a storm on the night of her birth--their house blown down by the gale, contents scattered to the winds. Only the newborn survived among the debris field of death and destruction. In the quiet after the storm, the wind itself took notice of the lucky infant crying in the grass. The wind pitied the child and so lifted her into the sky and deposited her on a doorstep in a neighboring village. In the years that followed, the wind returned occasionally to the child's life, watching from a distance while she honed her skills. Now, after many years of training, Windranger fires her arrows true to their targets. She moves with blinding speed, as if hastened by a wind ever at her back. With a flurry of arrows, she slaughters her enemies, having become, nearly, a force of nature herself.")
                        .foregroundColor(.white)
                        .font(helveticaNeue(size: 14))
                        .lineSpacing(4.5)
                        .padding(.init(top: 0.5, leading: 20, bottom: 0, trailing: 20))
                }
                .padding(.vertical, 30)
                // MARK: - Abilities
                VStack {
                    Text("Abilities")
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .font(helveticaNeue(size: 24))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    GeometryReader { geometry in
                        HStack(spacing: 0) {
                            heroSkill(imageName: "windranger-shackleshot", name: "Shackleshot", width: geometry.size.width / 4)
                            heroSkill(imageName: "windranger-powershot", name: "Powershot", width: geometry.size.width / 4)
                            heroSkill(imageName: "windranger-windrun", name: "Windrun", width: geometry.size.width / 4)
                            heroSkill(imageName: "windranger-focusfire", name: "Focus Fire", width: geometry.size.width / 4)
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 75)
                }
                .padding(.init(top: 30, leading: 0, bottom: 80, trailing: 0))
                .background(greyBGColor)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(baseColor)
        .edgesIgnoringSafeArea(.vertical)
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
    }
    
    func helveticaNeue(size: CGFloat) -> Font {
        Font.custom("Helvetica Neue", size: size)
    }
    
    func heroAttribute(_ type: HeroAttribute, value: String, gain: String, width: CGFloat) -> some View {
        HStack(alignment: .center, spacing: 0) {
            type.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.trailing, 8)
            Text(value)
                .font(helveticaNeue(size: 20))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.trailing, 4)
            Text("+\(gain)")
                .font(helveticaNeue(size: 14))
                .foregroundColor(greyColor)
        }
        .frame(width: width)
    }
    
    func heroRoles(_ roles: String) -> Text {
        Text(roles)
            .foregroundColor(greyColor)
            .font(helveticaNeue(size: 14))
            .fontWeight(.bold)
    }
    
    func heroSkill(imageName: String, name: String, width: CGFloat) -> some View {
        VStack(alignment: .center, spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: width - 10)
                .cornerRadius(8)
            Text(name)
                .font(helveticaNeue(size: 12))
                .foregroundColor(.white)
        }
        .frame(width: width)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum HeroAttribute {
    case strength
    case agility
    case intelligence
    
    var image: Image {
        Image("hero-\(String(describing: self))")
    }
}
