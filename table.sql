CREATE TABLE USERS (
    UserId INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    JoinDate DATE,
    Date_Of_Birth DATE,
    Phone VARCHAR(15),
    Email VARCHAR(255),
    Status VARCHAR(15) CHECK (Status IN ('ACTIVE', 'SUSPENDED')), -- ACTIVE, SUSPENDED --
    UserType VARCHAR(10) CHECK (UserType IN('STAFF', 'STUDENT', 'BOTH')), -- STAFF, STUDENT, BOTH --
    CONSTRAINT Email_Unique UNIQUE (Email)
);


CREATE TABLE STUDENTS (
    UserId INT PRIMARY KEY,
    CurrentLoans INT DEFAULT 0 CHECK (CurrentLoans BETWEEN 0 AND 5), -- Default = 0 and Max = 5 --
    FOREIGN KEY (UserId) REFERENCES USERS(UserId)
);


CREATE TABLE STAFF (
    UserId INT PRIMARY KEY,
    CurrentLoans INT DEFAULT 0 CHECK (CurrentLoans BETWEEN 0 AND 10), -- Default = 0 and Max = 10 --
    FOREIGN KEY (UserId) REFERENCES USERS(UserId)
);

CREATE TABLE RESOURCES (
    ResourceID INT PRIMARY KEY,
    Title VARCHAR(255),
    Edition VARCHAR(255),
    ResourceType VARCHAR(5) CHECK(ResourceType IN ('CD', 'DVD', 'BOOKS', 'OTHER')), -- CD, DVD, BOOKS, ETC --
    ClassNumber INT,
    ShelfNumber INT,
    LocationFloor INT,
    LoanType VARCHAR(12) CHECK (LoanType IN ('STANDARD', 'SHORT_TERM', 'IN_LIBRARY')), -- STANDARD (2 WEEKS), SHORT TERM (2 DAYS), IN LIBRARY) --
    LoanPeriod INT
);


CREATE TABLE COPIES (
    CopyID INT PRIMARY KEY,
    ResourceID INT,
    Status VARCHAR(9) CHECK (Status IN ('AVAILABLE', 'ON-LOAN')), -- AVAILABLE, ON-LOAN --
    FOREIGN KEY (ResourceID) REFERENCES RESOURCES(ResourceID)
);

    CREATE TABLE LOANS (
        LoanID INT PRIMARY KEY,
        UserId INT,
        CopyID INT,
        LoanDate DATE,
        DueDate DATE,
        ReturnDate DATE,
        Status VARCHAR(8) CHECK (Status IN ('RETURNED', 'ACTIVE', 'OVERDUE')), -- RETURNED, ACTIVE, OVERDUE --
        FOREIGN KEY (UserId) REFERENCES USERS(UserId),
        FOREIGN KEY (CopyID) REFERENCES COPIES(CopyID)
    );


CREATE TABLE FINES (
    FineID INT PRIMARY KEY,
    LoanID INT,
    FineAmount DECIMAL(10, 2),
    DateIncurred DATE,
    LastFineDate DATE,
    DatePaid DATE,
    Status VARCHAR(10) CHECK(Status IN ('PAID', 'UNPAID')), -- PAID, UNPAID --
    FOREIGN KEY (LoanID) REFERENCES LOANS(LoanID)
);


CREATE TABLE RESERVATION (
    ReservationID INT PRIMARY KEY,
    UserID INT,
    CopyID INT,
    ReservationDate DATE,
    NotificationDate DATE,
    ExpiryDate DATE,
    Status VARCHAR(20) CHECK (Status IN ('Notified', 'Accepted', 'Declined', 'Expired', 'Active')), -- EXPIRED, Active, COMPLETED --
    Attempts INT CHECK (Attempts BETWEEN 0 AND 3), -- 0 = DEFAULT, 3 = MAX ATTEMPTS --
    FOREIGN KEY (UserID) REFERENCES USERS(UserId),
    FOREIGN KEY (CopyID) REFERENCES COPIES(CopyID)
);


CREATE TABLE LOANHISTORY (
    HistoryID INT PRIMARY KEY,
    LoanID INT,
    UserID INT,
    ResourceID INT,
    CopyID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    WasOverdue VARCHAR(3) CHECK (WasOverdue IN ('NO', 'YES')), -- NO OR YES --
    FOREIGN KEY (UserID) REFERENCES USERS(UserId),
    FOREIGN KEY (ResourceID) REFERENCES RESOURCES(ResourceID)
);