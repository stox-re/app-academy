require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('../questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM users
      WHERE fname = ? AND lname = ?
    SQL
    data.map { |datum| User.new(datum) }.first
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    data.map { |datum| User.new(datum) }.first
  end

  def initialize(options)
    @id = options["id"]
    @fname = options["fname"]
    @lname = options["lname"]
  end

  def save
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Replies.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    # Average number of likes for a User's questions
    data = QuestionsDatabase.instance.execute(<<-SQL, @id, @id)
      SELECT
        (
          SELECT COUNT(*)
          FROM   questions
          WHERE questions.user_id = ?
        ) AS count_questions,
        (
          SELECT COUNT(*)
          FROM   question_likes
          JOIN questions ON questions.id = question_likes.question_id
          WHERE questions.user_id = ?
        ) AS question_likes
      FROM questions
    SQL
    (data.first["question_likes"] * 1.0) / data.first["count_questions"]
  end
end

class Question
  attr_accessor :id, :title, :body, :user_id

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE user_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    data.map { |datum| Question.new(datum) }.first
  end

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @user_id = options["user_id"]
  end

  def save
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def author
    User.find_by_id(@user_id)
  end

  def replies
    Replies.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.num_likes_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
end

class QuestionFollow
  attr_accessor :id, :user_id, :question_id

  def self.most_followed_questions(n)
   data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.*
      FROM questions
      JOIN question_follows ON question_follows.question_id = questions.id
      WHERE questions.id IN (
        SELECT question_id
        FROM question_follows
        GROUP BY question_id
        ORDER BY count(question_id)
        LIMIT ?
      )
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.id, users.fname, users.lname
      FROM users
      JOIN question_follows ON question_follows.user_id = users.id
      WHERE question_follows.question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.id, questions.title, questions.body, questions.user_id
      FROM questions
      JOIN question_follows ON question_follows.question_id = questions.id
      WHERE question_follows.user_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_follows
      WHERE id = ?
    SQL
    data.map { |datum| QuestionFollow.new(datum) }.first
  end

  def initialize(options)
    @id = options["id"]
    @user_id = options["user_id"]
    @question_id = options["question_id"]
  end
end

class Replies
  attr_accessor :id, :question_id, :author_user_id, :parent_reply_id, :body

  def self.find_by_question_id(question_id)
   data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE author_user_id = ?
    SQL
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    data.map { |datum| Replies.new(datum) }.first
  end

  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @author_user_id = options["author_user_id"]
    @parent_reply_id = options["parent_reply_id"]
    @body = options["body"]
  end

  def author
    User.find_by_id(@author_user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Replies.find_by_id(@parent_reply_id)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT *
      FROM replies
      WHERE parent_reply_id = ?
    SQL
    data.map { |datum| Replies.new(datum) }
  end
end

class QuestionLike
  attr_accessor :id, :user_id, :question_id

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.*
      FROM questions
      JOIN question_likes ON question_likes.question_id = questions.id
      WHERE questions.id IN (
        SELECT question_id
        FROM question_likes
        GROUP BY question_id
        ORDER BY count(question_id)
        LIMIT ?
      )
      GROUP BY question_id
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.*
      FROM questions
      JOIN question_likes ON question_likes.question_id = questions.id
      WHERE question_likes.user_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT count(*)
      FROM question_likes
      WHERE question_id = ?
    SQL
    data.first["count(*)"]
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.*
      FROM users
      JOIN question_likes ON question_likes.user_id = users.id
      WHERE question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_likes
      WHERE id = ?
    SQL
    data.map { |datum| QuestionLike.new(datum) }.first
  end

  def initialize(options)
    @id = options["id"]
    @user_id = options["user_id"]
    @question_id = options["question_id"]
  end
end