Message-ID: <3AA4878C.F10825DE@agile.tv>
Date: Tue, 06 Mar 2001 16:45:32 +1000
From: Liam Davies <ldavies@agile.tv>
Reply-To: ldavies@oz.agile.tv
MIME-Version: 1.0
Subject: Re: Troubles with TLB refills
References: <3AA30A91.B5842678@agile.tv> <20010305114926.A26862@bacchus.dhis.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010306064532.PqXwlKSdQcRlpLdb54R2Tw_OnKDlggdHreOJEKMlXwA@z>

Ralf,

From the change 1.42 to 1.43 on file arch/mips/kernel/traps.c some code was
added
to copy the EJTAG exception vector

+ /*
+  * Copy the EJTAG debug exception vector handler code to it's final
+  * destination.
+  */
+ memcpy((void *)(KSEG0 + 0x300), &except_vec_ejtag_debug, 0x80);

This code indescriminatly smashes the end of except_vec0_r4600 and
all of except_vec0_nevada handlers with the .fill set to only 0x280
00000000800002d4 T except_vec0_r4600
0000000080000328 T except_vec0_nevada
0000000080000380 T except_vec0_r45k_bvahwbug

I'm not sure under what platform we need to load JTAG support, but we can
just increase the fill area in head.S to say 0x400

Cheers
Liam

=-------------=
Agile TV Corporation
