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
@movie.title = "28 days later"
@movie.title_filthy?
=> false
@movie.save
=> true
@movie.title_filthy?
=> true
@movie.save
=> true
@movie.title_filthy?
=> false
```

# Credits

Filthy is maintained by [Mike Taylor](http://github.com/sealabcore) and is funded by [BookRenter.com](http://www.bookrenter.com "BookRenter.com"). Many of the ideas that have inspired Filthy come from practical usage by the Bookrenter software development team and conversations with Bookrenter developers [Andrew Wheeler](http://github.com/jawheeler), [Michael Pearce](http://github.com/michaelgpearce), [Philippe Huibonhoa](http://github.com/phuibonhoa), and [Ben Somers](http://github.com/bensomers).

![BookRenter.com Logo](http://assets0.bookrenter.com/images/header/bookrenter_logo.gif "BookRenter.com")

# Copyright

Copyright (c) 2012 Mike Taylor, Bookrenter.com.
