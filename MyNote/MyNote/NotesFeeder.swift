//
//  NotesFeeder.swift
//  MyNote
//
//  Created by Allicia Viona Sagi on 20/04/22.
//

import Foundation

struct NotesFeeder {
    
    func getNotes() -> [Notes] {
        return [
            Notes(title: "First day at the academy!", content: "I love how everyone are very nice here, and i got tons of new friends "),
            Notes(title: "Learning about User Persona", content: "User persona is really helpful for me to and the team to align our perspectives."),
            Notes(title: "Scared of Challenges", content: "I realize that the only fear that i have is myself."),
            Notes(title: "It's Gonna Be Ok", content: "It's been a roughhh dayyy!! My teammates and I just can't be on the same page!!!")
        ]
    }
    
}
