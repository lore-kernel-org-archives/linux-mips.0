Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199606182323.QAA15589@yon.engr.sgi.com>
Subject: gcc solution looks plausible (was: anyone know if this is true?)
Date: Tue, 18 Jun 1996 16:23:56 -0700 (PDT)
In-Reply-To: <199606182106.OAA15730@anchor.engr.sgi.com> from "Dave Olson" at Jun 18, 96 02:06:24 pm
Reply-To: ariel@cthulhu.engr.sgi.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Dave Olson <olson@anchor.engr.sgi.com>
Cc: gcc@corp.sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19960618232356.oRTp5jrP-WP36iVJhP6QHUNOWGO0glZL15f5JB0rtVU@z>

[I'm Ccing gcc@corp and linux@engr, some more people may be happy to hear this]

Dave Olson wrote to me about 'ld':
>
>The one in /var/sysgen/root is the same one that driverwrap invokes.
>
>There are two ld's, the one in usr/lib, and the one in usr/bin.  They
>are different.  There is a one to one match between /usr/bin/ld and
>/var/sysgen/root/usr/bin/ld, and similarly for /usr/lib/ld and
>/var/sysgen/root/ld
>
>(assuming a 32 bit system)
>

Thanks! that's encouraging.

I assume this means that I should install two symlinks:

  /usr/freeware/bin/ld -> /var/sysgen/root/usr/bin/ld
  /usr/freeware/lib/gcc-lib/mips-sgi-irixX.Y/2.7.2/ld -> /var/sysgen/root/ld

Or something close to this.

This plus building gcc -with-gnu-as, using -32 -old_ld in the specs file
and Bean's permission to package crt[1n].o  should solve all the problems
I'm aware of and make many customers happy.

That was very helpful. Looks like a solution is close. Thanks again.
-- 
Peace, Ariel
