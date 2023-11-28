# Original App Design Project - README Template
## Workout University
### Table of Contents
1. Overview
2. Product Spec
3. Wireframes
4. Schema

## Overview
### Description
Workout University is an app that lets you scroll through different types of workouts and lets you build your own workouts. By educating you on the different types of workouts you can do, you are able to build your own routines and go through them at the gym. 

### App Evaluation
[Evaluation of your app across the following attributes]

- Category:
    - Health and Fitness
- Mobile:
    - Lets you access workouts and your routines without wifi. People are in the gym with their phones and an app will work better than a website in this situation. 
- Story:
    - Gym lovers will love to use it to track and go through their routines so they don't have to remember what to do. Also, new gym members will love the access to hundreds of exercises to scroll through and make their own routine with. 
- Market:
    - While most gym apps exist, some are complicated and not clear on what value they provide. This app will be simplistic as you mainly scroll through different exercises and pick the ones that interest you into a routine. 
- Habit:
    - The user will open the app whenever they are in the gym to follow their routine. They will also open the app when they are free to build workout routines. 
- Scope:
    - A bulk of the app can be built using API calls and navigation bars. 

## Product Spec
1. User Stories (Required and Optional)
Required Must-have Stories
- User can scroll through different exercises 
- User can tap an exercise to go to a detailed view 
- User can save the exercise to a workout routine that is saved in memory



Optional Nice-to-have Stories
- User can log in
- User can create multiple workout routines


2. Screen Archetypes
- Login Screen
    - User can log in
    - Users can sign up
    - Users can reset password if forgotten
- Workout Viewer
    - User can scroll through different exercises
- Creation
    - User can post a new photo to their feed
 - Routine Viewer
    - Able to view workouts saved 

3. Navigation
Tab Navigation (Tab to Screen)
- Routines
- Workout Viewer

Flow Navigation (Screen to Screen)
- Login Screen
    - => Workout Viewer
    - => Sign up
    - => Reset Password
- Workout Viewer
    - =Exercise Details 
- Routines Screen
    - None     


## Wireframes
<img width="642" alt="image" src="https://github.com/Topusaha/Workout-University/assets/63518805/f1bc835f-14fa-4c3a-9dcf-64ec855d910b">



### Networking
[Add list of network requests by screen ]
[Create basic snippets for each Parse network request]
[OPTIONAL: List endpoints if using existing API such as Yelp]

#### API Request Code snippet and endpoints
```
let muscle = "biceps".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle="+muscle!)!
var request = URLRequest(url: url)
request.setValue("YOUR_API_KEY", forHTTPHeaderField: "X-Api-Key")
let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
    guard let data = data else { return }
    print(String(data: data, encoding: .utf8)!)
}
task.resume()
```

#### Networking Requests
- Workout Viewer Screen
    - Makes an HTTP Get Request to Exercise API to get exercises to display
      
- Workout Generator Screen
    - Makes an HTTP Get Request to Exercise API to get exercises to display for the user to do 

## Reflection 
#### Sprint 1 (Completed)
- [X] Create a login screen
- [X] Create a sign-up screen
- [X] Create forgot password screen

#### Demo Link 
https://www.loom.com/share/714d674d2e974fecacd87ef4e32273b0?sid=0c4ec153-d2de-473c-b145-7c72e741da7e

#### Sprint 2 (Completed)
- [X] Create a workout table view
- [X] Create workout table cell
- [X] Connect to API to populate the view

#### Demo Link 
https://www.loom.com/share/f5b95de7d041436fabb968dafc5ea1df?sid=48060bff-4ed2-41bc-8a54-783fa819ef76
#### Sprint 3 (To Do)
#### Sprint 4 (To Do)
