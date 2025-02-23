
import Foundation

// MARK: - Main Data Structure
struct RamayanaData: Codable {
    var kandas: [Kanda]
    
    enum CodingKeys: String, CodingKey {
        case kandas
    }
}

// MARK: - Kanda (काण्ड)
struct Kanda: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    var sargas: [Sarga]
    let colorTheme: String // Store as hex string, convert to Color in UI
    
    enum CodingKeys: String, CodingKey {
        case id = "Kanda_Number"
        case name = "Sanskrit_Name"
        case description = "Description"
        case sargas = "Sargas"
        case colorTheme = "Theme_Color"
    }
}

// MARK: - Sarga (सर्ग)
struct Sarga: Codable, Identifiable {
    let id: String
    let description: String
    let shlokaCount: Int
    var shlokas: [Shloka]
    
    enum CodingKeys: String, CodingKey {
        case id = "Sarga_Number"
        case description = "Description"
        case shlokaCount = "Sloka_Count"
        case shlokas = "Shlokas"
    }
}

// MARK: - Shloka (श्लोक)
struct Shloka: Codable, Identifiable {
    let id: String
    let sanskrit: String
    let romanTransliteration: String
    let meaning: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Shloka_Number"
        case sanskrit = "Sanskrit"
        case romanTransliteration = "Roman_Transliteration"
        case meaning = "Meaning"
    }
}

// MARK: - Sample JSON Data
extension RamayanaData {
    static let sampleJSON = """
    {
        "kandas": [
            {
                "Kanda_Number": "1",
                "Sanskrit_Name": "बालकाण्ड",
                "Description": "Bāla Kāṇḍa - The Book of Youth",
                "Theme_Color": "#FFA500",
                "Sargas": [
                    {
                        "Sarga_Number": "1",
                        "Description": "Sankshipta Ramayanam",
                        "Sloka_Count": 100,
                        "Shlokas": [
                            {
                                "Shloka_Number": "1.1.1",
                                "Sanskrit": "तपःस्वाध्यायनिरतं तपस्वी वाग्विदां वरम् । नारदं परिपप्रच्छ वाल्मीकिर्मुनिपुङ्गवम् ॥",
                                "Roman_Transliteration": "tapaḥsvādhyāyaniratam tapasvī vāgvidāṃ varam । nāradaṃ paripapraccha vālmīkirmunipuṅgavam ॥",
                                "Meaning": "Vālmīki, engaged in penance and study, asked Nārada, the best among speakers and sages."
                            }
                        ]
                    },
                    {
                        "Sarga_Number": "2",
                        "Description": "Valmiki witnesses the death of Krauncha Bird. Brahma's injunction to Valmiki to write Ramayana.",
                        "Sloka_Count": 43,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "3",
                        "Description": "The details of Ramayana, as contemplated by Valmiki.",
                        "Sloka_Count": 38,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "4",
                        "Description": "Valmiki teaches Ramayana to Kusa and Lava and Rama happens to hear it.",
                        "Sloka_Count": 31,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "5",
                        "Description": "Description of Ayodhya.",
                        "Sloka_Count": 23,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "6",
                        "Description": "Description of the people of all Varnas of Ayodhya.",
                        "Sloka_Count": 28,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "7",
                        "Description": "Description of the capabilities of ministers.",
                        "Sloka_Count": 22,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "8",
                        "Description": "Dasaratha's intention to do yagnya for getting children.",
                        "Sloka_Count": 24,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "9",
                        "Description": "Sumantra tells Dasaratha about Rishyasringa.",
                        "Sloka_Count": 19,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "10",
                        "Description": "Rishyasringa wooed to Angadesa. He marries Shanta.",
                        "Sloka_Count": 32,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "11",
                        "Description": "Dasaratha brings Rishyasringa along with Shanta to Ayodhya.",
                        "Sloka_Count": 30,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "12",
                        "Description": "Dasaratha requests the Rishis to perform the Yaaga, and orders the ministers to make the arrangements.",
                        "Sloka_Count": 21,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "13",
                        "Description": "Dasaratha requests Vasishtha to lead, and takes deeksha (event management).",
                        "Sloka_Count": 37,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "14",
                        "Description": "Dasaratha performs Aswamedha. The festive atmosphere.",
                        "Sloka_Count": 57,
                        "Shlokas": []
                    },
                    {
                        "Sarga_Number": "15",
                        "Description": "Dasaratha starts Putra Yeshti, Devas go to Brahma, Vishnu consoles them.",
                        "Sloka_Count": 33,
                        "Shlokas": []
                    },
                    {
                            "Sarga_Number": "16",
                            "Description": "Devas request Vishnu to take birth as human. Dasaratha gets Payasa. His wives become pregnant.",
                            "Sloka_Count": 32,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "17",
                            "Description": "Devas create Vaanaras.",
                            "Sloka_Count": 35,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "18",
                            "Description": "Dasaratha sees off Rishyasringa and kings. Rama and brothers born. Viswamitra arrives.",
                            "Sloka_Count": 58,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "19",
                            "Description": "Viswamitra requests Dasaratha to send Rama with him.",
                            "Sloka_Count": 21,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "20",
                            "Description": "Dasaratha denies and Viswamitra gets angry.",
                            "Sloka_Count": 27,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "21",
                            "Description": "Visishtha convinces Dasaratha to send Rama.",
                            "Sloka_Count": 21,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "22",
                            "Description": "Rama and Lakshmana go with Viswamitra. Viswamitra gives Bala and Atibala to Rama.",
                            "Sloka_Count": 23,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "23",
                            "Description": "Viswamitra spends night in the Ashrama by Ganga and Sarayu.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "24",
                            "Description": "The dreaded sound in the water, the story of Malada, Karoora.",
                            "Sloka_Count": 32,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "25",
                            "Description": "The story of Tataka.",
                            "Sloka_Count": 21,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "26",
                            "Description": "Slaying of Tataka.",
                            "Sloka_Count": 36,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "27",
                            "Description": "Viswamitra gives Divya Astra to Rama.",
                            "Sloka_Count": 26,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "28",
                            "Description": "Viswamitra tells how to retract the Astras.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "29",
                            "Description": "The story of Siddhasrama.",
                            "Sloka_Count": 32,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "30",
                            "Description": "Rama kills Rakshasas and protects the Yaaga.",
                            "Sloka_Count": 25,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "31",
                            "Description": "Viswamitra heads to Mithila.",
                            "Sloka_Count": 24,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "32",
                            "Description": "The daughters of Kushanabha become deformed by Vaayu.",
                            "Sloka_Count": 26,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "33",
                            "Description": "Kushanabha appreciates the forbearance of his daughters. Brahmadatta marries them.",
                            "Sloka_Count": 26,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "34",
                            "Description": "The story of Gadhi and the description of Kausiki, the sister of Viswamitra.",
                            "Sloka_Count": 23,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "35",
                            "Description": "Viswamitra tells the story of Ganga.",
                            "Sloka_Count": 24,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "36",
                            "Description": "Parvati's romance with Shiva interrupted, she curses Devas and Bhoodevi.",
                            "Sloka_Count": 27,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "37",
                            "Description": "Kaartikeya born to Ganga.",
                            "Sloka_Count": 32,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "38",
                            "Description": "The story of Sagara, his Yaga to get children.",
                            "Sloka_Count": 24,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "39",
                            "Description": "Indra abducts the horse. Sagara's sons dig earth. Devas go to Brahma.",
                            "Sloka_Count": 25,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "40",
                            "Description": "Brahma assures, Sagara's sons dig and dig and see Kapila. Kapila turns them into ashes.",
                            "Sloka_Count": 30,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "41",
                            "Description": "Amshumanta goes to Rasatala, learns about his uncles and brings the horse.",
                            "Sloka_Count": 26,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "42",
                            "Description": "Amshumantha fails to bring Ganga. Bhagiratha pleases Brahma. Brahma advises to pray to Shiva.",
                            "Sloka_Count": 25,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "43",
                            "Description": "Ganga's descent. She turns into seven streams and purifies the sons of Sagara.",
                            "Sloka_Count": 41,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "44",
                            "Description": "Brahma lauds Bhagiratha, Conclusion of Ganga's Avatarana.",
                            "Sloka_Count": 23,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "45",
                            "Description": "Ksheera Sagara Madhanam; Diti's sons die in the fight.",
                            "Sloka_Count": 44,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "46",
                            "Description": "Diti sad; does Tapa; Indra kills the fetus.",
                            "Sloka_Count": 23,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "47",
                            "Description": "The fetus parts become Maruts, City of Visala built there; Sumati honors Viswamitra.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "48",
                            "Description": "Viswamitra starts the story of Ahalya.",
                            "Sloka_Count": 34,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "49",
                            "Description": "Indra gets the testicles of a goat; Ahalya is relieved of the curse.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "50",
                            "Description": "Rama and Viswamitra reach Mithila. Janaka receives them.",
                            "Sloka_Count": 25,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "51",
                            "Description": "Satananda learns about the relief of Ahalya from her curse. Satananda tells the story of Viswamitra.",
                            "Sloka_Count": 28,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "52",
                            "Description": "Visishtha requests Sabala to prepare hospitalities for Viswamitra.",
                            "Sloka_Count": 23,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "53",
                            "Description": "Viswamitra happy about the hospitalities, asks Vasishtha for Sabala; Vasishtha denies.",
                            "Sloka_Count": 25,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "54",
                            "Description": "Viswamitra tries to snatch Sabala; Sabala creates army; they defeat the army of Viswamitra.",
                            "Sloka_Count": 23,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "55",
                            "Description": "Viswamitra prays to Siva, gets Astras, and casts them on Vasishtha. All of them are taken in by Brahma danda.",
                            "Sloka_Count": 28,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "56",
                            "Description": "All Astras are decapitated by Brahma Danda. Viswamitra decides to get Brahmanatva.",
                            "Sloka_Count": 24,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "57",
                            "Description": "Trishanku wants to go to heaven with mortal body and asks Vasishtha; Vasishtha denies; he goes to Vasishtha's sons.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "58",
                            "Description": "Vasistha's sons also deny Trishanku's request and curse him to be chandala; he goes to Viswamitra.",
                            "Sloka_Count": 24,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "59",
                            "Description": "Viswamitra wants to help Trisanku; invites all the rishis for Yaga; Vasistha's sons and Mahodaya deny and he curses them.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "60",
                            "Description": "Trishanku goes to heaven; he is thrown away; Viswamitra creates another heaven; he relents upon Deva's request.",
                            "Sloka_Count": 34,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "61",
                            "Description": "Viswamitra does Tapa in Pushkara; gets Brahmarshi status.",
                            "Sloka_Count": 29,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "62",
                            "Description": "Ambarisha's Yaaga horse is stolen by Indra.",
                            "Sloka_Count": 26,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "63",
                            "Description": "Richeeka sells his son Sunassepha to Ambarisha.",
                            "Sloka_Count": 31,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "64",
                            "Description": "Sunassepha meets Viswamitra and learns mantras.",
                            "Sloka_Count": 28,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "65",
                            "Description": "Sunassepha is saved. Viswamitra adopts him.",
                            "Sloka_Count": 33,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "66",
                            "Description": "Viswamitra's sons refuse to accept Sunassepha as elder brother.",
                            "Sloka_Count": 25,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "67",
                            "Description": "Viswamitra curses his sons and goes to south.",
                            "Sloka_Count": 24,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "68",
                            "Description": "Rama and Lakshmana reach Mithila with Viswamitra.",
                            "Sloka_Count": 19,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "69",
                            "Description": "Janaka tells the story of the bow.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "70",
                            "Description": "Janaka tells how he got Sita.",
                            "Sloka_Count": 27,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "71",
                            "Description": "Rama breaks the bow.",
                            "Sloka_Count": 24,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "72",
                            "Description": "Parashurama arrives angry.",
                            "Sloka_Count": 22,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "73",
                            "Description": "Rama takes Vaishnava bow from Parashurama.",
                            "Sloka_Count": 28,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "74",
                            "Description": "Dasaratha arrives at Mithila.",
                            "Sloka_Count": 21,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "75",
                            "Description": "The genealogy of Ikshvaku and Janaka.",
                            "Sloka_Count": 25,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "76",
                            "Description": "Marriage of Rama and his brothers.",
                            "Sloka_Count": 19,
                            "Shlokas": []
                        },
                        {
                            "Sarga_Number": "77",
                            "Description": "Return to Ayodhya. Meeting with Bhargava.",
                            "Sloka_Count": 20,
                            "Shlokas": []
                        }
                ]
            },
            {
                "Kanda_Number": "2",
                "Sanskrit_Name": "अयोध्याकाण्ड",
                "Description": "Ayodhyā Kāṇḍa - The Book of Ayodhya",
                "Theme_Color": "#8B0000",
                "Sargas": [
                    {
                        "Sarga_Number": "1",
                        "Description": "First chapter of Ayodhya Kanda",
                        "Sloka_Count": 1,
                        "Shlokas": [
                            {
                                "Shloka_Number": "2.1.1",
                                "Sanskrit": "को न्वस्य सुभ्रुशार्दूलो वीर्योत्तरविचक्षणः । धर्मज्ञश्च कृतज्ञश्च सत्यवाक्यो दृढव्रतः ॥",
                                "Roman_Transliteration": "ko nvasya subhruśārdūlo vīryottaravicakṣaṇaḥ । dharmajñaśca kṛtajñaśca satyavākyo dṛḍhavrataḥ ॥",
                                "Meaning": "Who indeed is that tiger among men, endowed with great valor, wisdom, and gratitude, steadfast in truth and firm in resolve?"
                            }
                        ]
                    }
                ]
            },
            {
                "Kanda_Number": "3",
                "Sanskrit_Name": "अरण्यकाण्ड",
                "Description": "Araṇya Kāṇḍa - The Book of the Forest",
                "Theme_Color": "#228B22",
                "Sargas": [
                    {
                        "Sarga_Number": "1",
                        "Description": "First chapter of Aranya Kanda",
                        "Sloka_Count": 1,
                        "Shlokas": [
                            {
                                "Shloka_Number": "3.1.1",
                                "Sanskrit": "प्रयाते तु महाबाहौ सीतया सह राघवे । लक्ष्मणश्चापि धर्मात्मा विन्ध्यं चेरुस्तपोवनम् ॥",
                                "Roman_Transliteration": "prayāte tu mahābāhau sītayā saha rāghave । lakṣmaṇaścāpi dharmātmā vindhyaṃ cerustapovanam ॥",
                                "Meaning": "When the mighty-armed Rāma set out with Sītā, the righteous Lakṣmaṇa too accompanied him to the sacred forests of Vindhya."
                            }
                        ]
                    }
                ]
            },
            {
                "Kanda_Number": "4",
                "Sanskrit_Name": "किष्किन्धाकाण्ड",
                "Description": "Kiṣkindhā Kāṇḍa - The Book of Kishkindha",
                "Theme_Color": "#DAA520",
                "Sargas": [
                    {
                        "Sarga_Number": "1",
                        "Description": "First chapter of Kishkindha Kanda",
                        "Sloka_Count": 1,
                        "Shlokas": [
                            {
                                "Shloka_Number": "4.1.1",
                                "Sanskrit": "सुग्रीवस्तु तदा राज्यम् किष्किन्धायामकारयत् । राघवस्य प्रभावेण सत्त्वेन च बलेन च ॥",
                                "Roman_Transliteration": "sugrīvastu tadā rājyam kiṣkindhāyāmakārayat । rāghavasya prabhāveṇa sattvena ca balena ca ॥",
                                "Meaning": "Sugrīva then established his rule in Kiṣkindhā, due to the influence, righteousness, and strength of Rāghava."
                            }
                        ]
                    }
                ]
            },
            {
                "Kanda_Number": "5",
                "Sanskrit_Name": "सुन्दरकाण्ड",
                "Description": "Sundara Kāṇḍa - The Book of Beauty",
                "Theme_Color": "#4169E1",
                "Sargas": [
                    {
                        "Sarga_Number": "1",
                        "Description": "First chapter of Sundara Kanda",
                        "Sloka_Count": 1,
                        "Shlokas": [
                            {
                                "Shloka_Number": "5.1.1",
                                "Sanskrit": "हनूमान् चापि तां सीतां सन्दिदृक्षुर्महाकपिः । लङ्कां प्रदक्षिणं कृत्वा प्रविवेश शनैः शनैः ॥",
                                "Roman_Transliteration": "hanūmān cāpi tāṃ sītāṃ sandidṛkṣurmahākapiḥ । laṅkāṃ pradakṣiṇaṃ kṛtvā praviveśa śanaiḥ śanaiḥ ॥",
                                "Meaning": "Hanuman, the great monkey, eager to see Sītā, circumambulated Laṅkā and then entered it slowly and cautiously."
                            }
                        ]
                    }
                ]
            },
            {
                "Kanda_Number": "6",
                "Sanskrit_Name": "युद्धकाण्ड",
                "Description": "Yuddha Kāṇḍa - The Book of War",
                "Theme_Color": "#B22222",
                "Sargas": [
                    {
                        "Sarga_Number": "1",
                        "Description": "First chapter of Yuddha Kanda",
                        "Sloka_Count": 1,
                        "Shlokas": [
                            {
                                "Shloka_Number": "6.1.1",
                                "Sanskrit": "रावणं च महावीर्यं भ्रातॄणां चैव सङ्ग्रहे । प्रयाणे चार्थदत्तं च मन्त्रयामास राघवः ॥",
                                "Roman_Transliteration": "rāvaṇaṃ ca mahāvīryaṃ bhrātṝṇāṃ caiva saṅgrahe । prayāṇe cārthadattaṃ ca mantrayāmāsa rāghavaḥ ॥",
                                "Meaning": "Rāghava consulted regarding the mighty Rāvaṇa, the gathering of his brothers, and the preparations for the battle."
                            }
                        ]
                    }
                ]
            }
        ]
    }
    """
}


// MARK: - Data Manager
@globalActor actor RamayanaDataActor {
    static let shared = RamayanaDataActor()
}

@RamayanaDataActor
final class RamayanaDataManager: @unchecked Sendable {
    static let shared = RamayanaDataManager()
    
    private init() {}
    
    func loadData() async -> RamayanaData? {
        guard let jsonData = RamayanaData.sampleJSON.data(using: .utf8) else {
            print("Failed to convert JSON string to data")
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(RamayanaData.self, from: jsonData)
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
    func loadFromFile() async -> RamayanaData? {
        guard let url = Bundle.main.url(forResource: "ramayana_data", withExtension: "json") else {
            print("JSON file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(RamayanaData.self, from: data)
        } catch {
            print("Error loading or decoding JSON: \(error)")
            return nil
        }
    }
}

// MARK: - Color Extension
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - View Model
@MainActor
class RamayanaViewModel: ObservableObject {
    @Published var ramayanaData: RamayanaData?
    
    init() {
        Task {
            await loadData()
        }
    }
    
    func loadData() async {
        // Try loading from file first
        if let data = await withCheckedContinuation({ continuation in
            Task.detached {
                let manager = await RamayanaDataManager.shared
                let result = await manager.loadFromFile()
                continuation.resume(returning: result)
            }
        }) {
            self.ramayanaData = data
        } else {
            // Fall back to sample data
            if let sampleData = await withCheckedContinuation({ continuation in
                Task.detached {
                    let manager = await RamayanaDataManager.shared
                    let result = await manager.loadData()
                    continuation.resume(returning: result)
                }
            }) {
                self.ramayanaData = sampleData
            }
        }
    }
    
    func getKandaColor(_ hexString: String) -> Color {
        return Color(hex: hexString)
    }
}

// MARK: - Preview Helpers
extension RamayanaData {
    static var preview: RamayanaData {
        // Create a simple preview data
        let previewData = RamayanaData(kandas: [])
        return previewData
    }
}
