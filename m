Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199901032222.OAA25109@anchor.engr.sgi.com>
Subject: Re: EFS volume descriptors
In-Reply-To: <368FED40.12D7952E@netscape.com> from Mike Shaver at "Jan 3, 99 05:20:48 pm"
Date: Sun, 3 Jan 1999 14:22:55 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@netscape.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990103222255.DKnzdbKh5UV6m41ArHwrH_R_juz-hQ8v6vzXcotPJyM@z>

Mike Shaver wrote: 
|  Dave Olson wrote:
|  > Nothing is at block 0 of the filesystem.  Historically, back to v6
|  > unix, there were things like badblock tables there, so many filesystems
|  > for unix have simply not used block 0.  efs does not use it.
|  
|  Drat.  So do I need the user to tell me if it's an EFS CD vs. an EFS
|  partition, so that I know to use the voldesc or not?  I guess I could
|  register a second fstype ("efscd" or some such) and make the user use
|  that.

Look at block 0 on the disk ("absolute" block 0), and use the magic 
number to see if it's an sgi volume.  If it is, for each partition
other than 8 and 10, check to see if block 1 is an EFS superblock.
That's the only possible way.  For almost all (but not all!) efs
CD's, there will only be partition 7,8,10, so you can just check
partition 7, if you want to be lazy.

And of course, it's possible to have hybrid iso9660 and sgi/efs CD's
as well, so you might still want to check for iso9660.


Dave Olson, Silicon Graphics
http://reality.sgi.com/olson   olson@sgi.com
