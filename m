Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: cvs update 2_4 branch breaks userland
Date: Tue, 15 Jul 2003 15:40:23 -0700
Message-ID: <007c01c34b22$14b98660$4383a8c0@WSSTEVELAPTOP>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <E19cVhA-0003M6-00@brian.localnet>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Brian Murphy' <brm@murphy.dk>, linux-mips@linux-mips.org
Message-ID: <20030715224023.vEi_YZsJoKqv_Tq86pydC3VfDDbLRqxChA_enl2QPrA@z>

My board runs userland apps that makes use of SIGUSR1. When I did a cvs
update today and recompiled the kernel, when I run my app it quits with
"User defined signal 1" and bails. The signal is delivered a pthread_kill
command. The app runs about 8 or 9 threads all blocking on various IO with
various priority levels. I boot the old kernel back up and it runs fine.

Board is running an NECVR4181
Toolchain is a uclibc something.19 (building 20 now) with gcc 3.3 and the
latest binutils

I have the 2.4.21 kernel and I did a cvs update on it today.

If anyone has any ideas I'd appreciate knowing.

Thanks!

Steve
