Date: Thu, 24 Apr 2003 10:43:45 +0300 (IDT)
From: Nir Tzachar <tzachar@cs.bgu.ac.il>
Subject: RE: Crash on insmod
In-Reply-To: <1051006532.8589a060yaelgilad@myrealbox.com>
Message-ID: <Pine.LNX.4.44.0304241036510.30698-100000@merlin>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <tzachar@cs.bgu.ac.il>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gilad Benjamini <yaelgilad@myrealbox.com>
Cc: kernelnewbies@nl.linux.org, linux-mips@linux-mips.org
Message-ID: <20030424074345.DfsCm_lxrgJGDxqexcBOprvvjwkVXK_lGIDg7mUn_vs@z>

> Using /lib/modules/2.4.20-pre6-sb20021114 ...
> unable to handle kernel paging request at virtual address 00006e76, epc == c0005100, ra == 80117e08
> Oops in fault.c::do_page_fault, line 224:

hello.

from ur oops msg, can i assume ur using 2.4.20-pre6 ???
does this problem happen on a stable release? 
try using a stable vanila kernel, and c what happens...

i tried insmoding ur module, and it gave no problem using  a 2.4.18 
or 2.4.20 on i386 -> maybe ur problem is mips related ??



-- 
========================================================================
nir.
