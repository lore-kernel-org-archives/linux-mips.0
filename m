Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Wed, 28 May 1997 19:26:37 -0700
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199705290226.TAA03967@anchor.engr.sgi.com>
Subject: Re: hardware independent hinv
Sender: owner-linux@cthulhu.engr.sgi.com
To: Larry McVoy <lm@neteng.engr.sgi.com>, Mike Shaver <shaver@neon.ingenia.ca>
Cc: breyer@swmgr.engr.sgi.com, swmgr@swmgr.engr.sgi.com, scotth@sgi.com, linux@yon.engr.sgi.com, ariel@sgi.com
Message-ID: <19970529022637.fnKrGqj2EdCLAjs2-qLokHiozUI4LtAqjAkCpJEPRok@z>

The info definitely isn't in /proc on irix.

Doesn't dmesg have the problem on linux that it has on Sun systems; that is,
it only works until enough kernel printfs have happened that the circular
buffer wraps?

Dave Olson, Silicon Graphics   Guru and busybody at large
http://reality.sgi.com/olson   olson@sgi.com
