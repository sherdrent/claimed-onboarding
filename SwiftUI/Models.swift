import SwiftUI

struct BrandQuestion: Identifiable {
    let id: String
    let brand: String
    let question: String
    let iconName: String
    let logoName: String
}

struct ClaimItem: Identifiable {
    let id: String
    let name: String
    let iconName: String
    let daysLeft: Int
    let who: String
    let payout: String
    let payoutValue: Int
}

struct ClaimFormData: Identifiable {
    let id: String
    let name: String
    let questions: [String]
}

let brandQuestions: [BrandQuestion] = [
    BrandQuestion(id: "instagram", brand: "Instagram", question: "Have you ever had an Instagram account?", iconName: "instagram-icon", logoName: "instagram-logo"),
    BrandQuestion(id: "yahoo", brand: "Yahoo", question: "Have you ever had a Yahoo account?", iconName: "yahoo-icon", logoName: "yahoo-logo"),
    BrandQuestion(id: "juul", brand: "Juul", question: "Have you purchased a Juul device?", iconName: "juul-icon", logoName: "juul-logo"),
    BrandQuestion(id: "apple", brand: "Apple", question: "Do you own any Apple devices?", iconName: "apple-icon", logoName: "apple-logo"),
    BrandQuestion(id: "bumble", brand: "Bumble", question: "Have you used the dating app Bumble?", iconName: "bumble-icon", logoName: "bumble-logo"),
    BrandQuestion(id: "plaid", brand: "Plaid", question: "Have you used Plaid to connect your bank account to apps like Venmo or Robinhood?", iconName: "plaid-icon", logoName: "plaid-logo"),
    BrandQuestion(id: "ebay", brand: "eBay", question: "Have you ever had an eBay account?", iconName: "ebay-icon", logoName: "ebay-logo"),
    BrandQuestion(id: "airbnb", brand: "Airbnb", question: "Have you ever booked a stay at an Airbnb?", iconName: "airbnb-icon", logoName: "airbnb-logo"),
    BrandQuestion(id: "visa", brand: "Visa or Mastercard", question: "Did you use a Visa or Mastercard for ATM withdrawals in the U.S. between October 1, 2007 and July 26, 2024?", iconName: "visa-mc-icon", logoName: "visa-mc-logo"),
]

let claimItems: [ClaimItem] = [
    ClaimItem(id: "tiktok", name: "TikTok & Instagram", iconName: "tiktok", daysLeft: 186, who: "Users <24yo", payout: "$1,000", payoutValue: 1000),
    ClaimItem(id: "flo", name: "Flo", iconName: "flo", daysLeft: 108, who: "Flo app users", payout: "$25", payoutValue: 25),
    ClaimItem(id: "spotify", name: "Spotify", iconName: "spotify", daysLeft: 154, who: "Spotify users", payout: "$100", payoutValue: 100),
    ClaimItem(id: "fortnite", name: "Fortnite", iconName: "fortnite", daysLeft: 125, who: "Your child is <16yo & plays often", payout: "$1,250", payoutValue: 1250),
    ClaimItem(id: "kirkland", name: "Kirkland (Costco)", iconName: "kirkland", daysLeft: 216, who: "Kirkland tequila customers", payout: "$250", payoutValue: 250),
    ClaimItem(id: "grubhub", name: "GrubHub", iconName: "grubhub", daysLeft: 141, who: "Grubhub customers", payout: "$200", payoutValue: 200),
    ClaimItem(id: "tinder", name: "Tinder", iconName: "tinder", daysLeft: 50, who: "Tinder Plus users 29yo+", payout: "$50", payoutValue: 50),
    ClaimItem(id: "instagram-list", name: "Instagram", iconName: "instagram-list", daysLeft: 186, who: "Users <24yo", payout: "$1,000", payoutValue: 1000),
    ClaimItem(id: "circlek", name: "Circle K", iconName: "circlek", daysLeft: 66, who: "Circle K customers", payout: "$50", payoutValue: 50),
    ClaimItem(id: "toyota", name: "Toyota Motor Corporation", iconName: "toyota", daysLeft: 897, who: "Toyota owners", payout: "$100", payoutValue: 100),
]

let claimForms: [String: [String]] = [
    "tiktok": [
        "Did you have an active TikTok account before June 2023?",
        "Were you under 24 years old (or a parent of a minor) during your TikTok use?",
        "Did TikTok use negatively impact your mental health, sleep, school, or work?",
        "Did your TikTok use continue for multiple months or longer before June 2023?",
    ],
    "flo": [
        "Did you use Flo between November 1, 2016 and February 28, 2019?",
        "Did you enter menstruation or pregnancy information into the Flo app during that time?",
        "Were you unaware that Flo shared your health information with third parties like Facebook or Google?",
        "Did you use the Flo app while living in the United States?",
    ],
    "spotify": [
        "Have you had a free or paid Spotify account?",
        "Did you use Spotify regularly over a period of multiple months?",
        "Did you listen to Spotify playlists or personalized recommendations?",
        "Did you use Spotify while located in the United States?",
    ],
    "fortnite": [
        "Is the affected child between 5 and 16 years old?",
        "Did the child play video games more than 10 hours per week?",
        "Did gaming negatively impact the child's mental health, school performance, or behavior?",
        "Did the child attempt to reduce or stop gaming but struggle to do so?",
    ],
    "kirkland": [
        "Did you purchase Kirkland Signature Tequila Blanco in the United States?",
        "Was the product labeled as \"100% Blue Weber Agave\" at the time of purchase?",
        "Would you have avoided or paid less for the product if the labeling were inaccurate?",
        "Did you purchase the product more than once based on the labeling or branding?",
    ],
    "grubhub": [
        "Do you have a Grubhub account or use the Grubhub app/website?",
        "Have you used Grubhub to browse restaurants or place a food order?",
        "Were you unaware that Grubhub shared your activity or device data with third parties without your clear consent?",
        "Did you use Grubhub while located in the United States?",
    ],
    "tinder": [
        "Have you purchased a Tinder Plus subscription?",
        "Did you subscribe to Tinder Plus between March 2, 2015 and February 10, 2019?",
        "Were you 29 or older at the time you purchased Tinder Plus?",
        "Did you purchase Tinder Plus while located in the United States?",
    ],
    "instagram-list": [
        "Did you have an active TikTok account before June 2023?",
        "Were you under 24 years old (or a parent of a minor) during your TikTok use?",
        "Did TikTok use negatively impact your mental health, sleep, school, or work?",
        "Did your TikTok use continue for multiple months or longer before June 2023?",
    ],
    "circlek": [
        "Did you receive a data breach notice from Circle K or Gas Express, LLC?",
        "Was your personal information potentially exposed in the May 2024 data incident?",
        "Did the breach notice indicate your name, contact, or payment information may have been accessed?",
        "Were you residing in the United States when you received the breach notice?",
    ],
    "toyota": [
        "Do you own or lease, or did you previously own or lease, a Toyota Corolla, Corolla Matrix, Avalon, Tacoma, Tundra, or Sequoia?",
        "Is your Toyota a covered model year (Corolla 2011-2019, Avalon 2012-2018, Tacoma 2012-2019, Tundra 2012-2017, or Sequoia 2012-2017)?",
        "Did you own or lease the vehicle as of July 31, 2023?",
    ],
]

let payoutPerYes = 45
