=begin
# There’s a dental office called Dental People Inc.  Within this office, there’s 2 oral surgeons, 2 orthodontists, 1 general dentist.
	# Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists straighten teeth.+
	# All of these aforementioned specialties are dentists. All dentists graduated from dental school.  Oral surgeons place implants.+
	# General dentists fill teeth+
=end

office = DentalOffice.new("Dental People Inc")
dr_mark = Orthodentist.new("Dr. Mark")
dr_lisa = Orthodentist.new("Dr. Lisa")
dr_mona = OralSurgeon.new("Dr. Mona")
dr_joel = OralSurgeon.new("Dr. Joel")
dr_newman = GeneralDentist.new("Dr. Newman")

office.oral(dr_joel)
office.oral(dr_mona)
office.ortho(dr_lisa)
office.ortho(dr_mark)
office.general(dr_newman)
puts office

=begin
# nouns - dental_office(name is dental people inc)
	#   dental office
	#   2 oral surgeons
	#   2 orthodontists
	#   1 general dentists
	
	# verbs
	#   pull teeth
	#   straighten teeth
	#   place implants
	#   fill teeth
	
	# All of these aforementioned specialties are dentists. All dentists graduated from dental school.
	
	module Pullable
	  def pull_teeth
	    "I will pull your teeth! For real!!!"
	  end
	end
	
	class DentalOffice
	  attr_reader :oral_surgeon, :orthodentist, :general_dentist, :office_name
	  
	  def initialize(office_name)
	    @office_name = office_name
	    @oral_surgeon = []
	    @orthodentist = []
	    @general_dentist = []
	  end
	  
	  def oral(dr_name)
	    oral_surgeon << dr_name
	  end
	  
	  def ortho(dr_name)
	    orthodentist << dr_name
	  end
	  
	  def general(dr_name)
	    general_dentist << dr_name
	  end
	  
	  def to_s
	    puts "Welcome to #{office_name}:"
	    puts "We have the following dentists:"
	    puts oral_surgeon
	    puts orthodentist
	    puts general_dentist
	    ""
	  end
	end
	
	class Dentist
	  attr_reader :doctors_name
	  
	  def initialize(doctors_name)
	    @doctors_name = doctors_name
	  end
	  
	  def works_at(office, department)
	    office.department << self
	  end
	  
	  def speciality(ability)
	    "Hi I am #{doctors_name} and #{ability}"
	  end
	end
	
	class OralSurgeon < Dentist
	  include Pullable
	  
	  def place_implants
	    "I will place an implant!"
	  end
	  
	  def to_s
	    speciality(place_implants)
	  end
	end
	
	class Orthodentist < Dentist
	  def straigten_teeth
	    "I will straighten your teeth! Trust me!!!"
	  end
	  
	  def to_s
	    speciality(straigten_teeth)
	  end
	end
	
	class GeneralDentist < Dentist
	  include Pullable
	  
	  def fill_teeth
	    "I can fill your teeth. No problemo! Just cut back on those sweets please!"
	  end
	  
	  def to_s
	    speciality(fill_teeth)
	  end
	end
	
	office = DentalOffice.new("Dental People Inc")
	dr_mark = Orthodentist.new("Dr. Mark")
	dr_lisa = Orthodentist.new("Dr. Lisa")
	dr_mona = OralSurgeon.new("Dr. Mona")
	dr_joel = OralSurgeon.new("Dr. Joel")
	dr_newman = GeneralDentist.new("Dr. Newman")
	
	office.oral(dr_joel)
	office.oral(dr_mona)
	office.ortho(dr_lisa)
	office.ortho(dr_mark)
	office.general(dr_newman)
	puts office
1:06
I came up with my own spike if you want to try the following:
	riaz = Student.new("Mechanical", "Riaz")
	james = Student.new("Mechanical", "James")
	martha = Student.new("Mechanical", "Martha")
	oscar = Student.new("Software", "Oscar")
	rebecca = Student.new("Software", "Rebecca")
	monte = Student.new("Software", "Monte")
	hunter = Student.new("Electronics", "Hunter")
	mike = Student.new("Electronics", "Mike")
	mehdi = Student.new("Electronics", "Mehdi")
	christopher = Student.new("Civil", "Christopher")
	ali = Student.new("Civil", "Ali")
	clare = Student.new("Civil", "Clare")
	
	mechanical = Department.new("Mechanical")
	software = Department.new("Software")
	electronics = Department.new("Electronics")
	civil = Department.new("Civil")
	
	university = University.new
	
	university.add(riaz, mechanical)
	university.add(james, mechanical)
	university.add(martha, mechanical)
	university.add(oscar, software)
	university.add(monte, software)
	university.add(rebecca, software)
	university.add(hunter, electronics)
	university.add(mike, electronics)
	university.add(mehdi, electronics)
	university.add(christopher, civil)
	university.add(ali, civil)
	university.add(clare, civil)
	
	university.print_students
	
	# Expected output
	
	# Mechanical engineering department has the following students:
	# Riaz is studying in the Mechanical engineering department.
	# James is studying in the Mechanical engineering department.
	# Martha is studying in the Mechanical engineering department.
	
	# Software engineering department has the following students:
	# Oscar is studying in the Software engineering department.
	# Monte is studying in the Software engineering department.
	# Rebecca is studying in the Software engineering department.
	
	# Electronics engineering department has the following students:
	# Hunter is studying in the Electronics engineering department.
	# Mike is studying in the Electronics engineering department.
	# Mehdi is studying in the Electronics engineering department.
	
	# Civil engineering department has the following students:
	# Christopher is studying in the Civil engineering department.
	# Ali is studying in the Civil engineering department.
	# Clare is studying in the Civil engineering department.
  =end