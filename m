From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199910012110.OAA12471@oz.engr.sgi.com>
Subject: Re: (offtopic) sgi hard drive problem
Date: Fri, 1 Oct 1999 14:10:52 -0700 (PDT)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
Content-Transfer-Encoding: 7bit
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19991001211052.t0DTWH1jYUCZD65kzo2jFTkytbeYCpYJPreQGq_G_KA@z>


[Just trying to help: forwarding this bounce from Alex Kozlov, thanks Alex]

:Subject: Re: sgi hard drive problem.
:In-Reply-To: <Pine.GSO.3.96.991001142618.11A-100000@yacht.ee.fit.edu> from Can Altineller at "Oct 1, 99 03:25:36 pm"
:To: altine@yacht.ee.fit.edu (Can Altineller)
:Date: Fri, 1 Oct 1999 13:14:43 -0700 (PDT)
:Cc: linux@cthulhu.engr.sgi.com
:WWW-page: http://robotics.stanford.edu/~alexvk
:From: alexvk@sgi.com
:MIME-Version: 1.0
:Content-Type: text/plain; charset=US-ASCII
:Content-Transfer-Encoding: 7bit
:
:You need to make a new IRIX boot disk (by using some other SGI
:computer):
:
:- boot up a system to single user mode
:
:- do fx to partition the second disk as a root disk
:
:- make file system on the second disk and mount the file system
:
:- copy sash to the new disk
:
:# fx "dksc(0,2)"
:# mkfs /dev/rdsk/dks0d2s0
:# mount /dev/dsk/dks0d2s0 /mnt
:# /sbin/dvhtool -v g sash sash; /sbin/dvhtool -v c sash sash /dev/rdsk/dks0d2vh
:# rm sash
:
:The problem obviously is that Linux erased your IRIX boot record and
:partitions.
:
:--
:Alexander V. Kozlov | alexvk@engr.sgi.com | (650) 933-8493
:


-- 
Peace, Ariel
