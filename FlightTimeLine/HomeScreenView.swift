//
//  HomeScreenView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 11.04.2025.
//

import SwiftUI

enum Route {
    case arrivals
    case departures
    case timeline
    
    var title: String {
        switch self {
        case .arrivals:
            "Arrivals"
        case .departures:
            "Departures"
        case .timeline:
            "Flight Timeline"
        }
    }
}

struct HomeScreenView: View {
    private let flights = FlightInformation.generateFlights() // иниц класса
    
    private var arrivals: [FlightInformation] {
        flights.filter {
            $0.direction == .departure
        }
    }
    
    private var departures: [FlightInformation] {
        flights.filter {
            $0.direction == .arrival
        }
    }
    
    var body: some View {
        NavigationStack { // помещаем чтоб работали ссылки
            ZStack {
                Image(systemName: "airplane") // изображение
                    .resizable() // сбрасываем размеры
                    .frame(width: 250, height: 250)
                    .opacity(0.1) // прозрачность
                    .rotationEffect(.degrees(-90)) // поворот на лево
                
                VStack(alignment: .leading, spacing: 10) { // выравнивание и расстояние
                    NavigationLink(Route.arrivals.title, value: Route.arrivals)
                    NavigationLink(Route.departures.title, value: Route.departures)
                    NavigationLink(Route.timeline.title, value: Route.timeline)
                    
                    Spacer() // поднимаем ссылки вверх
                }
                .font(.title) // шрифт ссылок
                .padding()
            }
            .navigationTitle("Airport")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .arrivals:
                    FlightBoardView(boardName: Route.arrivals.title, flights: arrivals)
                case .departures:
                    FlightBoardView(boardName: Route.departures.title, flights: departures)
                case .timeline:
                    TimelineView(flights: flights)
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
