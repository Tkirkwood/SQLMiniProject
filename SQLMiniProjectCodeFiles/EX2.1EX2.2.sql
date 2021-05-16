create DATABASE Tkirkwood_db
use tkirkwood_db

CREATE TABLE Spartans
(
    Title VARCHAR(20) DEFAULT 'Mr.',
    firstName VARCHAR(15),
    lastName VARCHAR (15),
    University VARCHAR(30),
    Course VARCHAR(40),
    mark VARCHAR (15) DEFAULT 'First'
)

INSERT Spartans
(
    firstName, lastName, University,Course
)
VALUES
(
    'Adrian', 'Wong', 'Oxford University', 'Bio-mechanical Engineering'
),
(
    'Thomas', 'Canfield','Cambridge University', ' Software Development'
),
(
    'Karim', 'Wholer', ' University of London', 'Elecronics System Engineering'
),
(
    'Alexander', 'Legon', 'Edinburgh University', 'Software Development'
),
(
    'Alex', 'Lynch', 'University of Yorkshire', 'Digital systems Engineering'
)

SELECT * FROM spartans
