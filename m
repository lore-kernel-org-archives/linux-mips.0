Message-ID: <01c701c05ee5$587a36a0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A2D60BB.311D4ECA@isratech.ro>
Subject: Re: MIPS ext2fs problem.
Date: Tue, 5 Dec 2000 19:00:58 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Nicu Popovici <octavp@isratech.ro>, linux-mips@oss.sgi.com
Message-ID: <20001205180058.F_g-76p-zeWLpy8msg5TdEPU7lIzblw94qLPD402xzs@z>

> I did port the ATLAS support from linux-2.2.12 kernel into linux-2.2.14
> . I saw that there is a problem, if I reset the computer in an unusual
> way  then at restart it tries to do e2fsck on the hdd. My problem is
> that when I run linux 2.2.14 ( for ATLAS , that we ported ) it get
> stucked in running e2fsck. Do you have any ideea of what is happening ?

Are you using SCSI disks, and if so, did you merge the
SCSI driver from the MIPS 2.2.12 kernel into your 2.2.14
base?  The standard distribution of that driver wasn't 100%
cache safe for MIPS, and probably still isn't.

            Regards,

            Kevin K.
