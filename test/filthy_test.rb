require File.join(File.dirname(__FILE__), %w[helper])

class MovieTest < Test::Unit::TestCase

  context "filthy_attributes" do
    setup do
      @movie = Movie.new
    end

    context "with passed attributes" do
      context "on a new record" do
        should "create accessors" do
          assert_nil @movie.director_filthy
          assert_nil @movie.title_filthy
        end

        should "create boolean methods" do
          assert !@movie.director_filthy?
          assert !@movie.title_filthy?
        end
      end
      
      context "after_save" do
        setup do
          @movie.title = "The Dream Warrior"
          @movie.save
        end
        
        context "when only title changed" do
          should "be true for filthy attributese" do
            assert @movie.title_filthy?
            assert !@movie.director_filthy?
          end
        end
        
        context "after another save" do
          setup do
            @movie.director = "Rob Zombie"
            @movie.save
          end
          
          should "be true for filthy attributes" do
            assert !@movie.title_filthy?
            assert @movie.director_filthy?
          end
          
          context "after another save when nothing changed" do
            setup do
              @movie.save
            end
            
            should "not have filthy attributes" do
              assert !@movie.title_filthy?
              assert !@movie.director_filthy?
            end
          end
        end
      end
    end
  end

end

