#!/bin/sh
echo $ADMIN_PWD
export ADMIN_PWD=`node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" $ADMIN_PWD`
echo $ADMIN_PWD
npm start -- --userDir ./data
