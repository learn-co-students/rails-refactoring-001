---
tags: rails, refactoring, separation or concerns, DRY, intermediate
language: ruby
resources: 1
---

# Rails Refactoring

As we develop our programming skills, it's important not only to have our code working, but for it to be well designed. Refactoring is a process that should become a part of the way you write code, much like revision and editing while you write. As you become a better developer, you should be incorporating refactoring patterns into your design before you build, instead of just "editing" your code.

In this lab we're going to focus on refactoring Github API calls for a simple app that fetches repositories and issues within an organization. API calls will be made with the [Typhoeus gem](https://github.com/typhoeus/typhoeus). 

## Todo:

* register this app on Github and install Figaro to handle the API id and secret keys; this app uses Omniauth with Github
* Start up the server and play around with the app, which is currently fully functioning
* We're going to focus on refactoring the code in the GithubConnection class, which handles making get requests.
* Read through this Readme and the resources
* There are a few tests that are passing with the current code; make sure your refactor code also passes the tests.

## Methodology

There are two things we're going to focus on when we refactor this code: DRY and Seperation of Concerns.

### Don't Repeat Yourself

This is pretty straighforward. Further abstract to avoid repetition. If you have a few methods that accomplish something similar, consolidate. If you have a few classes that share functionality, abtract it into a module. Instead, have a method accept arguments to account for variability. This will help if you need to make changes: you only need to implement the change in one place instead of many.

### Separation of Concerns

Methods, and to some extent classes, should focus on doing one thing. Build smaller methods and build many of them. Treat them as helper methods. Call these helper methods within other methods. This makes for a better organized codebase that will be easier to change as your application grows.

## Helpful Hint

In our GithubConnection class, we have three methods that are basically doing the same thing: making a get request, getting the response, and parsing it. Think of how you can make a few helper methods for each of these actions, so that instead each of the get request methods doing them individually, they call these new helper methods and just return the unique data our controllers want.

## Resources

* [RailConf 2014: All the Small Things by Sandi Metz](https://www.youtube.com/watch?v=8bZh5LMaSmE)

