Message-ID: <199907151906.VAA28323@zaphod.et.tudelft.nl>
Subject: updating 5.1 distro
Date: Thu, 15 Jul 1999 21:06:58 +0200 (CEST)
From: Edwin Hakkennes <E.Hakkennes@et.tudelft.nl>
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: linux@cthulhu.engr.sgi.com
Cc: Edwin Hakkennes <E.Hakkennes@et.tudelft.nl>
Message-ID: <19990715190658.veFZqdRxJqPYTlcBFrlSz06W6bVM4Ju4go6vFKt8MKQ@z>

Hi all,

We are planning to use an old Indy with 9G of disk as an
ftp-mirror-site. As this will obviously attract hackers, our sys-admin
really wants to bring the machine in an up-to-date security state
before widely announing it. Right now it has RedHat 5.1 installed,
without any security updates. This seems to run fine.

I've seen some effort to produce redhat5.2 RPMS and even a message
about getting glibc2.1 to work on mipseb, but nothing further.

My (next) questions are:

1) Is there already someone building/maintaining a 5.2 or 6.0 distro?

2) Would supplying the right packages/hdlist to the 5.1 installer work?

3) Are the diffs needed to build the 5.1 distro backported in RedHat 6.0?
   (if not, are these stored somewhere?)

I'm running rpm --rebuild *redhat6.0.src.rpm right now. At least
glibc2.1 is giving errors, I'll see about some more tomorrow morning.

Thanks for any answers and 
Greetings,

Edwin Hakkennes

   
