//
//  ContentView.swift
//  swiftuimapkitstudy
//
//  Created by kenan on 27.07.2024.
//

import SwiftUI
import MapKit

struct Pin:Identifiable{
    let id = UUID()
    let location:CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.2215936, longitude: 28.8922047), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    let pins = [
        Pin(location: CLLocationCoordinate2D(latitude: 40.2215936, longitude: 28.8922047)),
        Pin(location: CLLocationCoordinate2D(latitude: 41.0370014, longitude: 28.9763369))
    ]
    
    
    var body: some View {
        VStack(spacing:100) {
            Map(coordinateRegion: $region,annotationItems:pins){ pin in
                MapMarker(coordinate: pin.location)
            }.frame(width: 300,height: 300)
            Button("Go to location"){
                withAnimation{
                    region.center = CLLocationCoordinate2D(latitude: 41.0370014, longitude: 28.9763369)
                    region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
