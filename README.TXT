1. Open MySQL Workbench and connect to your local database.
2. Run the CREATE TABLE and INSERT statements given in the lab to set up schema.
3. Execute each script in order (q1.sql … q5.sql).
4. Call procedures to test:
   CALL ListAllSubscribers();
   CALL GetWatchHistoryBySubscriber(1);
   CALL AddSubscriberIfNotExists();
   CALL SendWatchTimeReport();
   CALL PrintAllSubscribersWatchHistory();


