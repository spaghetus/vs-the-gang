const fs = require('fs');

let re = new RegExp(/\[\s*\['Tutorial'\][\s\S]*?\];/, 'gm');
let input = fs.readFileSync('./Kade-Engine/source/StoryMenuState.hx').toString('utf-8');
console.log(input.search(re));
let newContents = fs.readFileSync('./week_data/weeks-list.hx').toString('utf-8');
let output = input.replace(re, newContents);
fs.writeFileSync('./Kade-Engine/source/StoryMenuState.hx', output)
