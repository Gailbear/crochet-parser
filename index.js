parser = require('./crochet')
fs = require('fs')

f = fs.readFileSync("./pattern.txt").toString()

parser.parse(f)
