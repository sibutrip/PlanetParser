//
//  ContentView.swift
//  MindMap
//
//  Created by Cory Tripathy on 2/7/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        List(vm.planets, id: \.self) { planet in
            DisclosureGroup(planet.name) {
                HStack(spacing: 0) {
                    Text("Mass: ")
                        .bold()
                    Spacer()
                    Text("\(planet.massInKg) * 10")
                    Text(" 26")
                        .font(.system(size: 8.0))
                        .baselineOffset(6.0)
                    Text(" kg")
                }
                HStack(spacing: 0) {
                    Text("Distance from Sun: ")
                        .bold()
                    Spacer()
                    Text("\(planet.distanceFromSunInKm) * 10")
                    Text(" 6")
                        .font(.system(size: 8.0))
                        .baselineOffset(6.0)
                    Text(" km")
                }
                HStack(spacing: 0) {
                    Text("Number of Moons: ")
                        .bold()
                    Spacer()
                    Text("\(planet.numberOfMoons)")
                }
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button {
                    //
                } label: {
                    Label("ah", systemImage: "star.fill")
                        .tint(.yellow)
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

