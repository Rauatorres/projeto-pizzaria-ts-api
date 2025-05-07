import Fastify from 'fastify';

const server = Fastify({ logger: true });

server.listen({ port: 3000 }, (err, adress) => {
    if (err){
        console.error(err);
        process.exit(1);
    }else{
        console.log(`Server successfully started. Listening on ${adress} ...`);
    }
});