Message-ID: <009401c2f7aa$0137f2a0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <04C8EDC5AE3FD611ABE40002B39CF69B07F37F@ntah901e.savan.com>
Subject: Re: mips5kc - cpu registers
Date: Mon, 31 Mar 2003 19:21:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Amit.Lubovsky@infineon.com, linux-mips@linux-mips.org
Message-ID: <20030331172129.PR-0J89uYvvIAwHt9mxxpCn7lBnB9QvChLgvgux1JXY@z>

In general, gcc (and most other compilers)
will do this for you automatically if you enable
any reasonable level of optimization.  There
is no need to designate the variable as "FAST",
one simply needs to avoid having it be global,
static, or volatile.

----- Original Message ----- 
From: <Amit.Lubovsky@infineon.com>
To: <linux-mips@linux-mips.org>
Sent: Monday, March 31, 2003 6:45 PM
Subject: mips5kc - cpu registers


> Hi,
> is there a possibility to use cpu registers in the code (temporarily)
> instead of allocating 
> automatic variables something like:
> func a()
> {
> FAST int, i, tmp;
> tmp = ...
> ...
> }
> 
> as in vxWorks ?
> 
> Thanks,
> Amit.
> 
> 
