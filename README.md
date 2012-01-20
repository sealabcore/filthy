# Filthy

Rails gem to check if an attribute was changed on the last save. Useful in after_save callbacks.

# Install
```bash
gem install filthy
```
### Usage

```ruby
class Movie < ActiveRecord::Base
  
  filthy_attributes :title, :director

end

@movie = Movie.find(1)
@movie.title = "Ernest Goes To Prison"
@movie.title_filty?
=> false
@movie.save
=> true
@movie.title_filty?
=> true
@movie.save
=> true
@movie.title_filty?
=> false
```

# Credits

Filthy is maintained by [Mike Taylor](http://github.com/sealabcore) and is funded by [BookRenter.com](http://www.bookrenter.com "BookRenter.com"). Many of the ideas that have inspired Filthy come from practical usage by the Bookrenter software development team and conversations with Bookrenter developers [Andrew Wheeler](http://github.com/jawheeler), [Michael Pearce](http://github.com/michaelgpearce), and [Philippe Huibonhoa](http://github.com/phuibonhoa).

![BookRenter.com Logo](http://assets0.bookrenter.com/images/header/bookrenter_logo.gif "BookRenter.com")

# Copyright

Copyright (c) 2012 Mike Taylor, Bookrenter.com.
