Message-ID: <000c01bf3da2$dab2a400$e548e8c3@thinkpad>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: EXT2 fs error
Date: Fri, 3 Dec 1999 16:26:42 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Marc Esipovich <marc@mucom.co.il>, e1097757@ceng.metu.edu.tr, linux@cthulhu.engr.sgi.com
Message-ID: <19991203152642.pg97R51jBh8T_GW1Fd6VIyiCywGs-n5Y7cIfdkjSjFw@z>

>On Tue, Nov 30, 1999 at 07:52:04PM +0000, Alan Cox wrote:
>
>> If there is a scsi error before the ext2fs error then yes probably so
>> You are looking for a "media error" probably.
>>
>> > > SCSI bus is being reset for 0 channel 0.
>> > > scsi0 reset. sending SDTR
>> >
>> > SCSI reset is due to repeated attempts to read a block, or I might be
>> > wrong and it it's due to a malfunction of the controller on your HD.
>>
>> You can get it off some working sane hardware if you try and ask for
stupid
>> block numbers. It is worth doing a full fsck on the drive before assuming
>> hardware. Also check the cabling seems sound and is well attached and
that
>> parity is enabled on the controller if the bios sets it.
>
>I've seen this happening on my Indy as well like once every month or even
>more rarely.  It only happens very rarely but it happens.  I think the
>hardware of my Indy is fine as all my attempts to reduce the problems I'm
>experiencing during my development to a hardware problem have failed.
>
>  Ralf

By any chance are you guys seeing this on R5000 Indys?
There is an assumption in arch/mips/mm/r4xx0.c that
flushing the secondary cache automagically flushes
the same address in the primary data cache, but that
assumption is not universally valid and there is no
reason to believe that it is true on the R5K.   This
could cause periodic random corruptions of DMA
transfers, which could in turn manifest themselves
as corrupted files or file system meta-data.  The
R4000/R4400SC systems, and the entry-level
Indy's without secondary caches should not be
at risk.

            Kevin K.
