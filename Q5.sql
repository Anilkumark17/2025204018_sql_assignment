USE assignment_2;

DELIMITER $$

CREATE PROCEDURE PrintAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subId INT;
    DECLARE subName VARCHAR(100);

    DECLARE curs CURSOR FOR SELECT SubscriberID, SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN curs;
    sub_loop: LOOP
        FETCH curs INTO subId, subName;
        IF done THEN
            LEAVE sub_loop;
        END IF;

        -- Print subscriber name
        SELECT CONCAT('Watch history for ', subName) AS Header;

        -- Call existing procedure
        CALL GetWatchHistoryBySubscriber(subId);
    END LOOP;

    CLOSE curs;
END$$

DELIMITER ;
call PrintAllSubscribersWatchHistory()