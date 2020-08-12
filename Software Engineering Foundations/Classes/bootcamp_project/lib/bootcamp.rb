class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = [] }
    end
    def name
      @name
    end
    def slogan
        @slogan
    end
    def teachers
        @teachers
    end
    def students
        @students
    end
    def hire(teacher_name)
        teachers << teacher_name
    end
    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end
    def enrolled?(student)
        @students.include?(student)
    end
    def student_to_teacher_ratio
        @students.length / @teachers.length
    end
    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end
    def num_grades(student)
        return @grades[student].length
    end
    def average_grade(student)
        if enrolled?(student) && @grades[student].length > 0
            average = @grades[student].inject{ |sum, el| sum + el } / @grades[student].length
        else
            return nil
        end
    end
end