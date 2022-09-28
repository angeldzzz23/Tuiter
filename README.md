# Tuiter

This is a basic twitter app to read your tweets.

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen. (1pt)
- [x] User can log in. (1pt)
- [x] User can log out. (1pt)
- [x] User stays logged in across restarts. (1pt)
- [x] User can view tweets with the user profile picture, username, and tweet text. (6pts)

The following **bonus** features are implemented:

- [x] User can pull to refresh. (1pt)
- [ ] User can load past tweets infinitely. (2pts)

## Bug problem for TAs 
- this adds the url types that the original project contains
![Screen Shot 2022-09-27 at 8 10 01 PM](https://user-images.githubusercontent.com/29695936/192680466-9541afe3-5ac8-4edb-b354-ed5e1491313a.png)

- proof that fetch token is a success 
![Screen Shot 2022-09-27 at 8 12 20 PM](https://user-images.githubusercontent.com/29695936/192680515-ad95c731-b2a0-4c04-8eba-80a5e8c872f3.png)

# info about my project 
 - if you check out my main branch you'll be able to see that the exact same code works on that version. 
   - im thinking that it could be because previous ios versions do not have scene delegate. 
 - SceneDelegate sets the rootVC to LoginViewController
 - LoginViewController is in charge of loggin in the user.
 - the outcome of LoginViewController should print i am logged in
![Screen Shot 2022-09-27 at 8 26 39 PM](https://user-images.githubusercontent.com/29695936/192680701-ba1ce621-2398-4874-8fe7-916976880485.png)


Here's a walkthrough of implemented user stories:
