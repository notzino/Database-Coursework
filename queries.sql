-- Check for Overdue Loans, that the status is Active

SELECT LoanID, DueDate
FROM LOANS
WHERE  DueDate < SYSDATE AND Status = 'ACTIVE';

-- Update Loan Status to OverDue

UPDATE LOANS
SET Status = 'OVERDUE'
WHERE DueDate < SYSDATE AND Status = 'ACTIVE';

-- Calculate and Apply Fines and Update LastFineDate

UPDATE FINES
SET FineAmount = FineAmount + 1,
    LastFineDate = SYSTIMESTAMP
WHERE EXISTS (
    SELECT 1
    FROM LOANS
    WHERE FINES.LoanID = LOANS.LoanID
    AND LOANS.DueDate < SYSTIMESTAMP
    AND LOANS.Status = 'OVERDUE'
    AND (FINES.LastFineDate IS NULL OR FINES.LastFineDate < SYSTIMESTAMP)
);

-- Change users status to suspended when the value is over 10

UPDATE USERS
SET Status = 'SUSPENDED'
WHERE UserId IN (
  SELECT l.UserId
  FROM FINES f
  JOIN LOANS l ON f.LoanID = l.LoanID
  WHERE f.Status = 'UNPAID'
  GROUP BY l.UserId
  HAVING SUM(f.FineAmount) > 10
);

-- Retrieve Fine Details

SELECT
    u.UserID,
    u.Name,
    l.LoanID,
    f.FineAmount,
    f.DateIncurred,
    f.Status as FineStatus
FROM USERS u
JOIN
    LOANS l ON u.UserId = l.UserId
JOIN
    FINES F on l.LoanID = F.LoanID
WHERE
    f.Status = 'UNPAID';

-- Library Members who have been suspended

SELECT
    UserId,
    Name,
    Email,
    JoinDate,
    Status
FROM
    USERS
WHERE
    Status = 'SUSPENDED';


-- Popular Resources --

SELECT DISTINCT
    r.ResourceID,
    r.Title,
    COUNT(lh.LoanID) AS LoanCount
FROM
    RESOURCES r
JOIN
    LOANHISTORY lh ON r.ResourceID = lh.ResourceID
GROUP BY
    r.ResourceID,
    r.Title
ORDER BY
    LoanCount DESC;

-- Checking if the Return Date of Loans is accurate
SELECT
    L.LoanID,
    L.UserId,
    L.CopyID,
    L.LoanDate,
    L.DueDate,
CASE
    WHEN L.DueDate = (L.LoanDate + R.LoanPeriod) THEN 'Accurate'
    ELSE 'Inaccurate'
END AS ReturnAccuracy
FROM
    LOANS L
JOIN
    COPIES C ON L.CopyID = C.CopyID
JOIN
    RESOURCES R ON C.ResourceID = R.ResourceID;

-- Updates the Incorrect dates to the correct dates

UPDATE LOANS L
SET L.DueDate = (SELECT L.LoanDate + R.LoanPeriod FROM COPIES C, RESOURCES R WHERE C.CopyID = L.CopyID AND C.ResourceID = R.ResourceID)
WHERE L.DueDate <> (SELECT L.LoanDate + R.LoanPeriod FROM COPIES C, RESOURCES R WHERE C.CopyID = L.CopyID AND C.ResourceID = R.ResourceID);


-- Find Copies with the wrong status --

SELECT C.CopyID, C.Status AS CopiesStatus, L.Status AS LoansStatus
FROM COPIES C
LEFT JOIN LOANS L ON C.CopyID = L.CopyID
WHERE (C.Status = 'AVAILABLE' AND L.Status IS NOT NULL)
   OR (C.Status = 'ON-LOAN' AND (L.Status IS NULL OR L.Status = 'RETURNED'));


-- Change items that are currently ON-LOAN that are marked Available

UPDATE COPIES C
SET C.Status = 'ON-LOAN'
WHERE C.Status = 'AVAILABLE'
AND EXISTS (
    SELECT 1 FROM LOANS L WHERE L.CopyID = C.CopyID AND L.Status IN ('ACTIVE', 'OVERDUE')
);

-- Change items that are not ON-LOAN but marked ON-LOAN
UPDATE COPIES C
SET C.Status = 'AVAILABLE'
WHERE C.Status = 'ON-LOAN'
AND NOT EXISTS (
    SELECT 1 FROM LOANS L WHERE L.CopyID = C.CopyID AND L.Status IN('ACTIVE', 'OVERDUE')
);