# Abstraction and Encapsulation

# Abstraction is the process of exposing essential features of an object while
# hiding inner details that are not necessary to using the feature

# Having "Enroll" as a method of course is nicely abstracting
class Course
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def enroll(student)
    @students << student if @students.length < @max_students
  end
end

course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

course.enroll("Alice")

# Encapsulation is giving users only variables that are safe for them to use.
# Example is not giving access to certain variables inside a class for security