Message-ID: <AEC4671C8179D61194DE0002B328BDD2070C5C@ATLOPS>
From: Dinesh Nagpure <dinesh_nagpure@ivivity.com>
Subject: RE: un handled paging request, kernel v2.4.16
Date: Tue, 1 Oct 2002 08:46:18 -0400 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Return-Path: <dinesh_nagpure@ivivity.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20021001124618.QEFhiQHHpgJlDQoc2ufk_XSd1vwsKsS8iYCXliS_jk4@z>

Hello again,

I have been searching the mailing archives and haven't yet seen any
problem/mail exchanged about RM5231A. I did saw a mail from Carsten where he
was worried about a probable bug in _save_fp_context function in
arch/mips/kernel/r4k_fpu.S. I am not sure which kernel version he was
looking into then but the one I am using don't have this fix (if it was a
required one). I tried it anyways but it did not work. Also Matt Dharm was
having some crashing problems initially this year(it was a different MIPS
processor though), I have not yet reached the mail where he found his
solution or his mail on what fixed the problem, Matt can you throw some
light here?

Since there is no talk about RM5231A I am wondering if there were no
problems at all or no one have verified it in a while now.

I am also trying to understand where does execution goes after start_thread(
) is called to setup a new thread for execution. Is it put to execution
immediately or later when schedule gets called. Anybody?

Hoping to put this problem to bed soon,
Dinesh
iViVITY Inc.

 
-----Original Message-----
From: Dinesh Nagpure [mailto:dinesh_nagpure@ivivity.com]
Sent: Monday, September 30, 2002 4:22 PM
To: linux-mips@linux-mips.org; gcc-help@gcc.gnu.org
Subject: un handled paging request, kernel v2.4.16


Hi,

In porting Linux kernel version 2.4.16 to our platform using the RM5231A, I
am struggling with this page fault for a couple of days now and would very
much appreciate any input to fix this.

Here is what I see is happening, after completing the initial boot up when
it is time to start the user-mode stuff I get a un handled paging request
fault.
