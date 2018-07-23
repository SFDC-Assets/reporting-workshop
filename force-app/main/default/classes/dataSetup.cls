public with sharing class dataSetup {

    public static void dataSetup() {
        // create the accounts
        list<account> accounts = new list<account>();

        accounts.add(new Account(name='Visitacion Valley Elementary', Mission__c='Education'));
        accounts.add(new Account(name='San Francisco-Marin Food Bank', Mission__c='Public Health'));
        accounts.add(new Account(name='Golden Gate Parks Conservancy', Mission__c='Environment'));
        accounts.add(new Account(name='Humane Society', Mission__c='Animal Welfare'));

        insert accounts;

        list<Volunteer_Event__c> events = new list<Volunteer_Event__c>();

        datetime wayback = System.today().addDays(-365);
        datetime tracker = wayback;

        do {
            for (account a:accounts){
                Volunteer_Event__c event = new Volunteer_Event__c();
                event.Partner__c = a.Id;

                if (a.Name == 'Visitacion Valley Elementary'){
                    event.Name = 'Reading';
                    event.Description__c = '<p>It&#39;s our weekly trip to read books for the kindergartners again!  </p><p>We&#39;ll take some of our favorite books...dress as yourselves!</p>';
                    event.Start__c = tracker.addDays(0);
                    event.End__c = event.Start__c.addHours(2);
                } else if (a.Name == 'San Francisco-Marin Food Bank'){
                    event.Name = 'Food Bank Logistics';
                    event.Description__c = 'help sort and organize the incoming food donations, stocking the shelves, coolers, bins, etc';
                    event.Start__c = tracker.addDays(1);
                    event.End__c = event.Start__c.addHours(4);
                } else if (a.Name == 'Golden Gate Parks Conservancy'){
                    event.Name = 'Park Maintenance Day';
                    event.Description__c = 'trail and sand ladder maintenance.  Removing invasive species.  Bring gloves, sturdy shoes, and sunscreen';
                    event.Start__c = tracker.addDays(3);
                    event.End__c = event.Start__c.addHours(8);
                }
                else if (a.Name == 'Humane Society'){
                    event.Name = 'Adoption Fair';
                    event.Description__c = 'Help people find their next pet from the shelter...we need staff to welcome people, help them complete paperwork, take animals for microchipping, and maintain order';
                    event.Start__c = tracker.addDays(5);
                    event.End__c = event.Start__c.addHours(3);
                }

                events.add(event);
            }
            tracker = tracker.addDays(7);
        } while (tracker < System.now().addDays(45));
        // create a series of event templates

        insert events;

        // grab the users
        list<user> users = [select id, firstname, lastname from user where usertype = 'Standard' and firstname != 'CPQ'];
        list<Volunteers__c> vols = new list<Volunteers__c>();

        list<id> volunteerIds = new list<id>();
        for (user u:users){
            // 2 to 7 distribution of likelihood to volunteer
            integer propensity = 2 + integer.valueOf(Math.floor(Math.random()*5));
            for (integer k=0; k<propensity; k++){
                volunteerIds.add(u.Id);
            }
        }

        for (Volunteer_Event__c event: events){
            // pick a number between 3 and 7
            Integer volunteerCount = 3 + integer.valueOf(Math.floor(Math.random()*4));
            for (integer k=0; k<volunteerCount; k++){
                integer UserIndex = integer.valueOf(Math.floor(Math.random()*volunteerIds.size()));
                Volunteers__c vol = new Volunteers__c();
                vol.Event__c = event.Id;
                vol.CreatedById = volunteerIds[UserIndex];
                if (event.End__c < System.now()){
                    vol.Status__c = 'Completed';
                } else {
                    vol.Status__c = 'Volunteered';
                }
                vols.add(vol);
            }
        }

        insert vols;
    }

    public static void deleteAll() {
        delete [select id from Volunteers__c];
        delete [select id from Volunteer_Event__c];
        delete [select id from Account];
    }

}
