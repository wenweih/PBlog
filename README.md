# PBlog
A awesome personal website based on Ruby on Rails and Semantic-UI  
## Features
- SEO friendly
- Manage you posts and resume
- Simple and elegant responsive UI
- The source code clearly for Ruby on Rails to study
- Manage comments, contract messages on you own without any limit

## Getting Started
Now, with a few command and modify some description, you can own a geek personal webpage, here we go.  
### Prerequisites
PBlog is a Ruby on Rails webApp. We assume a live *nix service with Rails environment.  

- Ruby (>2.3.1)
- Mysql (> 14)
- Nginx
- [pow](https://github.com/basecamp/pow) a tool for MacOS user developer Rack App  
  > not necessary (Zero-configuration Rack server for MacOS)

## installing
A step by step introduce to run in local machine and deploy to server. Deadly simple! 😂  

```
// modify config/database.yml configuration
git clone https://github.com/wenweih/PBlog.git
cd PBlog
bundle install
rails db:setup
```

### Development
- Pow: ```ln -s the_path_of_PBlog ~/.pow/blog```  
  now you can visit ```blog.dev```
- or ```rails s```  
  now you can visit ```localhost:3000```

### Production
```
// modify config/database.yml configuration
git clone https://github.com/wenweih/PBlog.git
cd PBlog
bundle install
RAILS_ENV=production rails db:setup
RAILS_ENV=production rails assets:precompile
RAILS_ENV=production rake secret
// after generate a random string, replace config/secrets.yml with is
RAILS_ENV=production puma -C config/puma.rb
```
## Screenshot
PC  
![home index](./doc/show.png)  

![home index](./doc/show-2.gif)  

![home index](./doc/post-index.gif)  

Mobile

![home index](./doc/mobile-index.png)  

![home index](./doc/mobile-post-show.png)  
