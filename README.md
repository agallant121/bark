# Coding Challenge

This repository is a very bare-bones Ruby On Rails app called "Bark" that allows users to create and review restaurants. Feel free to use this repo and any work you put into it for whatever purpose you want. 

## Instructions

1. Fork this repository to your GitHub Account (Or download it directly if you want more anonymity)
2. Get the app running in your local development environment
3. Complete the tasks listed below. 
4. Commit your work as a new branch to YOUR OWN GitHub Account (or zip it and move to step 5 if you don't want it on your public profile)
5. Email pat@gopassage.com that you are done

## Tasks

### Review Order

The newest reviews should be at the top of the list. 

- This one went quickly and I made a model method to call on a restaurant object to order the reviews. Method within the restaurant model.

### Comment Deletion

Users need to be able to delete their own comments. There is already a button, but it doesn't work. 

- I feel as though I spent a silly amount of time on this one but let me explain my thinking...All I wanted to do was to target the comment's ID, however, I could not do that because comments are not their own rescource in the DB with a relationship to reviews, they are an attribute of reviews. Since this is an sqlite3 DB I could not do my plan which was to remove 'comment' from the Review table in the DB and make a new Comment table and have  a one to many with review:references for the comments. That way I would be able to target the comment's ID for deletion independent from the Review. However, since I could not do this I decided to just make a new route and controller action that would take the review's comment and set it to nil or an empty string (" "). When I tried this approach and played around with it in pry, it worked. I was able to get the comment and change it to an empty string but no matter how I approached saving the changes but using review.update / review.update_attributes(comment: ''), review.save (any combination of saving stuff) or any of those, the comment would not stay changed and remained on the page. I know you said to not spend too much time on this but it was bothering me so I stuck with it for a while. Unfortunately I could not get it to work so out of spite I am just deleting the entire review for now so you can at least see that I did something.

### Average Rating

On the restaurant show page we need to see what it's 5 star rating is. 

- This one was also quick with just a model method to call on a restaurant object. Method within the restaurant model and displaying on the restaurant show page.

### CSS Issues
There seems to be some funky CSS hover animations going on, especially in
the navbar. Clean these up so things are more readable and pretty. 

- Quick fix, hopped in the stylesheets and found the hover css and changed the color from black to a light blue.

### Security Problem

We noticed that anyone can modify or delete any restaurant. Please make sure 
that only the restaurant owner has this access. 

- Quick fix by setting a limitation so that the edit and delete buttons would only display if the current_user.id == restaurant.user_id. This way, only the user who created the restaurant has that functionality. 

### Missing Home Page

Our app doesn't have a home page yet! We'd like there to be one that lists all
restaurants ranked by rating. If it was paginated that would be a plus! 

- Part of this one was relatively simple and I believe I also have the home button going to the home page as well now. I was able to get the restaurants to display on the home page and I have included pagination on the bottome. I had never used pagination so that was fun to look into and relatively simple to implement. 

### Owner Alerts

Restaurant owners want to know when somebody reviews their place. Could we get emails 
sent to them when new reviews come in? Our app gets a ton of traffic, so let's not
bog the web process down with slow actions like sending emails. ActionJob would be a 
great fit here. 

- This one was fun to do. I had never used ActionJob so I just read the docs and looked at some examples and went through it piece by piece. I ended up having action mailer do the work and I created a fake gmail account to send the emails notifying restaurant creators that their restaurant had been reviewed. I almost had the emails being sent to the current_user in a brain-fart moment and then I dug through until I had the email of the user who created the restaurant as the recipient of the emails. Boom. 

### Restaurant Pictures

We need restaurant owners to be able to upload photos of their restuarant and food. ActiveStorage would be great for this. 

- ActiveStorage is another very cool thing I had never done before. Like ActionMailer, I read the docs and followed some examples piece by piece until The images were uploading properly. I got confused for a little because I had the images being uploaded but not displayed so then I set a conditional to have them show if an image was attached and styled them simply so as to not be obnoxiously huge. I also intentionally chose to only have ONE image be attached. I understand that to add more would be to change the model to say 'has_many_attached: images' and then include within the controller params params.permit (:blah, :blah, images: [ ]). I just thought it made the site look cleaner with one image as I looked at it over and over again.

## Bonus Tasks

### Review photos

It would be cool if customers could submit photos with their reviews too.

- This was done the same way as the restaurant owner adding pics!

### Real-Time Reviews

Use [StimulusReflex](https://docs.stimulusreflex.com) to make posting comments happen in without a page reload and [CableReady](https://cableready.stimulusreflex.com) to make viewers see those same comments come in in real-time

-Unfortunately I did not get to tackle this one which is a huge mistake since I know that is what you are in the middle of implementing. I read up on it but just did not have enough time.

### Clean the Look Up

Whoever designed this didn't do a great job. Take advantage of Bootstrap and add your own touch to make it look pretty.

- I did not have time to do this either but I am familiar with bootstrap and materialize. The banana pepper sauce website that I sent you was styled that way beginning from an ugly 'starter tempplate'.

### Helpful Reviews

Users could mark reviews they read as helpful. There should be a record of this so that they could later go back and see which reviews
they marked as helpful in the past. 

- I was able to add this and have the saved reviews displayed on the home page as links back to the restaurant's show page from where the review was saved. I would have had this go directly to a review show page but that did not exist and I thought that this made the most sense to go back to where you could see it. The one thing I TRIED and maybe should have kept it simpler was to implement a little jquery and javascript to change the words "Save Review" under the reviews on the restaurant show page to "UnSave Review" when the review was saved. In previous projects I made a conditional around the link to show this change but I thought the code looked cleaner this way using a helper method from the application controller. Now when you click 'Save Review' two times in a row it will add the review and then delete it from your saved reviews but the word does not change. Either way it works and I have the reviews getting saved and we can look at them although I would keep working on this in the real world to have that word change back and forth depending on if the review was saved or not. 
