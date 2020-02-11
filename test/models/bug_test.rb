require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # Tests for the Bug model.
  # The following resource was helpul in writing these tests: https://cis.gvsu.edu/~kurmasz/Teaching/Courses/W20/CIS658/LectureNotes/DemoScripts/RailsDemo02.html

  def setup
    @bug = Bug.create(title: 'Bees are at it again', description: 'Yep. They are.')
  end
  
  def test_missing_title
    # A Bug without a title will be invalid.
    @bug.title = ''
    assert_not @bug.valid?
  end

  def test_missing_description
    # A Bug without a description will be invalid.
    @bug.description = ''
    assert_not @bug.valid?
  end

  def test_default_values
    # A Bug will have default values for issue_type, priority, and status.
    assert_equal(@bug.issue_type, "feature", 'Issue type is not the expected value')
    assert_equal(@bug.priority, "medium", 'Priority is not the expected value')
    assert_equal(@bug.status, "open", 'Status is not the expected value')
  end

  def test_issue_type_validation
    # A Bug cannot have an invalid issue type.
    valid_issue_types = [:issue, :enhancement, :feature]
    valid_issue_types.each do |issue_type|
      begin
        @bug.issue_type = issue_type
        assert true
      rescue
        assert false, '#{issue_type} should be invalid'
      end
    end
  end

  def test_priority_validation
    # A Bug cannot have an invalid priority.
    valid_priorities = [:low, :medium, :high]
    valid_priorities.each do |priority|
      begin
        @bug.priority = priority
        assert true
      rescue
        assert false, '#{priority} should be invalid'
      end
    end
  end

  def test_status_validation
    # A Bug cannot have an invalid status.
    valid_statuses = [:open, :closed, :monitor]
    valid_statuses.each do |status|
      begin
        @bug.status = status
        assert true
      rescue
        assert false, '#{status} should be invalid'
      end
    end
  end
end
