Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199606172227.PAA23297@neteng.engr.sgi.com>
From: lm@gate1-neteng.engr.sgi.com (Larry McVoy)
Subject: Re: strace project 
Date: Mon, 17 Jun 1996 15:27:36 -0700
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.esd.sgi.com>
Cc: linux@neteng.engr.sgi.com
Message-ID: <19960617222736.l6bx7ifzk3ax2X7Pucwt1hSSqmtNMivM3Obb4CyO88I@z>

:        If by strace you mean tracing system call arguments and results,
: try using par(1).  (It does not help if you want to decode argument structures,
: however.)  Here is a sample:

He needs to decode args.  The idea was that strace groks most of the ioctls
in most OS's.  If we ever want to run little endian binaries on a big
endian kernel (which would be kinda cool) we need the arg decode.  David
wanted it for something else too.

--lm
