# Lab 4 - *ParseChat*

**ParseChat** is a Chat app using an [open source Parse](http://parseplatform.org/) backend.

Time spent: **5** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User can sign up and sign in to the login screen (+1pt)
- [x] User sees alerts for login exceptions, i.e. "account already exists", "wrong credentials", etc. (+1pt)
- [x] User can compose and send chat messages (+2pt)
- [x] User can view a list of chat messages in chronological order (+2pt)
- [x] Automatically Adjust Cell Size to Fit Text (+1pt)
- [x] Username of chat author is displayed in each chat message (+2pt)
- [x] Persist Logged in User (+1pt)

The following **stretch** user stories are implemented:

- [ ] User sees an activity indicator while waiting for authentication (+1pt)
- [x] User can pull to refresh Chat feed (+1pt)
- [ ] Add an "Adorable Avatar" for each user by requesting an avatar from the [Adorable Avatars API](https://github.com/adorableio/avatars-api) (+2pt)
- [ ] Chat Bubble Style Design (+3pt)
- [ ] Expand or contract the cell layout as needed to show the chat message author (user) if it exists (+2pt)

The following **additional** user stories are implemented:

- [x] User can log in and log out of account
- [x] Prevent user from posting an empty chat message


Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Working with error exceptions. How best to handle them?
2. What are some common errors and fixes we have encountered? I recently encounterd an error because I had a dangling link and am now more prepared to handle the same sort of error in the future.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/RaquelFigueroa/ParseChat/master/images/chatDemo.gif' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

This app project went smoother than the week 4 assignmnet, but I was unclear about using the assigned Parse server. The initial server suggested was down the entire time I worked on this project. Thankfully, there have been questions about this in the discussion forum and I was able to find the alternate server credentials. That worked! Thanks to everyone who post questions to the discussion forum!

## License

Copyright 2018 R. Figueroa-Opperman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
