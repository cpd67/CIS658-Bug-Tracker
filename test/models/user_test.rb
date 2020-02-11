require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Tests for the User model

  def setup
    @user = User.create({:fname => 'Barry', :lname => 'Giggles', :email => 'dev@dev.com', :thumbnail => 'test.jpg'})
  end

  def test_missing_fname
    # A User without a fname will be invalid.
    @user.fname = ''
    assert_not @user.valid?
  end

  def test_missing_lname
    # A User without a lname will be invalid.
    @user.lname = ''
    assert_not @user.valid?
  end

  def test_missing_email
    # A User without an email will be invalid.
    @user.email = ''
    assert_not @user.valid?
  end

  def test_unique_email
    # A User with a duplicate email will be invalid.
      user = User.new({:fname => 'Barry', :lname => 'Giggles', :email => @user.email, :thumbnail => 'test.jpg'})
      assert_not user.valid?
  end

  def test_valid_email
    # A User with a bad email will be invalid.
    @user.email = 'dev.com'
    assert_not @user.valid?
  end

  def test_valid_thumbnail
    # A User with a thumbnail that is not .jpg, ,png, or .gif will be invalid.
    user2 = User.new({:fname => 'Sarah', :lname => 'Sanders', :email => 'testSarah@dev.com', :thumbnail => 'test.png'})
    user3 = User.new({:fname => 'Harry', :lname => 'Muffins', :email => 'testHarry@dev.com', :thumbnail => 'test.gif'})

    assert @user.valid?
    assert user2.valid?
    assert user3.valid?

    @user.thumbnail = 'test.zip'
    assert_not @user.valid?
  end
end
