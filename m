From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: mips64 crosstool
Date: Mon, 18 Jul 2005 21:00:26 +0200
MIME-Version: 1.0
Message-ID: <000001c58bca$f50976e0$0300a8c0@intra.lexbox.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <6097c4905071221414a929ed2@mail.gmail.com>
Content-Class: urn:content-classes:message
Return-Path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: unlisted-recipients, no To-header on input, IMB Recipient 1 <mspop3connector.david.sanchez@lexbox.fr>
Cc: 'Linux/MIPS Development' <linux-mips@linux-mips.org>
Message-ID: <20050718190026.pQGo-dZYIAyjLOb9oAAQytUOerIyj1vVVXEeI3qvZ7g@z>

Many thanks to everyone who has helped me on this issue. 

I ended up abandoning the crosstool approach.  It supports mips32 well, but
not mips64.  Linux from scratch has a very good step by step procedure for
building a tool chain for mips64.  I was able to build with very little
headaches.  Unfortunately, I have not yet been able to execute any programs
compiled with the tool chain.  I'm not sure where I went wrong. 

PMC sierra is working on an update for their tool chain.  They have supplied
me with a "beta" version tool chain that has solved my problems.  Now, I am
able to compile with -mabi=64 and -lpthread.  The executable no longer
Segfaults.  Since I'm past this problem, I will probably not spend much more
time trying to build a working tool chain.

Bryan   
