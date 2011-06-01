class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def about
    @title = "About Nathaniel Barnes"
  end
  
  def contact
    @title = "Contact Nathaniel Barnes"
  end
  
  def resume
    @title = "Resume for Nathaniel Barnes"
  end
  
  def copyright
    @title = "Copyright Stuff"
  end
end
