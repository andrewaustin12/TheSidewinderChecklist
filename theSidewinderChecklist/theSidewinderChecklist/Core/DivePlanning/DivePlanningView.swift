//
//  DivePlanningView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/30/23.
//

//import SwiftUI
//import CoreLocation
//import WeatherKit
//
//struct DivePlanningView: View {
//    
//    let weatherService = WeatherService.shared
//    @StateObject var locationManager = LocationManager()
//    @State private var weather: Weather?
//    
//    var hourlyWeatherData: [HourWeather] {
//        if let weather {
//            return Array(weather.hourlyForecast.filter { hourlyWeather in
//                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
//            }.prefix(24))
//        } else {
//            return []
//        }
//    }
//    
//    var body: some View {
//        NavigationStack {
//
//            if let weather {
//                VStack {
//                    Text("Apple Park")
//                        .font(.largeTitle)
//                    Text("\(weather.currentWeather.temperature.formatted())")
//  
//                }
//                
//                HourlyForcastView(hourWeatherList: hourlyWeatherData)
//                Spacer()
//                FiveDayForcastView(dayWeatherList: weather.dailyForecast.forecast)
//            }
//            
//        }
//        .padding()
//        .task(id: locationManager.currentLocation) {
//            do {
////                if let location = locationManager.currentLocation {
//                let location = CLLocation(latitude: 37.322998, longitude: -122.032181)
//                self.weather = try await weatherService.weather(for: location)
////                }
//            } catch {
//                print(error)
//            }
//            
//        }
//    }
//}
//
//#Preview {
//    DivePlanningView()
//}
//
//extension Date {
//    func formatAsAbbreviatedDay() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEE"
//        return formatter.string(from: self)
//    }
//    
//    func formatAsAbbreviatedTime() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "ha"
//        return formatter.string(from: self)
//    }
//}
//
//struct HourlyForcastView: View {
//    
//    let hourWeatherList: [HourWeather]
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("HOURLY FORECAST")
//                .font(.caption)
//                .opacity(0.5)
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(hourWeatherList, id: \.date) { hourWeatherItem in
//                        VStack(spacing: 20){
//                            Text(hourWeatherItem.date.formatAsAbbreviatedTime())
//                            Image(systemName: "\(hourWeatherItem.symbolName).fill")
//                                .foregroundStyle(.yellow)
//                            Text(hourWeatherItem.temperature.formatted())
//                                .fontWeight(.medium)
//                        }
//                        .padding()
//                    }
//                }
//            }
//        }
//        .padding()
//        .background {
//            Color.blue
//        }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
//            .foregroundStyle(.white)
//    }
//}
//
//struct FiveDayForcastView: View {
//    
//    let dayWeatherList: [DayWeather]
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("5-DAY FORCAST")
//                .font(.caption)
//                .opacity(0.5)
//            
//            List(dayWeatherList, id: \.date) { dailyWeather in
//                HStack{
//                    Text(dailyWeather.date.formatAsAbbreviatedDay())
//                        .frame(maxWidth: 50, alignment: .leading)
//                    
//                    Image(systemName: "\(dailyWeather.symbolName)")
//                        .foregroundStyle(.yellow)
//                    
//                    Text(dailyWeather.lowTemperature.formatted())
//                        .frame(maxWidth: .infinity)
//                    
//                    Text(dailyWeather.highTemperature.formatted())
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                }
//                .listRowBackground(Color.blue)
//            }
//            .listStyle(.plain)
//        }
//        .padding()
//        .background {
//            Color.blue
//        }
//        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
//        .foregroundStyle(.white)
//    }
//}


