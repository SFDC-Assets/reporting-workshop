# Create the demo org
sf demoutil org create scratch -f config/project-scratch-def.json -d 1 -s -p reporting

# sfdx force:data:record:create -s ContentWorkspace -v "Name='Asset Library' DeveloperName=sfdx_asset_company_assets"

sfdx shane:github:package:install -g mshanemc -r volunteering-base-pkg

sf project deploy start

sf org create user -f config/userDef/user1.json
sf org create user -f config/userDef/user2.json
sf org create user -f config/userDef/user3.json
sf org create user -f config/userDef/user4.json
sf org create user -f config/userDef/user5.json
sf org create user -f config/userDef/user6.json
sf org create user -f config/userDef/user7.json
sf org create user -f config/userDef/user8.json
sf org create user -f config/userDef/user9.json
sf org create user -f config/userDef/user10.json
sf org create user -f config/userDef/user11.json
sf org create user -f config/userDef/user12.json
sf org create user -f config/userDef/user13.json
sf org create user -f config/userDef/user14.json
sf org create user -f config/userDef/user15.json
sf org create user -f config/userDef/user17.json
sf org create user -f config/userDef/user18.json
sf org create user -f config/userDef/user19.json
sf org create user -f config/userDef/user20.json
sf org create user -f config/userDef/user21.json
sf org create user -f config/userDef/user22.json
sf org create user -f config/userDef/user23.json
sf org create user -f config/userDef/user24.json
sf org create user -f config/userDef/user25.json
sf org create user -f config/userDef/user26.json
sf org create user -f config/userDef/user27.json
sf org create user -f config/userDef/user28.json
sf org create user -f config/userDef/user29.json
sf org create user -f config/userDef/user30.json
sf org create user -f config/userDef/user31.json
sf org create user -f config/userDef/user32.json
sf org create user -f config/userDef/user33.json
sf org create user -f config/userDef/user34.json
sf org create user -f config/userDef/user35.json
sf org create user -f config/userDef/user36.json
sf org create user -f config/userDef/user37.json
sf org create user -f config/userDef/user38.json
sf org create user -f config/userDef/user39.json

sf data update record -s User -w "FirstName='User' LastName='User'" -v "FirstName='Awesome' LastName='Admin' Department='Marketing'"
sf data update record -s User -w "FirstName='Security' LastName='User'" -v "FirstName='Angelos' LastName='Kottas' Department='Sales'"
sf data update record -s User -w "FirstName='Integration' LastName='User'" -v "FirstName='Rachel' LastName='Beard' Department='Customer Support'"

sf org assign permset -n VolunteeringApp
sf org assign permset -n VolunteeringAppExtensions
# sfdx force:data:tree:import -p data/masterImportPlan.json
sf apex run -f scripts/setup.cls

# one more user who doesn't volunteer
sf org create user -f config/userDef/user15.json

sf org open
