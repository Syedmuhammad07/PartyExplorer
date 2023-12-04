//
//  PartyManager.swift
//  PartyExplorer
//
//  Created by Syed Muhammad on 04/12/2023.
//

import Foundation

class PartyDataManager {
    
    
    static var allParties: [Party] = []
    
    static func generateRandomParty() -> Party {
        let randomName = getRandomName()
        let randomImageURL = getRandomImageURL()
        let randomPrice = getRandomPrice()
        let randomStartDate = getRandomStartDate()
        let randomEndDate = getRandomEndDate()
        let randomAttendees = getRandomAttendees()
        
        return Party(name: randomName,
                     bannerImageURL: randomImageURL,
                     price: randomPrice,
                     attendees: randomAttendees,
                     startDate: randomStartDate,
                     endDate: randomEndDate)
    }
    
    private static func getRandomName() -> String {
        let names = ["Bollywood Night", "Dance Away", "House Party", "Coldplay Concert", "Food Fest", "Club Rave", "Birthday Bash", "Hozier Live"]
        return names.randomElement() ?? "Random Party"
    }
    
    private static func getRandomImageURL() -> URL {
        let imageUrls = ["https://1561355748.rsc.cdn77.org/storage/app/media/Mood-Bilder/shutterstock_460028722_1080x608.jpg", "https://www.datocms-assets.com/88015/1682054067-k7a7228-1.jpg?auto=compress%2Cformat&dpr=1&fit=clip&q=40&w=900", "https://img.freepik.com/premium-photo/vibrant-nightclub-people-dance-joyfully-music-festival-their-silhouettes-illuminated-by-pulsating-lights-energy-is-infectious-creating-atmosphere-pure-exhilaration-generative-ai_213438-11235.jpg", "https://images.pexels.com/photos/1154189/pexels-photo-1154189.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/2834632/pexels-photo-2834632.jpeg?auto=compress&cs=tinysrgb&h=627&fit=crop&w=1200", "https://www.signupgenius.com/cms/socialMediaImages/party-food-ideas-facebook-1200x630.png"]
        return URL(string: imageUrls.randomElement() ?? "")!
    }
    
    private static func getNumberOfParties() -> Int {
        return Int.random(in: 0 ... 10)
    }
    
    private static func getRandomPrice() -> Double {
        return Double.random(in: 10.0 ... 100.0)
    }
    
    private static func getRandomAttendees() -> Int {
        return Int.random(in: 0 ... 1000)
    }
    
    private static func getRandomStartDate() -> Date {
        let currentDate = Date()
        let randomTimeInterval = TimeInterval.random(in: 0 ... 30 * 24 * 60 * 60) // Up to 30 days from now
        return currentDate.addingTimeInterval(randomTimeInterval)
    }
    
    private static func getRandomEndDate() -> Date? {
        // 50% chance of having no end date
        if Bool.random() {
            return nil
        }
        // Otherwise, set an end date within 1 to 7 days from the start date
        let randomTimeInterval = TimeInterval.random(in: 1 ... 7 * 24 * 60 * 60)
        return getRandomStartDate().addingTimeInterval(randomTimeInterval)
    }
    
    // Function to initialize the app data with random parties
    static func initializeAppData() {
        for _ in 1...3 {
            allParties.append(generateRandomParty())
        }
    }
    
    static func appendNewParty() {
        let newParty = generateRandomParty()
        allParties.append(newParty)
    }
}
