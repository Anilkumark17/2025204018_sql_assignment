DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subName VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO subName;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT subName AS Subscriber;
    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;

call ListAllSubscribers;
