require File.join(File.dirname(__FILE__), %w[helper])

class MovieTest < Test::Unit::TestCase

  context "filthy_attributes" do
    setup do
      @movie = Movie.new
    end

    context "with no arguments" do
      should "raise an ArgumentError" do
        assert_raise(ArgumentError) { Movie.filthy_attributes }
      end
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
  
  context "a model without filthy attributes" do
    setup do
      @actor = Actor.new
    end
    
    should "save" do
      assert @actor.save
    end
  end
  
  context "a model with filthy attributes" do
    context "with a subclass with no filthy_attributes defined" do
      setup do
        @short = Short.new
        @short.title = "Intruder"
        @short.save
      end
      
      should "have filthy attributes" do
        assert !@short.director_filthy?
        assert @short.title_filthy?
      end
    end

    context "with a subclass with different filthy_attributes defined" do
      should "inherit the parent class's filthy attributes and add to them" do
        assert_same_elements [:best_boy_grip, :title, :director], Documentary.filthy_columns
        assert_same_elements [:iphone_movie, :title, :director], ReallyShort.filthy_columns
      end

      should "not alter the parent class's filthy attributes" do
        assert_same_elements [:title, :director], Movie.filthy_columns
      end
    end
  end

    
end

