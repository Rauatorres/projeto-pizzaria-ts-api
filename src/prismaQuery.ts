import { PrismaClient } from '../generated/prisma';

const prisma = new PrismaClient();

async function query(){
    console.log(await prisma.sabor.findMany());
}

query();