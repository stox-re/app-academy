--------------------------MVC--------------------------------------

# Rails is a MVC web application framework
# Model View Controller = MVC

# Model is in charge of retrieval of information from storage, and any logic done to it

# View is in charge of presenting information

# Controller is in charge of constructing HTTP response, and sends commands to the model to fetch or update information.
# It acts as an interface between the model and view

--------------------------Convention over Configuration----------------------------------

# Rails introduced the concept of Convention over Configuration
# If we have a cats databse table, the default model is called Cats, and the default controller is called CatsController
# Rails will automatically know how to load the application to tie everything together

--------------------------REST---------------------------------

# REST stands for: Representational State Transfer, and is an architectural style for web apps
# Access to web resources via standard operations, such as HTTP's GET, POST, PATCH, or DELETE

# RESTful web services are stateless; this means that each request/response cycle is independent
# of any other request/response cycle. The server will not retain any session information over
# multiple requests. However, data can be cached on the client side.

# Rails defaults to a RESTful API using its resources method,
# which automatically generates routes by linking HTTP verbs and URIs to controller actions.

------------------------Active Record and ActionContoller ----------------------------------------

# All models in Rails inherit from ActiveRecord. It is an ORM, object relational mapping
# ActionController handles controller logic. Allows for access to various cookies.
# It can also provide protection against cross site forgery attacks (CSRA) by checking the presence
# of authenticity tokens in requests that could modify data.

------------------------ActionView----------------------------------------

# Responsible for rendering views. Can take several forms, one of which is ERB, embedded Ruby.
# It is a mix of html and ruby.

# Another supported file type is a builder file. Instead of rendering HTML,
# a view could instead render XML or JSON. This is incredibly useful for a
# route that only returns data that will then be parsed later by more code.

------------------------Rake----------------------------------------

# Rake is a utility tool that handles task management
# It's like a scripting tool for rails, to do admin tasks like migrating a DB or displaying routes.

------------------------Rack----------------------------------------

# A piece of middleware that sits between Rails router and the web server (WEBrick or Puma),
# receiving http requests from the server and generating responses using information from the router.

------------------------Rack----------------------------------------

# An http server that ships with rails 4. It is single threaded and can only handle 1 request at a time.
# Good for development, bad for production

------------------------Puma----------------------------------------

# Multi threaded http server, good choice for production

------------------------Other frameworks----------------------------------------
# Node - Javascript MEAN Stack, or MERN Stack, MongoDB, ExpressJS, Angualar/React, NodeJS
# Sinatra - Ruby, good for small apps, bad for scalability
# Django - Python MVC Framework
# Spring MVC Java - Can be very slow
# Play! (Scala) - Scala or Java, support hot reload, lack of plugins.
# ASP.NET MVC(.NET) - Microsoft for .NET
# Laravel PHP - most popular language server side language is php. PHP is easier to learn than ruby,
# designed to be a scripting language. It's more flexible because rails is more structured.

------------------------New Rails Project----------------------------------------

rails new DoggyDayCare -d=postgresql
bundle exec rails db:create
bundle exec rails generate migration createDogs # lives in /db/migrate/
bundle exec rails db:migrate # /creates /db/schema.rb
bundle exec rails db:migrate:status

#Now made changes to /db/migrate/item...

# Once setup
bundle exec rails console
dog = dog.new
dog.name = "Clifford the Big Red Dog"
dog.save
Dog.first
Dog.find(1) # id number
Dog.find_by({name: "Clifford the Big Red Dog"})
Dog.all
# Instead of dog.new and dog.save, you can use Dog.create
Dog.create({ name: "Snoopy" })
Dog.last
Dog.last.destroy
# opens pry if you have pry-rails gem added to GemFile

------------------------Migrations----------------------------------------
create_table :products do |t|
  t.string :name
  t.float :price

  t.timestamps
end
# Supported column types:
# :boolean
# :date
# :datetime
# :float
# :integer
# :string
# :text
# :time

# Other methods, after you create a table and want to make changes

# add_column :table_name, :column_name, :type, options_hash
# remove_column :table_name, :column_name
# rename_column :table_name, :old_column_name, :new_column_name
# rename_table :old_table_name, :new_table_name
# add_index :table_name, [:column1, :column2], options_hash
# change_column :table_name, :column_name, :type, options_hash

------------------------Dont edit old migrations----------------------------------------
# The answer is simple in these cases: you should write a new migration that performs the
# changes you require. Edit migrations by creating new migrations to change your table.

------------------------Rails ORM----------------------------------------
# return an array of Physician objects, one for each row in the
# physicians table
Physician.all

# lookup the Physician with primary key (id) 101
Physician.find(101)

# return an array of Physicians based in La Jolla
Physician.where('home_city = ?', 'La Jolla')
# Executes:
#   SELECT *
#     FROM physicians
#    WHERE physicians.home_city = 'La Jolla'

# With rails magic
Physician.where(
  home_city: 'La Jolla'
)

# physicians at any of these three schools
Physician.where(college: ['City College', 'Columbia', 'NYU'])
# => SELECT * FROM physicians WHERE college IN ('City College', 'Columbia', 'NYU');
# physicians with 3-9 years experience
Physician.where(years_experience: (3..9))
# => SELECT * FROM physicians WHERE years_experience BETWEEN 3 AND 9

# create a new Physician object
jonas = Physician.new
# set some fields
jonas.name = 'Jonas Salk'
jonas.college = 'City College'
jonas.home_city = 'La Jolla'
jonas.save!
# Notice that I use #save!; you may have also seen the plain ol' #save.
# The difference between the two is that #save! will warn you if you fail to save the object,
# whereas #save will quietly return false (it returns true on success).

jonas.destroy

------------------------Associations----------------------------------------

class CreateCoursesAndProfessorsTables < ActiveRecord::Migration[5.1]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :thesis_title

      t.timestamps
    end

    create_table :courses do |t|
      t.string :course_name
      t.integer :professor_id
    end
  end
end

# Associations tells activerecord that there is an association between the two

class Course < ApplicationRecord
  belongs_to(
    :professor,
    class_name: 'Professor',
    foreign_key: :professor_id,
    primary_key: :id
  )
end

class Professor < ApplicationRecord
  has_many(
    :courses,
    class_name: 'Course',
    foreign_key: :professor_id,
    primary_key: :id
  )
end

# Now the methods are available
course.professor
professor.courses

# NB: As of Rails 5, belongs_to associations are validated for presence by default.
# You can opt-out of this behavior (ie. allow the association to be null) by adding the
# key-value pair optional: true to your association like so:

class Course < ApplicationRecord
  belongs_to(
    :professor,
    class_name: 'Professor',
    foreign_key: :professor_id,
    primary_key: :id,
    optional: true
  )
end

------------------------Validations----------------------------------------
class Person < ApplicationRecord
  validates :name, presence: true
end

Person.create(name: 'John Doe').valid? # => true
Person.create(name: nil).valid? # => false
p.errors
p = Person.create
#=> #<Person id: nil, name: nil>
p.errors.full_messages
#=> ["Name can't be blank"]

class Person < ApplicationRecord
  # must have name, login, and email
  validates :name, :login, :email, presence: true
end
# It uses the blank? method

class LineItem < ApplicationRecord
  belongs_to :order
  validates :order, presence: true
end

class Account < ApplicationRecord
  # no two Accounts with the same email
  validates :email, uniqueness: true
end

class Holiday < ApplicationRecord
  # no two Holidays with the same name for a single year
  validates :name, uniqueness: {
    scope: :year,
    message: 'should happen once per year'
  }
end

# Less common helpers
format - tests against a regex
length - minimum and maximum
numericality - options include greater_than/greater_than_or_equal, less_than, less_than_or_equal
inclusion - in option is an array of values

# Rails 5 automatically validates the presence of a belongs_to association. To make it optional:
class Home < ApplicationRecord
  has_many :cats,
    primary_key: :id,
    foreign_key: :home_id,
    class_name: :Cat
end

class Cat < ApplicationRecord
  belongs_to :home,
    primary_key: :id,
    foreign_key: :home_id,
    class_name: :Home,
    optional: true
end

# If a cat can exist without a home.
# We must specifically refrain from validating our belongs_to associations if we want them to have presence = true

------------------------Custom Validations----------------------------------------
class Invoice < ApplicationRecord
  # validate tells the class to run these methods at validation time.
  validate :discount_cannot_be_greater_than_total_value

  private
  def discount_cannot_be_greater_than_total_value
    if discount > total_value
      errors[:discount] << 'can\'t be greater than total value'
    end
  end
end

# Sometimes an error is not specific to any one attribute.
# In this case, you add the error to errors[:base]. Since errors[:base] is an array,
# you can simply add a string to it and it will be used as an error message.
class Person < ApplicationRecord
  def a_method_used_for_validation_purposes
    errors[:base] << 'This person is invalid because ...'
  end
end

# An email regex custom validator class, rather then a method.

# app/validators/email_validator.rb
class EmailValidator < ActiveModel::EachValidator
  CRAZY_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def validate_each(record, attribute_name, value)
    unless value =~ CRAZY_EMAIL_REGEX
      # we can use `EachValidator#options` to access custom options
      # passed to the validator.
      message = options[:message] || 'is not an email'
      record.errors[attribute_name] << message
    end
  end
end

# app/models/person.rb
class Person < ApplicationRecord
  # Rails knows `:email` means `EmailValidator`.
  validates :email, presence: true, email: true
  # not required, but must also be an email
  validates :backup_email, email: { message: 'isn\'t even valid' }
end

# Allow nil
class Coffee < ApplicationRecord
  validates :size, inclusion: { in: %w(small medium large),
    message: "#{value} is not a valid size" }, allow_nil: true
end

# Allow blank
class Topic < ApplicationRecord
  validates :title, length: { is: 5 }, allow_blank: true
end

Topic.create(title: '').valid?  # => true
Topic.create(title: nil).valid? # => true

# :message option lets you specify a custom error message

# validate IF something
class Order < ApplicationRecord
  validates :card_number, presence: true, if: :paid_with_card?

  def paid_with_card?
    payment_type == 'card'
  end
end

------------------------Indexing----------------------------------------
# Indexing makes something go from O(n) to O(log n)
# Foreign keys are pretty much always a good idea to index
# They make INSERT, DELETE and UPDATEs more taxing because the index needs to be updated.
# So don't index everything

class User < ApplicationRecord
  has_many :conversations, foreign_key: :user_id
end

class Conversation < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
end

# Here we want an index on conversations to lookup user.conversations, so we add an index to user_id on Conversations
class AddUserIdIndexToConversations < ActiveRecord::Migration[5.1]
  def change
    add_index :conversations, :user_id
  end
end

# Make usernames unique on an index
class MakeUsernamesUnique < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :username, unique: true
  end
end

# Ensure uniqueness of combinations of values
class EnsureUnique < ActiveRecord::Migration[5.1]
  def change
    add_index :conversations, [:user_id, :title], unique: true
  end
end
# This ensures that there can be no more than one entry in the
# conversations table with the same user_id and title - useful if want
# to allow multiple conversations to have the same title, but not for the same user.

------------------------Includes----------------------------------------
# Instead of doing n+1 queries, use includes to do it in one query
posts = self.posts.includes(:comments)
comments = user.comments.includes(:post, :parent_comment)
posts = user.posts.includes(:comments => [:author, :parent_comment])
first_post = posts[0]

------------------------Just counts----------------------------------------
 posts_with_counts = self
      .posts
      .select("posts.*, COUNT(*) AS comments_count") # more in a sec
      .joins(:comments)
      .group("posts.id") # "comments.post_id" would be equivalent

posts_with_counts.map do |post|
  # `#comments_count` will access the column we `select`ed in the
   # query.
  [post.title, post.comments_count]
end

# The default for joins is to perform an INNER JOIN.
# In the previous example we will not return any posts with zero comments
# because there will be no comment row to join the post against.

# If we want to include posts with zero comments, we need to do an outer join. We can do this like so:
posts_with_counts = self
  .posts
  .select('posts.*, COUNT(comments.id) AS comments_count')
  .left_outer_joins(:comments) #still the name of the association
  .group('posts.id') # "comments.post_id" would be equivalent

------------------------Scopes----------------------------------------
# Keep code DRY for commonly made queries

class Post < ApplicationRecord
  def self.by_popularity
    self
      .select('posts.*, COUNT(*) AS comment_count')
      .joins(:comments)
      .group('posts.id')
      .order('comment_count DESC')
  end
end

# Returns a relation object so we can add on other methods
posts = Post.by_popularity.limit(5)
posts.count

# Can be used through associations
User.first.posts.by_popularity

------------------------Finders----------------------------------------
# Where returns an array of ActiveRecord objects
# Find and Find_by returns only 1 item matching the query
Application.find_by(email_address: 'ned@appacademy.io')
Application.find(4)
# ::find_by accepts an options hash, which allows us to specify as many criteria as necessary

------------------------Order, Group, and Having----------------------------------------
Client.order('orders_count ASC, created_at DESC').all

UserPost
  .joins(:likes)
  .group('posts.id')
  .having('COUNT(*) > 5')

# Aggregations
# You can perform all the typical aggregations:
Client.count
Orders.sum(:total_price)
Orders.average(:total_price)
Orders.minimum(:total_price)
Orders.maximum(:total_price)

------------------------Finding by SQL----------------------------------------
Case.find_by_sql(<<-SQL)
  SELECT
    cases.*
  FROM
    cases
  JOIN (
    -- the five lawyers with the most clients
    SELECT
      lawyers.*
    FROM
      lawyers
    LEFT OUTER JOIN
      clients ON lawyers.id = clients.lawyer_id
    GROUP BY
      lawyers.id
    SORT BY
      COUNT(clients.*)
    LIMIT 5
  ) ON ((cases.prosecutor_id = lawyer.id)
         OR (cases.defender_id = lawyer.id))
SQL

# If you have a parameterized query, you must pass everything in an array

Post.find_by_sql([
  'SELECT title FROM posts WHERE author = ? AND created > ?',
  author_id,
  start_date
])