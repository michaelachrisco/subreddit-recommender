# (Alpha) SubReddit Recommender

This application is a relation engine based on SubReddit posts. Its used as a starting point for other applications to consume its relation data.

TODO:
* install instructions
* Rake tasks
* Deployment instructions
* Bower assets
* ...


## Rake tasks

```
rake subreddits:seed                     # Seeds SubReddits
rake subreddits:relate                   # Relates SubReddits via Simularity
rake subreddits:relate_tfidf             # Relates SubReddits via TFIDF
```

## Vagrant

You can use Vagrant to spin up a virtual machine to run subreddit-recommender. To do this, simply:
* Download and install VirtualBox from https://www.virtualbox.org/
* Download and install Vagrant from https://www.vagrantup.com/
* Download or clone this repo to a directory on your local machine
* Open a Terminal or Command Prompt window in the above directory
* Run the following command:

```
vagrant up
```

This will automatically set up a VirtualBox VM running Ubuntu 15.10 Server, with all the prerequisites for subreddit-recommender installed, and then clone subreddit-recommender into the /home/vagrant/repos/git/michaelachrisco/subreddit-recommender/ directory on the VM. You can run it from there.
