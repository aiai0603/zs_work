const {Sequelize} = require('sequelize')
//LOCAL CONNECTION
// const sequelize = new Sequelize('conduit','root','password',{
//     dialect: 'sqlite',
//     storage: 'appdb.sqlite'
// }); 


//LOCAL CONNECTION
/*
const sequelize = new Sequelize('test','root','123',{
    dialect: 'mysql',
    host:'localhost',
    logging: false
})
*/


//AMAZON RDS CONNECTION
 const sequelize = new Sequelize('node','root','123456',{
    dialect: 'mysql',
    host:process.env.DB_HOST,
    logging: false,
    port: 3306
});
 
// const sequelize = new Sequelize('postgres',process.env.DB_USER,process.env.DB_PASS,{
//     dialect: 'postgres',
//     host: process.env.DB_HOST,
//     logging: false,
//     port: 5432,
//     dialectOptions: {
        
//     }
// });

const checkConnection =async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

checkConnection()

module.exports = sequelize