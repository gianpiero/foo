/*
 * Copyright (c) 2005-2015 Real-Time Innovations, Inc. All rights reserved.
 * Permission to modify and use for internal purposes granted.
 * This software is provided "as is", without warranty, express or implied.
 */

var sleep = require('sleep');
var rti   = require('rticonnextdds-connector');
var readline = require('readline');

var nickname;
var rl = readline.createInterface(process.stdin, process.stdout);


var connector = new rti.Connector("MyParticipantLibrary::Chat",__dirname + "/Chat.xml");
var output = connector.getOutput("MyPublisher::ChatWriter");
var input = connector.getInput("MySubscriber::ChatReader");


// handling output to screen
function console_out(msg) {
    process.stdout.clearLine();
    process.stdout.cursorTo(0);
    console.log(msg);
    rl.prompt(true);
}

// Ask for the nickname
rl.question("Please enter a nickname: ", function(name) {
    nickname = name;
    output.instance.setString("nickname", name);
    output.instance.setString("message", "just joined the chat");
    output.write();
    rl.prompt(true);
});

// Handling user input and publishing
rl.on('line', function (line) {
    // send chat message
    output.instance.setString("message", line);
    output.write();
    rl.prompt(true);
});

// Handling incoming messages
connector.on('on_data_available',
   function() {
     input.take();
     for (i=1; i <= input.samples.getLength(); i++) {
         if (input.infos.isValid(i)) {
             var sender = input.samples.getString(i, "nickname")
             var msg = input.samples.getString(i, "message")
             if (sender != nickname) {
                 console_out("[" + sender + "]: " + msg);
            }
         }
     }

});
