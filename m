Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199707102138.OAA23929@oz.engr.sgi.com>
Subject: How to get the masses (IRIX<->Linux)
Date: Thu, 10 Jul 1997 14:38:49 -0700 (PDT)
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970710213849.x961ySkkqH1getYDMwWBwX13jtAEqFcmDcY9MTejuTk@z>

To get a critical mass of SGI users installing/running linux
I believe we should aim at a setup where any non-guru could:

	1) Install a full Linux distribution over the net
	   (e.g. from linus.linux) from a running IRIX system
	   On a virgin (separate) SCSI disk.

	2) Once it is there, hot-start Linux from IRIX

If we do it this way, users will be able to keep IRIX
and it'll cost just an additional disk (a few hundred dollars)
to get Linux running on the systems they are already used to
work with.  Since they have little to lose or to risk this
way we have a much higher chance to get many users on board.

Tangentially related:
For those who don't know this, you may do a scheduled auto
power-off / power-on on IRIX:

        % su
        # at 5am July 3
        /usr/sbin/wakeupat 6pm Thursday
        /etc/shutdown -y
        <Ctl-d> (control - d)  This will submit the job.
        # exit

If we could rewrite wakeupat or reboot to take some
extra boot options or alternatively run some Linux loader
(SILO/MILO) from IRIX then 2) should be easy.

-- 
Peace, Ariel
