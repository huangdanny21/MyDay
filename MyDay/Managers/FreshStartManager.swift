//
//  FreshStartManager.swift
//  MyDay
//
//  Created by Danny Huang on 8/15/21.
//

import Firebase

final class FreshStartManager {
    
    static let shared = FreshStartManager()
    
    func setInitialSetOfActivities() {
        var dict = [String: [Activity]]()
        Activities.allCases.forEach {dict[$0.title] = generateBaseActivity(forType: $0)}
        print(dict)
        ActivityServiceProvider().writeNewActivitiesToDB(withData: dict)
    }
    
    private func generateBaseActivity(forType type: Activities) -> [Activity] {
        switch type {
        case .social:
            return socialItems()
        case .hobbies:
            return hobbiesItems()
        case .sleep:
            return sleepItems()
        case .food:
            return foodItems()
        case .betterMe:
            return betterMeItems()
        case .chores:
            return choreItems()
        case .diary:
            return diaryItems()
        case .media:
            return mediaItems()
        case .health:
            return healthItems()
        }
    }
    
    private func socialItems() -> [Activity] {
        let family = Activity(imageUrl: "family", title: "family")
        let friends = Activity(imageUrl: "friends", title: "friends")
        let date = Activity(imageUrl: "date", title: "date")
        let party = Activity(imageUrl: "party", title: "party")
        return [family, friends, date, party]
    }
    
    private func hobbiesItems() -> [Activity] {
        let movies = Activity(imageUrl: "movies", title: "movies & tv")
        let reading = Activity(imageUrl: "reading", title: "reading")
        let gaming = Activity(imageUrl: "gaming", title: "gaming")
        let sport = Activity(imageUrl: "sport", title: "sport")
        let relax = Activity(imageUrl: "relax", title: "relax")
        return [movies, reading, gaming, sport, relax]
    }
    
    private func sleepItems() -> [Activity] {
        let goodSleep = Activity(imageUrl: "goodSleep", title: "good sleep")
        let mediumSleep = Activity(imageUrl: "mediumSleep", title: "medium sleep")
        let badSleep = Activity(imageUrl: "badSleep", title: "bad sleep")
        let sleptEarly = Activity(imageUrl: "sleptEarly", title: "slept early")
        return [goodSleep, mediumSleep, badSleep, sleptEarly]
    }
    
    private func foodItems() -> [Activity] {
        let eatHealthy = Activity(imageUrl: "eatHealthy", title: "eat healthy")
        let fastFood = Activity(imageUrl: "fastFood", title: "fast food")
        let homemade = Activity(imageUrl: "homemade", title: "homemade")
        let restaurant = Activity(imageUrl: "restaurant", title: "restaurant")
        let delivery = Activity(imageUrl: "delivery", title: "delivery")
        let noMeat = Activity(imageUrl: "noMeat", title: "no meat")
        let noSweets = Activity(imageUrl: "noSweets", title: "no sweets")
        let noSoda = Activity(imageUrl: "noSoda", title: "no soda")
        return [eatHealthy, fastFood, homemade, restaurant, delivery, noMeat, noSweets, noSoda]
    }
    
    private func healthItems() -> [Activity] {
        let exercise = Activity(imageUrl: "exercise", title: "exercise")
        let drinkWater = Activity(imageUrl: "drinkWater", title: "drink water")
        let walk = Activity(imageUrl: "walk", title: "walk")
        return [exercise, drinkWater, walk]
    }
    
    private func betterMeItems() -> [Activity] {
        let meditation = Activity(imageUrl: "meditation", title: "meditation")
        let kindness = Activity(imageUrl: "kindness", title: "kindness")
        let listen = Activity(imageUrl: "listen", title: "listen")
        let donate = Activity(imageUrl: "donate", title: "donate")
        let giveGifts = Activity(imageUrl: "giveGifts", title: "give gifts")
        return [meditation, kindness, listen, donate, giveGifts]
    }
    
    private func choreItems() -> [Activity] {
        let shopping = Activity(imageUrl: "shopping", title: "shopping")
        let cleaning = Activity(imageUrl: "cleaning", title: "cleaning")
        let cooking = Activity(imageUrl: "cooking", title: "cooking")
        let laundry = Activity(imageUrl: "laundry", title: "laundry")
        return [shopping, cleaning, cooking, laundry]
    }
    
    private func diaryItems() -> [Activity] {
        let diary = Activity(imageUrl: "diary", title: "Note")
        return [diary]
    }
    
    private func mediaItems() -> [Activity] {
        let media = Activity(imageUrl: "media", title: "Photo")
        return [media]
    }
}
