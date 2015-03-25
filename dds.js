/******************************************************************************
* (c) 2005-2015 Copyright, Real-Time Innovations.  All rights reserved.       *
* No duplications, whole or partial, manual or electronic, may be made        *
* without express written permission.  Any such copies, or revisions thereof, * 
* must display this notice unaltered.                                         *
* This code contains trade secrets of Real-Time Innovations, Inc.             *
******************************************************************************/

var ffi = require("ffi");
var util = require('util');

var arch    = 'put arch here'
var libName = 'put libName here'

var LIB_FULL_PATH = __dirname + '/lib/' + arch + '/' + libName;

var rtin = ffi.Library(LIB_FULL_PATH, {
"DDS_DomainParticipantFactory_create_participant": [ "pointer", ["pointer", "int", "pointer", "pointer", "int"]],
});

