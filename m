From: "Lyle Bainbridge" <lyle@zevion.com>
Subject: RE: Cross Compilation
Date: Wed, 23 Jul 2003 19:55:56 -0500
Message-ID: <000101c3517e$5783a400$1400a8c0@radium>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030723100946.N3135@mvista.com>
Return-Path: <lyle@zevion.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Tiemo Krueger - mycable GmbH' <tk@mycable.de>
Cc: saravana_kumar@naturesoft.net, linux-mips@linux-mips.org
Message-ID: <20030724005556.sZpwFpla_qaRmrVXdJJq1UzdDSogXdK1_gp6ZUnkmGk@z>


> I took a look.  It looks similar to one project that I worked on
> before.   Very interesting.
> 
> Has anybody tried successfully to do a cross MIPS yet?  From 
> a Linux/i386 host obviously ...

I have used the uclibc toolchain for big endian mips. It works great.  I
also have a gcc-3.2.3/glibc-2.2.5 based toolchain, and have used it to
cross compile a kernel and a simple root filesystem.

Lyle
