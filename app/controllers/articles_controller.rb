class ArticlesController < ApplicationController
   
   def home
      
   end   
   
   def index
       @articles = Article.all
   end
       
   
   def new
      @article = Article.new
   end
   
   def create
   @article = Article.new(article_params)
      if @article.save
         flash[:success] = "Articles was successfully created!!" 
         redirect_to article_path(@article)
      else
          render 'new'
      end
   end
   
   def edit
      @article = Article.find(params[:id]) 
   end
   
   def update
      @article = Article.find(params[:id]) 
      if @article.update(article_params)
      flash[:success] = "Article has been successfully edited"
      redirect_to article_path(@article)
      else
      render 'edit'
      end
  
   end
   
   
   def show
      @article = Article.find(params[:id]) 
   end
   
   def destroy
      @article = Article.find(params[:id])
      flash[:danger] = "This article is now deleted"
      @article.destroy
      redirect_to articles_path(@article)
   end
       
   private
   def article_params
       params.require(:article).permit(:title, :description)
   end
end