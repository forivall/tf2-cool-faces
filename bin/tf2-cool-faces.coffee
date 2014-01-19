#!/usr/bin/env coffee
argv = (require 'optimist').argv
require('../index')(argv._[0]).start()
