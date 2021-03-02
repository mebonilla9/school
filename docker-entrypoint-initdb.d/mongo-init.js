print('################### Start creating database ###################');
db = db.getSiblingDB('schooldb');
db.createUser({
  user: 'schooluser',
  pwd: 'schoolpwd',
  roles: [{
    role: 'readWrite',
    db: 'schooldb'
  }]
});
print('################### End creating database ###################');
