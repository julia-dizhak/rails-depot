require "test_helper"

=begin
- We ensured that required fields are present.
• We ensured that price fields are numeric and at least one cent.
• We ensured that titles are unique.
• We ensured that images match a given format.
=end


class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any? 
    assert product.errors[:price].any? 
    assert product.errors[:image_url].any?
  end

  test "price for product must be not negative" do
    product = Product.new(title: "My Book Title",
                          description: "yyy", 
                          image_url: "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  test "price for product must be greated than or equal to 0.01" do
    product = Product.new(title: "My Book Title",
                          description: "yyy",
                          image_url: "zzz.jpg")
    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  test "price for product must be positive" do
    product = Product.new(title: "My Book Title",
                          description: "yyy",
                          image_url: "zzz.jpg")
    product.price = 1
    assert product.valid?
  end

  test "product is not valid without a unique title" do 
    product = Product.new(title: products(:ruby).title,
                          description: "test description",
                          price: 1, 
                          image_url: "ruby.jpg")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title] 
  end

  test "product is not valid without a unique title - i18n" do 
    product = Product.new(title: products(:ruby).title,
                          description: "yyy", 
                          price: 1, 
                          image_url: "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  def new_product(image_url) 
    Product.new(title: "My Book Title",
                description: "yyy",
                price: 1,
                image_url: image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} must be valid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} must be inalid"
    end
  end
end
