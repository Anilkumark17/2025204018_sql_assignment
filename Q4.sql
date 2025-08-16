USE assignment_2;
DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subId INT;
    DECLARE curs CURSOR FOR 
        SELECT DISTINCT SubscriberID FROM WatchHistory;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN curs;
    loop_subs: LOOP
        FETCH curs INTO subId;
        IF done THEN
            LEAVE loop_subs;
        END IF;
        CALL GetWatchHistoryBySubscriber(subId);
    END LOOP;
    CLOSE curs;
END$$

DELIMITER ;

CALL SendWatchTimeReport();
