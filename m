Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199901032216.OAA36969@anchor.engr.sgi.com>
Subject: Re: EFS volume descriptors
In-Reply-To: <368E66DC.15C986F2@netscape.com> from Mike Shaver at "Jan 2, 99 01:35:08 pm"
Date: Sun, 3 Jan 1999 14:16:31 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@netscape.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990103221631.76vmW6ISLBhvtohhYE3w9O5v2fUxWUE4Rty7ZJqkFhQ@z>

Mike Shaver wrote: 
|  On an EFS CDROM, there's a volume descriptor at block 0.  On an EFS
|  partition, there's a superblock at block 1.  I'd like my all-new code to
|  handle both cases, so I'm wondering what's at block 0 of an EFS
|  partition.  Is it something that I can reliably check to see if I'm
|  mounting a partition or CD?

Nothing is at block 0 of the filesystem.  Historically, back to v6
unix, there were things like badblock tables there, so many filesystems
for unix have simply not used block 0.  efs does not use it.

Dave Olson, Silicon Graphics
http://reality.sgi.com/olson   olson@sgi.com
