const execa = require('execa');

var schemaFileName = 'schema.proto';

async function runWithSpaces(command) {
    let commands = command.split(' ');
    return await execa(commands.shift(), commands);
}

async function run(lang = 'csharp') {
    try {
        let codePath = `com/${lang}/`
        await runWithSpaces(`mkdir -p ${codePath}`);
        await runWithSpaces(`protoc ${schemaFileName} --${lang}_out=./${codePath}`);
        try {
            await runWithSpaces(`git checkout --orphan code/${lang}`);
        } catch (err) 
        {
            await runWithSpaces(`git checkout code/${lang}`);
        }
        await runWithSpaces(`git ls-files | grep -v "^com/csharp" | xargs git rm -q --cached`);
        await runWithSpaces(`git add .`);
        await runWithSpaces(`git commit -m "first"`);
    } catch (err) {
        console.error('Error occurred : ' + err.message);
    }
}


run();