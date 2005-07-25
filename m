From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: re: Fwd: mips64 gdb problem
Date: Mon, 25 Jul 2005 16:39:56 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20050725203743Z8225534-3678+4331@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Maxim Osipov' <maxim.osipov@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20050725203956.EXg4dASleqI313DIyzNGd3iJ0bozvlw8RXfUkU_T5Ig@z>

I'm butting heads with this problem also.  I get the error below when
running mips64-unknown-linux-gdb on a 64 bit mips binary.  Has anyone come
up with a work around?

Thanks,
Bryan

>Hello,
>I wonder, is there some way to get debuger working on N64 target?
>Thanks,
>Maxim

>>On Fri, Jun 24, 2005 at 05:42:25PM +0400, Maxim Osipov wrote:
>> Hello,
>>
>> I have a problem trying to debug 64-bit mips binary with gdb-6.3. It
>> fails with the following message:
>>
>> /home # gdb 64test
>> GNU gdb 6.3
>> Copyright 2004 Free Software Foundation, Inc.
>> GDB is free software, covered by the GNU General Public License, and you
are
>> welcome to change it and/or distribute copies of it under certain
conditions.
>> Type "show copying" to see the conditions.
>> There is absolutely no warranty for GDB.  Type "show warranty" for
details.
>> This GDB was configured as "mips64-linux-gnu"...
>> ../../gdb-6.3/gdb/dwarf2-frame.c:1411: internal-error:
>> decode_frame_entry_1: Assertion `fde->cie != NULL' failed.
