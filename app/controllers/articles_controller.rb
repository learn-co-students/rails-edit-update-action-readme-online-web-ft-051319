class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end
   
  def update
    #raise params.inspect
    # Query the database for the Article record that matches the :id passed to the route.
    # Store the query in an instance variable./
    @article = Article.find(params[:id])
    # Update the values passed from the form (the update method here is the update method supplied by Active Record, not the update method we're creating). The update method takes a hash of the attributes for the model as its argument, e.g. `Article.find(1).update(title: "I'm Changed", description: "And here too!")
    @article.update(title: params[:article][:title], description: params[:article][:description])
    #redirect to the show page to view updated record 
    redirect_to article_path(@article)
  end

  # add edit and update methods here
end
