# Create Database and Select Database
create database event_ticketing_system;
use event_ticketing_system;

# create customers table 
create table customers
(
CustomerID int primary key auto_increment,
Name varchar(30) not null,
Age int check(age>=10),
Gender enum("M","F"),
Phone_no bigint unique not null,
EmailID varchar(40),
Address varchar(150)
);
desc customers;

# Create Events Table
create table events
(
EventID varchar(30) unique not null,
Event_Name varchar(100) unique not null,
Category varchar(50),
Date varchar(20) not null,
Address varchar(100) default"Chennai",
Description varchar(500) default"Welcome to the Event"
);
desc events;

# Create Reservations Table
create table Reservations
(
ReserveID int primary key auto_increment,
CustomerID int,
EventID varchar(30),
ReserveDATE date default(curdate()),
PaymentType varchar(20) default"UPI",
Payment_Status varchar(20) check(payment_status in ("Cancelled","Pending","Completed")),
constraint fr_cusn foreign key(customerID) REFERENCES customers(customerID),
constraint fr_evid foreign key(eventID) REFERENCES events(eventID)
);
desc Reservations;

# Create Tickets Table
create table Tickets
(
TicketNO int primary key auto_increment,
ReserveID int,
Category varchar(10) check(Category in ("VIP","Ordinary","FristClass")),
SeatNO varchar(10) not null,
constraint fk_rsID foreign key(ReserveID) REFERENCES Reservations(ReserveID)
);
#desc Tickets;


-- Create Sales Table --
create table Sales
(
SalesID int primary key auto_increment,
TicketNO int,
Price decimal(8,2),
SaleDate date default(curdate()),
Sales_status enum("Cancelled","Sold") default "Sold",
constraint fr_tkno foreign key(ticketNO) REFERENCES tickets(ticketNO)
);
desc sales;

# Inserting values into the Events table

					      -- single insert statement --
insert into events(eventid, event_name,category, date, Address, Description) values
("01B25","India Business Summit 2025","Business","20-June-2025","The Leela Palace, New Delhi","Join industry leaders and experts for a day of insightful discussions and networking opportunities.");

                         -- multiple insert statement --
insert into events(eventid, event_name,category, date, Address,Description) values
("02B25","Startup India Expo 2025","Business","28-MAY-2025","Pragati Maidan, New Delhi","Improve your Business skills"),
("03B25","Corporate Leadership Summit 2025","Business","02-AUG-2025","The Taj Mahal Palace, Mumbai","Improve your leadership skill for future"),
("04E26","EduTech Conference 2025","Education","06-jan-2026","Anna conference hall, Adayar,Chennai.","Explore the latest trends and technologies in education at this premier conference."),
("05E25","Career Expo 2025","Education","04-MAY-2025","Exhibition Centre, Chidhambaram","The Career Expo 2025 will feature job fairs, career counseling, and workshops on resume building and interview skills."),
("06E26","International Conference on Education","Education","04-MAY-2025","Jawaharlal Nehru University,Mumbai.","Share knowledge and research on education with international experts at this premier conference."),
("07EN25","Comedy Show","Entertainment","20-NOV-2025","The Comedy Club, Mumbai","Laugh out loud with India's top comedians at this hilarious show. Featuring stand-up comedy, improv, and more!"),
("08EN25","Dance Competition","Entertainment","22-OCT-2025","Siri Fort Auditorium, New Delhi","- Witness the best dancers in the country compete for the top prize. Featuring various dance styles, music, and excitement!"),
("09F25","Designer Showcase 2025","Fashion","15-OCT-2025","The Oberoi, Mumbai","Get a glimpse of the latest collections from India's top designers. Featuring exclusive showcases, styling sessions, and more!"),
("10F25","Bridal Fashion Show","Fashion","26-DEC-2025","The Leela Palace, Jaipur","Witness the latest bridal fashion trends and designs from India's top designers. Featuring runway shows, designer showcases, and more!"),
("11S25"," India Open Tennis Tournament","Sports","10-JUNE-2025","R.K. Khanna Tennis Stadium, New Delhi","The India Open Tennis Tournament is back, featuring thrilling matches and exciting performances."),
("12E25","AGRI TEC EXPO-2025","Education","29-MAY-2025","Anandha Thirumana Mahal,Viluppuram,","AGRI TEC EXPO - 2025 the objective of this expo is to bring together under one roof, the manufacturers, traders and distributors"),
("13EN25","Drink meetup Chennai","Entertainment","10-MAY-2025","Lower Deck Bar & Nightclub, Chennai.","Let's meet up in Chennai for some drinks and good vibes!"),
("14E25","Automate Intelligently","Education","09-MAY-2025","Technology Services Private Limited, Chennai.","Learn how to harness the power of n8n to automate tasks intelligently with agentic AI in this hands-on workshop!");

                         -- Assigning default values --
insert into events(eventid, event_name,category, date, Address) values
("15S25","IPL-PLAYOFF-1", "Sports", "20-MAY-2025", "RGI Stadium Rd, Uppal, Hyderabad, Telangana 500039"),
("16S25","IPL-PLAYOFF-2","Sports","21-MAY-2025","RGI Stadium Rd, Uppal, Hyderabad, Telangana 500039"),
("17S25","IPL-PLAYOFF-3","Sports","23-MAY-2025","Maidan, B.B.D. Bagh, Kolkata, West Bengal 700021"),
("18S25","IPL-FINAL","Sports","25-MAY-2025","Maidan, B.B.D. Bagh, Kolkata, West Bengal 700021");

                       -- Inserting values into the Customers table --

insert into customers (CustomerID, Name,Age, Gender, Phone_no, EmailId, Address) values
(01,"Pradesh",20,"M",9824213047,"pradeshg12@gmail.com","Maraimalainagar");

                     -- Assigning Auto_increament values --
insert into customers (Name,Age, Gender, Phone_no, EmailId, Address) values
("Pradhap",21,"M",9852364145,"pradhap12@gmail.com","Tambaram"),("Pradeep",24,"M",9852647811,"pradeep14@gmail.com","Velachery"),
("Vikky",15,"M",9865471236,"Vikky23@gmail.com","Chidambaram"),("Sharukan",25,"M",9645172831,"Allish@gmail.com","T.nagar"),
("Praveen",21,"M",9894786424,"praveenp9894@gmail.com","Mylapore"),("Samuvel",22,"M",6748216425,"samuvels6789@gmail.com","Chidambaram"),
("Srikanth",21,"M",9645781202,"srikantharmy@gmail.com","Chidambaram"),("Mugesh",20,"M",9175423816,"Mugen20@gmail.com","Chidambaram"),
("Gayathri",20,"F",9623147852,"gayu5689@gmail.com","KM koil"),("Priya",21,"F",9847632015,"priyavenkat@gmail.com","Porur"),
("Sathana",14,"F",9841257436,"sathu3920@gmail.com","Yelagiri"),("Murali",23,"M",9325648246,"murali@gmail.com","Adayar"),
("Venkat",24,"M",9642105736,"venkat6789@gmail.com","Mandaveli"),("Priyanka",25,"F",9235164872,"priya12@gmail.com","Velachery"),
("Magesh",23,"F",9512046311,"magesh59@gmail.com","Kattankulathur"),("Dharshan",12,"M",9325867412,"rds245@gmail.com","Jayankondam"),
("Marivel",26,"M",7356842130,"mari484@gmail.com","Valluvar kottam"),("Mani",20,"M",9142637841,"kmani@gmail.com","Bhuvanigiri"),
("Suthi",22,"F",9846723108,"suthi1@outlook.com","Nagarkoil"),("Maanikkam",25,"M",9864564725,"maanikam@gmail.com","Viruthachalam"),
("Rohan Sharma",25,"M",9876543210,"rohan@gmail.com","New Delhi"),("Priya Singh",30,"F",8765432109,"priya@yahoo.com", "Mumbai"),
("Amit Kumar",22,"M",7654321098,"amit@outlook.com","Bangalore"),("Sneha Jain",28,"F",6543210987,"sneha@gmail.com","Hyderabad"),
("Rajesh Patel",35,"M",5432109876,"rajesh@yahoo.com","Chennai"),("Kavita Jain",29,"F",4321098765,"kavita@outlook.com","Pune"),
("Vikas Kumar",32,"M",3210987654,"vikas@gmail.com","Ahmedabad"),("Ritu Singh",26,"F",2109876543,"ritu@yahoo.com","Surat"),
("Sachin Gupta",38,"M",1098765432,"sachin@outlook.com","Jaipur"),("Anjali Sharma",24,"M",9876543211,"anjali@gmail.com","Lucknow"),
("Suresh Kumar",31,"M",8765432108,"suresh@gmail.com","Erode, Tamil Nadu"),("Pooja Singh", 27, "F", 7654321099, "pooja@yahoo.com", "Cuddalore, Tamil Nadu"),
("Rahul Sharma",33,"M",6543210988,"rahul@outlook.com","Nagapattinam, Tamil Nadu"),("Sangeetha Jain", 25, "F", 5432109877, "sangeetha@gmail.com", "Thanjavur, Tamil Nadu"),
("Vijay Kumar",36,"M",4321098766,"vijay@yahoo.com","Kancheepuram, Tamil Nadu"),("Riya Singh", 23, "F", 3210987655, "riya@outlook.com", "Karur, Tamil Nadu"),
("Amit Jain",34,"M",2109876544,"amitj@gmail.com","Namakkal, Tamil Nadu"),("Priyanka Sharma", 29, "F", 1098765433, "priyanka@yahoo.com", "Ariyalur, Tamil Nadu"),
("Raj Kumar",37,"M",9876543212,"rajkumar@gmail.com","Perambalur, Tamil Nadu"),("Sakshi Singh", 26, "F", 8765432107, "sakshi@outlook.com", "Pudukkottai, Tamil Nadu"),
("Ramesh Kumar",39,"M",7654321097,"ramesh@gmail.com","Tiruvannamalai, Tamil Nadu"),("Nisha Jain", 28, "F", 6543210986, "nisha@yahoo.com", "Villupuram, Tamil Nadu"),
("Sanjay Patel",40,"M",5432109875,"sanjay@outlook.com","Krishnagiri, Tamil Nadu"),("Pallavi Singh", 30, "F", 4321098764, "pallavi@gmail.com", "Dharmapuri, Tamil Nadu"),
("Vignesh Kumar",27,"M",3210987653,"vignesh@yahoo.com","Theni, Tamil Nadu"),("Aarav Jain", 26, "M", 9345234567, "aarav@gmail.com", "Chennai, Tamil Nadu"),
("Isha Singh",24,"F",9845234567,"isha@yahoo.com","Coimbatore, Tamil Nadu"),("Rahul Mehta", 30, "M", 9445234567, "rahul@outlook.com", "Madurai, Tamil Nadu"),
("Sakshi Sharma",28,"F",9645234567,"sakshi@gmail.com","Trichy, Tamil Nadu"),("Vivek Kumar", 32, "M", 9745234567, "vivek@yahoo.com", "Salem, Tamil Nadu"),
("Nisha Patel",25,"F",9845234568,"nisha@outlook.com","Tirunelveli, Tamil Nadu"),("Siddharth Jain", 29, "M", 9945234567, "siddharth@gmail.com", "Tiruppur, Tamil Nadu"),
("Pooja Mehta",27,"F",9345234568,"pooja@yahoo.com","Vellore, Tamil Nadu"),("Akshay Singh", 31, "M", 9445234568, "akshay@outlook.com", "Thoothukudi, Tamil Nadu"),
("Riya Sharma",23,"F",9645234568,"riya@gmail.com","Dindigul, Tamil Nadu"),("Vignesh Kumar", 35, "M", 9745234568, "vignesh@yahoo.com", "Erode, Tamil Nadu"),
("Sakshi Gupta",26,"F",9845234569,"sakshig@outlook.com","Cuddalore, Tamil Nadu"),("Rohan Mehta", 33, "M", 9945234568, "rohan@gmail.com", "Nagapattinam, Tamil Nadu"),
("Priya Singh",24,"F",9345234569,"priya@yahoo.com","Thanjavur, Tamil Nadu"),("Amit Kumar", 36, "M", 9445234569, "amit@outlook.com", "Kancheepuram, Tamil Nadu"),
("Sneha Jain",28,"F",9645234569,"sneha@gmail.com","Karur, Tamil Nadu"),("Rajesh Patel", 30, "M", 9745234569, "rajesh@yahoo.com", "Namakkal, Tamil Nadu"),
("Kavita Sharma",27,"F",9845234570,"kavita@outlook.com","Ariyalur, Tamil Nadu"),("Vikas Singh", 34, "M", 9945234569, "vikas@gmail.com", "Perambalur, Tamil Nadu"),
("Anjali Mehta",25,"F",9345234570,"anjali@yahoo.com","Pudukkottai, Tamil Nadu"),("Sachin Kumar", 38, "M", 9445234570, "sachin@outlook.com", "Tiruvannamalai, Tamil Nadu"),
("Rinki Jain",29,"F",9645234570,"rinki@gmail.com","Villupuram, Tamil Nadu"),("Sanjay Patel", 31, "M", 9745234570, "sanjay@yahoo.com", "Krishnagiri, Tamil Nadu"),
("Pallavi Singh",26,"F",9845234571,"pallavi@outlook.com","Dharmapuri, Tamil Nadu"),("Akshita Mehta", 24, "F", 9345234571, "akshita@gmail.com", "Theni, Tamil Nadu"),
("Rohan Singh",37,"M",9445234571,"rohan@yahoo.com","Chengalpattu, Tamil Nadu"),("Sakshi Mehta", 28, "F", 9645234571, "sakshim@outlook.com", "Tiruvallur, Tamil Nadu"),
("Vivek Mehta",32,"M",9745234571,"vivekm@gmail.com","Kanyakumari, Tamil Nadu"),("Nisha Singh", 30, "F", 9845234572, "nisha@yahoo.com", "Nilgiris, Tamil Nadu"),
("Kriti Jain", 27, "F", 9345234574, "kriti@gmail.com", "Erode, Tamil Nadu"),("Siddharth Singh", 32, "M", 9445234574, "siddharth@yahoo.com", "Cuddalore, Tamil Nadu"),
("Ananya Mehta", 24, "F", 9645234574, "ananya@outlook.com", "Nagapattinam, Tamil Nadu"),("Rohan Gupta", 36, "M", 9745234574, "rohanag@gmail.com", "Thanjavur, Tamil Nadu"),
("Sakshi Raj", 29, "F", 9845234575, "sakshir@yahoo.com", "Kancheepuram, Tamil Nadu"),("Vivek Singh", 31, "M", 9345234575, "viveks@outlook.com", "Karur, Tamil Nadu"),
("Nisha Mehta", 26, "F", 9445234575, "nisham@gmail.com", "Namakkal, Tamil Nadu"),("Aryan Verma", 35, "M", 9645234575, "aryanv@yahoo.com", "Ariyalur, Tamil Nadu"),
("Priya Singh", 28, "F", 9745234575, "priyas@outlook.com", "Perambalur, Tamil Nadu"),("Rahul Jain", 30, "M", 9845234576, "rahulj@gmail.com", "Pudukkottai, Tamil Nadu"),
("Aaradhya Jain", 25, "F", 9345234572, "aaradhya@gmail.com", "Chennai, Tamil Nadu"),("Rohan Raj", 29, "M", 9445234572, "rohanr@yahoo.com", "Coimbatore, Tamil Nadu"),
("Sakshi Sharma", 27, "F", 9645234572, "sakshis@outlook.com", "Madurai, Tamil Nadu"),("Vivek Verma", 33, "M", 9745234572, "vivekv@gmail.com", "Trichy, Tamil Nadu"),
("Nalini Singh", 31, "F", 9845234573, "nalini@yahoo.com", "Salem, Tamil Nadu"),("Aryan Jain", 26, "M", 9345234573, "aryan@outlook.com", "Tirunelveli, Tamil Nadu"),
("Priyanka Mehta", 28, "F", 9445234573, "priyankam@gmail.com", "Tiruppur, Tamil Nadu"),("Rahul Gupta", 34, "M", 9645234573, "rahulg@yahoo.com", "Vellore, Tamil Nadu"),
("Sneha Verma", 25, "F", 9745234573, "sneha@outlook.com", "Thoothukudi, Tamil Nadu"),("Vikas Raj", 30, "M", 9845234574, "vikasr@gmail.com", "Dindigul, Tamil Nadu"),
("Aaradhya Verma", 25, "F", 9345234576, "aaradhyav@gmail.com", "Tiruvannamalai, Tamil Nadu"),("Siddharth Mehta", 33, "M", 9445234576, "siddharthm@yahoo.com", "Villupuram, Tamil Nadu"),
("Kriti Singh", 27, "F", 9645234576, "kriti@outlook.com", "Krishnagiri, Tamil Nadu"),("Rohan Raj", 31, "M", 9745234576, "rohanr@gmail.com", "Dharmapuri, Tamil Nadu"),
("Ananya Jain", 24, "F", 9845234577, "ananyaj@yahoo.com", "Theni, Tamil Nadu"),("Vivek Verma", 36, "M", 9345234577, "vivekv@outlook.com", "Chengalpattu, Tamil Nadu"),
("Sakshi Mehta", 29, "F", 9445234577, "sakshim@gmail.com", "Tiruvallur, Tamil Nadu"),("Aryan Singh", 32, "M", 9645234577, "aryans@yahoo.com", "Kanyakumari, Tamil Nadu"),
("Priyanka Raj", 28, "F", 9745234577, "priyankar@outlook.com", "Nilgiris, Tamil Nadu"),("Rahul Verma", 30, "M", 9845234578, "rahulv@gmail.com", "Ramanathapuram, Tamil Nadu");

-- Insert values into Reservations table

INSERT INTO Reservations (ReserveID, customerID, EventID, ReserveDATE, PaymentType, Payment_Status) values
(5001,2, "01B25", "2025-05-01", "UPI", "Completed");

INSERT INTO Reservations (customerID, EventID, ReserveDATE, PaymentType, Payment_Status) values
(1, "09F25", "2025-04-10", "Card", "Completed"),(2, "02B25", "2025-05-03", "UPI", "Pending"),
(2, "07EN25", "2025-03-08", "UPI", "Pending"),(3, "03B25", "2025-05-02", "Card", "Completed"),
(3, "08EN25", "2025-02-07", "Card", "Completed"),(3, "11S25", "2025-05-12", "UPI", "Completed"),
(4, "04E26", "2025-04-04", "UPI", "Cancelled"),(5, "05E25", "2025-05-06", "Card", "Completed"),
(5, "10F25", "2025-05-11", "Card", "Completed"),(5, "12E25", "2025-05-15", "UPI", "Completed"),
(6, "13EN25", "2025-03-09", "UPI", "Pending"),(7, "14E25", "2025-05-14", "Card", "Completed"),
(8, "01B25", "2025-04-01", "UPI", "Completed"),(10, "09F25", "2025-05-10", "Card", "Completed"),
(11, "02B25", "2025-05-03", "UPI", "Pending"),(12, "07EN25", "2025-05-08", "UPI", "Completed"),
(14, "08EN25", "2025-05-07", "Card", "Pending"),(15, "11S25", "2025-05-12", "UPI", "Completed"),
(16, "04E26", "2025-05-04", "UPI", "Cancelled"),(17, "05E25", "2025-05-06", "Card", "Completed"),
(18, "10F25", "2025-05-11", "Card", "Pending"),(19, "12E25", "2025-05-15", "UPI", "Completed"),
(20, "13EN25", "2025-03-09", "UPI", "Pending"),(21, "14E25", "2025-05-14", "Card", "Completed"),
(22, "01B25", "2025-04-01", "UPI", "Completed"),(13, "03B25", "2025-05-02", "Card", "Completed"),
(22, "09F25", "2025-02-10", "Card", "Completed"),(23, "02B25", "2025-05-03", "UPI", "Pending"),
(24, "07EN25", "2025-02-08", "UPI", "Pending"),(25, "03B25", "2025-05-02", "Card", "Completed"),
(25, "08EN25", "2025-04-07", "Card", "Completed"),(25, "11S25", "2025-05-12", "UPI", "Completed"),
(26, "04E26", "2025-03-04", "UPI", "Cancelled"),(27, "05E25", "2025-05-06", "Card", "Completed"),
(27, "10F25", "2025-01-11", "Card", "Completed"),(27, "12E25", "2025-05-15", "UPI", "Completed"),
(28, "13EN25", "2025-04-09", "UPI", "Pending"),(29, "14E25", "2025-05-14", "Card", "Completed"),
(30, "01B25", "2025-03-01", "UPI", "Completed"),(38, "01B25", "2025-05-01", "UPI", "Completed"),
(30, "09F25", "2025-02-10", "Card", "Completed"),(31, "02B25", "2025-05-03", "UPI", "Pending"),
(32, "07EN25", "2025-04-08", "UPI", "Pending"),(33, "03B25", "2025-05-02", "Card", "Completed"),
(33, "08EN25", "2025-01-07", "Card", "Completed"),(33, "11S25", "2025-05-12", "UPI", "Completed"),
(34, "04E26", "2025-03-04", "UPI", "Cancelled"),(35, "05E25", "2025-05-06", "Card", "Completed"),
(35, "10F25", "2025-05-11", "Card", "Completed"),(35, "12E25", "2025-05-15", "UPI", "Completed"),
(36, "13EN25", "2025-05-09", "UPI", "Pending"),(37, "14E25", "2025-05-14", "Card", "Completed"),
(38, "09F25", "2025-04-10", "Card", "Completed"),(39, "02B25", "2025-05-03", "UPI", "Pending"),
(40, "07EN25", "2025-03-08", "UPI", "Pending"),(1, "15S25", "2025-05-20", "UPI", "Completed"),
(1, "16S25", "2025-02-21", "UPI", "Completed"),(22, "17S25", "2025-05-23", "Card", "Completed"),
(22, "18S25", "2025-05-25", "Card", "Completed"),(25, "15S25", "2025-05-20", "UPI", "Completed"),
(25, "16S25", "2025-02-21", "UPI", "Completed"),(30, "17S25", "2025-05-23", "Card", "Completed"),
(30, "18S25", "2025-05-25", "Card", "Completed"),(35, "15S25", "2025-05-20", "UPI", "Completed"),
(35, "16S25", "2025-03-21", "UPI", "Completed");

INSERT INTO Reservations (customerID, EventID, ReserveDATE, PaymentType, Payment_Status) values
(61, "15S25", "2025-05-05", "UPI", "Completed"),(9, "14E25", "2025-05-05", "UPI", "Pending"),
(53, "07EN25", "2025-05-05", "UPI", "Completed"),(65, "06E26", "2025-05-05", "UPI", "Completed"),
(98, "14E25", "2025-05-05", "UPI", "Completed"),(78, "14E25", "2025-05-05", "UPI", "Completed"),
(56, "06E26", "2025-05-05", "UPI", "Completed"),(27, "07EN25", "2025-05-05", "UPI", "Completed");



insert into Tickets(TicketNO,ReserveID,Category,SeatNO) values(2025164,5001,"VIP","VS1");

insert into Tickets(ReserveID,Category,SeatNO) values
(5002,"Ordinary","OR1"),(5005,"Ordinary","OR12"),
(5006,"Ordinary","OR13"),(5007,"Ordinary","OR17"),(5009,"VIP","VIP3"),(5010,"Ordinary","OR5"),
(5013,"Ordinary","OR5"),(5014,"Ordinary","OR24"),(5015,"Ordinary","OR18"),
(5017,"VIP","VIP2"),(5019,"Ordinary","OR14"),(5021,"FristClass","F10"),(5023,"FristClass","F13"),
(5025,"Ordinary","OR16"),(5026,"FristClass","F14"),(5027,"FristClass","F5"),(5028,"VIP","VIP5"),
(5031,"FristClass","F4"),(5032,"Ordinary","OR19"),(5033,"FristClass","F3"),(5035,"FristClass","F1"),
(5036,"VIP","VIP6"),(5037,"Ordinary","OR21"),(5039,"FristClass","F2"),(5040,"Ordinary","OR8"),
(5041,"Ordinary","OR7"),(5042,"FristClass","F1"),(5045,"VIP","VIP4"),(5046,"FristClass","F15"),
(5047,"Ordinary","OR4"),(5049,"Ordinary","OR1"),(5050,"FristClass","F1"),(5051,"VIP","VIP7"),
(5053,"Ordinary","OR6"),(5054,"Ordinary","OR3"),(5057,"Ordinary","OR1"),(5058,"Ordinary","OR9"),
(5059,"Ordinary","OR11"),(5060,"Ordinary","OR12"),(5061,"VIP","VIP4"),(5062,"FristClass","F1"),
(5063,"Ordinary","OR1"),(5064,"Ordinary","OR1"),(5065,"Ordinary","OR16"),(5066,"FristClass","F1"),
(5067,"VIP","VIP2"),(5068,"FristClass","F7"),(5073,"Ordinary","OR28"),(5069,"Ordinary","OR31"),
(5070,"Ordinary","OR27"),(5071,"FristClass","F8"),(5072,"VIP","VIP6"),(5011,"Ordinary","OR25");



insert into sales (SalesID,ticketno,price, saledate,sales_status) values
(25001,2025164,1500.00,"2025-05-01","Sold");

insert into sales (ticketno, price, saledate) values
(2025165,500.00,"2025-04-20"),(2025166,500.00,"2025-04-25"),(2025167,500.00,"2025-05-18"),(2025168,500.00,"2025-05-15"),
(2025169,1500.00,"2025-03-26"),(2025170,500.00,"2025-03-14"),(2025171,500.00,"2025-02-01"),(2025172,500.00,"2025-03-05"),
(2025173,500.00,"2025-04-08"),(2025174,1500.00,"2025-03-25"),(2025175,500.00,"2025-03-15"),(2025176,1000.00,"2025-03-15"),
(2025177,1000.00,"2025-04-08"),(2025178,500.00,"2025-03-15"),(2025179,1000.00,"2025-04-08"),(2025180,1000.00,"2025-04-08"),
(2025193,1000.00,"2025-02-18"),(2025194,500.00,"2025-03-15"),(2025195,500.00,"2025-03-24"),(2025196,1000.00,"2025-02-13"),
(2025197,1500.00,"2025-04-01"),(2025198,500.00,"2025-02-14"),(2025199,500.00,"2025-03-13"),(2025200,500.00,"2025-03-15"),
(2025201,500.00,"2025-02-04"),(2025202,500.00,"2025-03-06"),(2025203,500.00,"2025-03-08"),(2025204,1500.00,"2025-04-01"),
(2025205,1000.00,"2025-02-03"),(2025206,500.00,"2025-03-04"),(2025207,500.00,"2025-01-19"),(2025208,500.00,"2025-03-12"),
(2025209,1000.00,"2025-02-18"),(2025210,1500.00,"2025-04-01");

-- Current Date defauld --
insert into sales ( ticketno, price, sales_status) values
(2025211,1000.00,"Cancelled"),(2025212,500.00,"Sold"),(2025213,1500.00,"Sold"),(2025214,500.00,"Cancelled"),
(2025215,1000.00,"Cancelled"),(2025216,1500.00,"Sold"),(2025217,500.00,"Cancelled"),(2025181,1500.00,"Cancelled"),
(2025182,1000.00,"Sold"),(2025183,500.00,"Sold"),(2025184,1000.00,"Cancelled"),(2025185,1000.00,"Cancelled"),
(2025186,1500.00,"Cancelled"),(2025187,500.00,"Sold"),(2025188,1000.00,"Cancelled"),(2025189,500.00,"Sold"),
(2025190,500.00,"Cancelled"),(2025191,1000.00,"Sold"),(2025192,1500.00,"Cancelled");




   -- Operators based retrieve Querys.

# Equality Operator (=)
SELECT * FROM Events WHERE date="04-MAY-2025";

# Inequality Operator (!= or <>)
SELECT * FROM Customers WHERE Age != 25;

# Greater Than Operator (>)
SELECT * FROM Customers WHERE Age > 35;

# Less Than Operator (<)
SELECT * FROM Customers WHERE Age < 20;

# Greater Than or Equal To Operator (>=)
SELECT * FROM sales WHERE price >= 1000;

# Less Than or Equal To Operator (<=)
SELECT * FROM sales WHERE price <= 600;

# BETWEEN Operator
select * from reservations where reservedate between "2025-04-01" and "2025-04-30";

# IN Operator
SELECT * FROM Customers WHERE customerid IN (20, 25, 30);

# LIKE Operator
SELECT * FROM customers WHERE name LIKE 'pra%';

# NOT Operator
SELECT * FROM reservations WHERE NOT Payment_Status = "completed";

# AND Operator
SELECT * FROM Customers WHERE Age > 38 AND Gender = 'M';

# OR Operator
SELECT * FROM Customers WHERE Age <=18 OR Gender = 'F';



                -- SUB QUERY--

#1.Get the details of all events that have no tickets sold.

select * from events where eventId not in (select e.eventID from events e 
left join reservations r on e.eventid=r.eventId
where r.payment_status="completed"
group by e.eventid);

# 2.Customers who Booked Tickets for More than One Event.

WITH customerid as
(select customerid, count(eventId) as Count_of_events from reservations 
group by CustomerID having Count_of_events >1)

select * from customers where customerid in (select customerid from customerid);

			-- AGGREGATE FUNCTIONS --

# 1.Find the total number of events in each category --
select Category,count(event_name) from events group by Category;

# 2.Find the number of male and female customers.(aggrecate functions)
select gender,count(gender) No_of_customers from customers
group by gender;

# 3.What are the top 3 days with the highest revenue for the ticketsales?.

select saledate, sum(price) as total_sales_per_day from sales 
group by SaleDate order by total_sales_per_day desc limit 3;



				-- USEING JOINS --

# 1.Get the details of all customers who have made a reservation.(joins)

select r.ReserveID,c.customerId, c.name, c.age, c.gender, c.phone_no, c.emailId, c.address from
reservations r left join customers c on r.customerId=c.customerId 
order by r.ReserveID;


             -- USEING JOINS AND AGGREGATE FUNCTION --

# 1.Calculate the total revenue generated from ticket sales for each event.

select e.eventid, e.event_name, sum(s.price) as Total_sales_of_each_event
from sales s join tickets t on s.ticketno=t.ticketno
join reservations r on r.ReserveID=t.ReserveID
join events e on e.eventid=r.EventID 
where s.Sales_status = "sold"
group by e.Event_Name
order by e.EventID;

# 2.Find the average price of tickets sold for each category.

select e.Category, avg(s.price) as Total_sales_of_each_event
from sales s join tickets t on s.ticketno=t.ticketno
join reservations r on r.ReserveID=t.ReserveID
join events e on e.eventid=r.EventID 
where s.Sales_status = "sold"
group by e.Category;

# 3.Which events have the top two highest revenues?.

select e.eventId, e.event_name, sum(s.price) Total_Income_Each_Event from sales s 
join tickets t on t.TicketNO=s.TicketNO
join reservations r on r.reserveid=t.reserveid
join events e on r.eventid=e.eventid
group by e.eventid order by Total_Income_Each_Event desc limit 2;

# 4.Find the total number of events in each category.

select t.Category,sum(s.price) Total_sales from tickets t join sales s on t.TicketNO=s.ticketno
where s.sales_status="sold"
group by t.Category;



                  -- USING STORED PROCEDURE --

# 1.Find all tickets sold for a specific event.(Stored Procedure Method & SUB QUERY)

DELIMITER $$
CREATE PROCEDURE TICKETS_SOLD_DETAILS(IN EVENT_NAME VARCHAR(50))
BEGIN
	select * from sales where ticketno in (select ticketno from tickets where reserveId in
		(select r.reserveId from reservations r left join events e on e.eventId=r.eventId
		  where e.event_name=event_name and r.payment_status = "completed"))
			and sales_status = "sold";
END $$
DELIMITER ;
CALL TICKETS_SOLD_DETAILS("India Business Summit 2025");
CALL TICKETS_SOLD_DETAILS("Comedy Show");


# 2.Get the details of all events for which a specific customer has made a reservation with "STORED PROCEDURE".

DELIMITER $$
CREATE PROCEDURE CUSTOMERS_BOOKED_EVENTS_DETAILS(IN CUSTOMERID INT)
BEGIN
select c.customerid, c.name, E.EventID, E.Event_Name, E.Category, E.Date, E.Address, E.Description from customers c 
	join reservations r on c.customerid=r.customerid
		join events e on e.eventid=r.eventid 
			where c.customerid=CUSTOMERID;
END $$
DELIMITER ;

call CUSTOMERS_BOOKED_EVENTS_DETAILS(5);
call CUSTOMERS_BOOKED_EVENTS_DETAILS(3);


# 3.Retrieve the details of all customers who have purchased tickets for a specific event with "STORED PROCEDURE".

DELIMITER $$
CREATE PROCEDURE Specific_Event_Ticket_Purchase_Customer_Information(IN EVENTID INT)
BEGIN
select e.eventID,C.CustomerID, C.Name, C.Age, C.Gender, C.Phone_no, C.EmailID, C.Address from customers c 
	join reservations r on c.customerid=r.customerid
	  join events e on e.eventid=r.eventid where e.eventid=EVENTID;
END $$
DELIMITER ;

CALL Specific_Event_Ticket_Purchase_Customer_Information("07EN25");
CALL Specific_Event_Ticket_Purchase_Customer_Information("17S25");


                 -- USING CTE & WINDOW FUNCTIONS --

# 1.Who was the first customer to purchase a ticket for each event (useing CTE & WINDOW function).

WITH event_first_booked_date as (
select c.CustomerID, c.Name, c.Age, c.Gender, c.Phone_no, c.EmailID, c.Address,R.ReserveID,
e.EventID, r.ReserveDATE, r.PaymentType, r.Payment_Status,
row_number() over(partition by EventID order by ReserveDATE) as rdate from reservations r 
	join customers c on r.CustomerID=c.CustomerID
	 join events e on e.EventID=r.eventid)

select EventID,CustomerID, Name, Age, Gender, Phone_no, EmailID, Address
	from event_first_booked_date where rdate=1 and payment_status ="completed";	
    

# 2.How many tickets were sold for each event?  (using CTE & WINDOW Function).

WITH total_count as(
select e.EventID, e.Event_Name, s.SaleDate, count(r.ReserveID)over(partition by EventId) as Tickets_sales_count, 
row_number() over(partition by Event_Name order by SaleDate desc) as Rownum from sales s 
join tickets t on t.TicketNO=s.TicketNO
join reservations r on r.reserveid=t.reserveid
join events e on r.eventid=e.eventid)

select Eventid, Event_name, Tickets_Sales_Count from total_count where rownum=1;


                  -- USING VIEW --

# 1.Create view for Ticket Booking Customer Details.(view)
create view  Customer_Details_for_Booked_Tickets as
select r.ReserveID,c.customerId, c.name, c.age, c.gender, c.phone_no, c.emailId, c.address from
reservations r left join customers c on r.customerId=c.customerId 
order by r.ReserveID;

select * from Customer_Details_for_Booked_Tickets;

										-- THANK YOU --