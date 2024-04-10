// const {PrismaClient} = require('@prisma/client')
//
// const prisma = new PrismaClient()
// const bcrypt = require("bcrypt")
// const saltRounds = 10
// const password = "Admin@123"
//
// async function main() {
//
//     // const allClients = await prisma.client.findMany({
//     //     where: {
//     //         IdClient: 1
//     //     }
//     // });
//     // let hashedpasswd = ""
//     // console.log(allClients);
//     // bcrypt.genSalt(saltRounds).then(salt => {
//     //     console.log('Salt: ', salt)
//     //     hashedpasswd = bcrypt.hash(password, salt)
//     // })
//     //     .then(hash => {
//     //         console.log('Hash: ', hash)
//     //     })
//     //     .catch(err => console.error(err.message))
//     //
//     // await prisma.client.create({
//     //     data: {
//     //         IdClient: 2,
//     //         Nom: 'jeffrey',
//     //         Prenom: 'doe',
//     //         AddresseMail: 'maxdoe@gmail.com',
//     //         DateDeNaissance: '18/01/2000',
//     //         MotDePasse: "1234",
//     //         NumeroDeTelephone: "125369874",
//     //         Anciennete: "01/05/2024"
//     //     }
// }
//
// )
//
// }
//
// main()
//     .then(async () => {
//         await prisma.$disconnect()
//     })
//     .catch(async (e) => {
//         console.error(e)
//         await prisma.$disconnect()
//         process.exit(1)
//     })


