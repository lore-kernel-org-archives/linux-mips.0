Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Robin Humble <rjh@pixel.maths.monash.edu.au>
Message-ID: <199809240544.PAA26674@pixel.maths.monash.edu.au>
Subject: Re: challenge s boots linux
Date: Thu, 24 Sep 1998 15:44:21 +1000 (EST)
In-Reply-To: <36081277.17A50BC9@infopact.nl> from "Richard Hartensveld" at Sep 22, 98 11:11:19 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Richard Hartensveld <richardh@infopact.nl>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980924054421.LIzrJWbzPp9clqXbUiY2jY1kHvwz0UAj4FL6KM8Psno@z>


>Warning: unable to open an initial console.

I got this message for (it seemed) a variety of reasons. One was that it
couldn't find the nfs server, but in the end it was that I was
booting off an O2 and the permissions on the dev/ directory were all
screwed from SGIs tar. Re-building dev to match a x86/Linux machine
fixed it.
So it's a long shot, but check that your dev directory in the nfs
mounted distribution looks like:

crw-------   1 root     root       4,   0 Sep 13 20:05 console
crw-rw-rw-   1 root     root       1,   3 Jan  1  1980 null
brw-r-----   1 root     disk       1,   1 Jan  1  1980 ram
crw-------   1 root     root       4,   0 Sep  3  1995 systty
crw-------   1 root     root       4,   1 Sep 13 20:05 tty1
crw-------   1 root     root       4,   2 Sep 13 20:05 tty2
crw-------   1 root     root       4,   3 Sep 13 20:05 tty3
crw-------   1 root     root       4,   4 Sep 13 20:05 tty4
crw-------   1 root     root       4,   5 Sep 13 20:05 tty5

+
There's not a line that goes here that  +         Robin Humble
rhymes with anything, anything,      /     rjh@pixel.maths.monash.edu.au
anything. - Camper van Beethoven  + http://www.maths.monash.edu.au/~rjh/
