Date: Wed, 2 Feb 2000 22:52:30 -0600 (CST)
From: Richard Dubrawsk <dubrawsk@nyquist.ece.uiuc.edu>
Subject: Howto compile kernel on indy
Message-ID: <Pine.LNX.3.96.1000202224621.26215A-100000@nyquist.ece.uiuc.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: linux@cthulhu.engr.sgi.com
Message-ID: <20000203045230.XUnjXCE6tLYea6eN0MwnbbhHtwElwgrqocDJWpzOONU@z>

Hello
I have tried repeatedly to compile both the 2.1.100 and 2.2.1 kernel trees
on an Indy with the hardhat installation.  I had to manually remove the
${CROSS_COMPILE} directives in the Makefile on the 2.2.1 tree since it was
defaulting to cross compiling otherwise.  My questions are:

1. Is it possible to natively compile a kernel on an indy running linux,
or must it be cross compiled on another machine?

2. What ever happenned to rdev.  According to the linux-utils package it
should have been installed in /usr/sbin, and it is noticably missing?

3. Where can I find updated ports of the basic tools like compiler and
libraries?  

From the messages I receive in this list, I know people are working on
this project, and I would like to provide some input, but without some
basic tools that work it is difficult to start.  


Thank you 

Richard Dubrawski

University of Illinois 
Urbana-Champaign

(web page: http://www.students.uiuc.edu/~dubrawsk/)
