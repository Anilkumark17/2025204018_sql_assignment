USE assignment_2;

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

USE assignment_2;

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;
DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE cnt INT DEFAULT 0;
    DECLARE nextId INT DEFAULT 0;

    -- check if subscriber exists
    SELECT COUNT(*) INTO cnt
    FROM Subscribers
    WHERE SubscriberName = subName;

    IF cnt = 0 THEN
        -- get next ID
        SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO nextId 
        FROM Subscribers;

        -- insert with nextId
        INSERT INTO Subscribers(SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (nextId, subName, CURDATE());

        SELECT CONCAT('Subscriber "', subName, '" added successfully.') AS Message;
    ELSE
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Message;
    END IF;
END$$

DELIMITER ;

call AddSubscriberIfNotExists("Anil");