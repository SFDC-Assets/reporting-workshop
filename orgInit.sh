sfdx force:org:create -f config/project-scratch-def.json -s -a reporting -d 1

sfdx shane:github:package:install -g mshanemc -r volunteering-base-pkg

sfdx force:source:push

sfdx force:user:create -f config/userDef/user1.json
sfdx force:user:create -f config/userDef/user2.json
sfdx force:user:create -f config/userDef/user3.json
sfdx force:user:create -f config/userDef/user4.json
sfdx force:user:create -f config/userDef/user5.json
sfdx force:user:create -f config/userDef/user6.json
sfdx force:user:create -f config/userDef/user7.json
sfdx force:user:create -f config/userDef/user8.json
sfdx force:user:create -f config/userDef/user9.json
sfdx force:user:create -f config/userDef/user10.json
sfdx force:user:create -f config/userDef/user11.json
sfdx force:user:create -f config/userDef/user12.json
sfdx force:user:create -f config/userDef/user13.json
sfdx force:user:create -f config/userDef/user14.json
sfdx force:user:create -f config/userDef/user16.json
sfdx force:user:create -f config/userDef/user17.json
sfdx force:user:create -f config/userDef/user18.json
sfdx force:user:create -f config/userDef/user19.json
sfdx force:user:create -f config/userDef/user20.json
sfdx force:user:create -f config/userDef/user21.json
sfdx force:user:create -f config/userDef/user22.json
sfdx force:user:create -f config/userDef/user23.json
sfdx force:user:create -f config/userDef/user24.json
sfdx force:user:create -f config/userDef/user25.json
sfdx force:user:create -f config/userDef/user26.json
sfdx force:user:create -f config/userDef/user27.json
sfdx force:user:create -f config/userDef/user28.json
sfdx force:user:create -f config/userDef/user29.json
sfdx force:user:create -f config/userDef/user30.json
sfdx force:user:create -f config/userDef/user31.json
sfdx force:user:create -f config/userDef/user32.json

sfdx force:data:record:update -s User -w "FirstName='User' LastName='User'" -v "FirstName='Awesome' LastName='Admin' Department='Marketing'"
sfdx force:data:record:update -s User -w "FirstName='Security' LastName='User'" -v "FirstName='Angelos' LastName='Kottas' Department='Sales'"
sfdx force:data:record:update -s User -w "FirstName='Integration' LastName='User'" -v "FirstName='Rachel' LastName='Beard' Department='Customer Support'"

sfdx force:user:permset:assign -n VolunteeringApp
sfdx force:user:permset:assign -n VolunteeringAppExtensions
# sfdx force:data:tree:import -p data/masterImportPlan.json
sfdx force:apex:execute -f scripts/setup.cls

# one more user who doesn't volunteer
sfdx force:user:create -f config/userDef/user15.json

sfdx force:org:open