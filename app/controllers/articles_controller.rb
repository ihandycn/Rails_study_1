class ArticlesController < ApplicationController
    
    # http_basic_authenticate_with name: "feng", password: "123", except: [:index, :show]
    
    def index
        @articles = Article.all
        # puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        # puts render_to_string
        # puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end
  
    def show
        @article = Article.find(params[:id])
        # @article = Article.find_by(:id params[:id])
        if @article.nil?
            redirect_to action: :index
        end
        
        @someone = Article.find_by(id: 4)
        
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~[S]"
        puts render_to_string
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~[E]"
    end
  
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
 
        if @article.save
            redirect_to @article
            # render @article
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
 
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
     
      redirect_to articles_path
    end
    
    def test
        # render file: '/home/ubuntu/workspace/public/500.html'
        # render plain: 'OK'
        # j = {"name"=>"lxee","age"=>25,"sex"=>"男"}
        # render json: j
        
        # render js: "alert('Hello Rails');" can not run
        
        # render body: "Hello jj"
        # render status: 500 can not work
        redirect_to '/articles/3'
        head :bad_request
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
