sfdx force:org:create -f config/project-scratch-def.json -s -a reporting -d 1

sfdx shane:github:package:install -g mshanemc -r volunteering-base-pkg

sfdx force:source:push

sfdx force:user:create -f config/userDef/user1.json &
sfdx force:user:create -f config/userDef/user2.json &
sfdx force:user:create -f config/userDef/user3.json &
sfdx force:user:create -f config/userDef/user4.json &
sfdx force:user:create -f config/userDef/user5.json &
sfdx force:user:create -f config/userDef/user6.json &
sfdx force:user:create -f config/userDef/user7.json &
sfdx force:user:create -f config/userDef/user8.json &
sfdx force:user:create -f config/userDef/user9.json &
sfdx force:user:create -f config/userDef/user10.json &
sfdx force:user:create -f config/userDef/user11.json &
sfdx force:user:create -f config/userDef/user12.json &
sfdx force:user:create -f config/userDef/user13.json &
sfdx force:user:create -f config/userDef/user14.json &

sfdx force:user:permset:assign -n VolunteeringApp
sfdx force:user:permset:assign -n VolunteeringAppExtensions
# sfdx force:data:tree:import -p data/masterImportPlan.json
sfdx force:apex:execute -f scripts/setup.cls
sfdx force:org:open