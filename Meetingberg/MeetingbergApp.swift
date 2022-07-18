//
//  MeetingbergApp.swift
//  Meetingberg
//
//  Created by Vladimir Vinageras on 25.06.2022.
//

import SwiftUI

@main
struct MeetingbergApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $store.scrums){
                    Task{
                        do{
                            try await ScrumStore.save(scrums: store.scrums)
                        }catch{
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
        
                        }
                    }

                }
            }
            .task{
                do{
                    store.scrums = try await ScrumStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "The App will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                store.scrums = DailyScrum.sampleData
            }){ wrapper in
                ErrorView(errorWrapper: wrapper)
                    }
            
            
        }
    }
}

