require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true if for draft blog post" do
    assert blog_posts(:draft).draft?
  end
  
  test "draft? return false for published blog posts" do
    refute blog_posts(:published).draft?
  end
  
  test "draft? returns false for scheduled blog posts" do
    refute blog_posts(:scheduled).draft?
  end
  
  test "published? returns true for published posts" do
    assert blog_posts(:published).published?
  end
  
  test "published? return false for draft posts" do
    refute blog_posts(:draft).published?
  end
  
  test "published? return false for scheduled posts" do
    refute blog_posts(:scheduled).published?
  end
  
  test "scheduled? return true for scheduled posts" do
    assert blog_posts(:scheduled).scheduled?
  end
  
  test "scheduled? return false for draft posts" do
    refute blog_posts(:draft).scheduled?
  end
  
  test "scheduled? return false for published posts" do
    refute blog_posts(:published).scheduled?
  end
  
  
end
