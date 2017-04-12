# Studious
- Studious is a web application designed to allow students to create and maintain a portfolio of their accomplishments with the intent that when they apply to universities, internships, camps, jobs, or other institutions they can have a place where they can represent themselves and their projects in a more full-fledged and personal manner than an application.
- It is not meant to supplant the application process, but, rather, to supplement a student’s application.
- Students can submit portfolios through either a shared link or directly to registered institutions. The shared link can be viewed by anyone, while sharing directly with an institution gives the employees of that institution an interface to view and comment portfolios that are relevant only to themselves.

## ERD
![ERD](/ERD.png)

## System dependencies
- There really aren't any special system dependencies.


## Database creation
- In terminal, navigate to the directory where you downloaded this app, and create a database for it: `rails db:create`
- Next, lets set up the database with our models. Run: `rails db:migrate`
- Once your database is up, you can rake the two tasks, `rails institution:import` and `rails quotes:import`


## Database initialization
### IMPORTANT! Running the seed file will delete all the data except for institutions and quotes.
- Rake tasks for institutions and quotes to seed those tables.
- Once that is done, you probably want to set up a number of different users. Create a user using the registration then, in the rails console, change the role to superuser.
- That user can access the rails-admin route from "/superuser", which will allow you to "register" institutions and to create student, processor, and admin users.
- Processors and Admins need to be associated with a registered institution.
- Students will only be able to submit their portfolios to registered institutions.


## Configuration
- There really isn't anything tricky to configure. In order for images to work you have to get an api key from cloudinary and save it into a .env file.


## Deployment of a local server
- In the app directory, you'll need to install the required gems, run `bundle install` in terminal.
- Spin up a local puma server, use `rails server`. This is set up on localhost:3000.


## Testing
- There are some tests for models, but other than that I haven't gotten around to it yet. The test environment is
using rspec-rails and factory girl.


### Ruby version
- ruby "2.3.3"

### Rails version
- rails "5.0.2"
