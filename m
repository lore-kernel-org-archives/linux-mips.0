Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709162101.RAA05770@neon.ingenia.ca>
Subject: EFS test kernel
Date: Tue, 16 Sep 1997 17:01:05 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970916210105.apS8nkipXgxVYtv2_-IJSF-9nLjIm2dE2TNaJsdLYoc@z>

ftp://ftp.linux.sgi.com/pub/test/vmlinux-970916-efs.gz has rudimentary
support for EFS partition mounting, and it lets me do some basic stuff
on my IRIX partition, like list small[*] directories and run binaries.

I've got my IRIX root mounted at /usr/gnemul/irix (the emulation code
requires that location), and have a symlink /lib/rld ->
/usr/gnemul/irix/lib/rld.  I sometimes get problems specifying
executables by explicit path (./ls or /usr/gnemul/irix/bin/ls), but if
I put the current directory in my path and chdir to there, things like
ls and date and wc and uname work just fine.

Please let me know if you get any problems.

[*] small == not requiring indirect extents

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>                 Ignore the man behind the curtain.                  
#>                                                                     
#> "And then I realized that it never should have worked in the first  
#>  place.  Thus, it would not work again until rewritten." --- Anon.  
