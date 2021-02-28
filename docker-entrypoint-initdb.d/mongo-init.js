print('################### Start creating database ###################');
db = db.getSiblingDB('schooldb');
db.createUser({
  user: 'school_user',
  pwd: 'School_pwd',
  roles: [{
    role: 'readWrite',
    db: 'schooldb'
  }]
});
print('################### End creating database ###################');
